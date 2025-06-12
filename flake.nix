{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi";
  };

  outputs = {
    nixpkgs,
    nixos-hardware,
    nixos-raspberrypi,
    self,
  } @ inputs :
  let

    allSystems = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-linux"
    ];

    lib = nixpkgs.lib;

    pkgsFor = lib.genAttrs allSystems (system: import nixpkgs {
      inherit system;
    });

  in {
    nixosConfigurations.jessie-portable = pkgsFor.x86_64-linux.nixos {
      imports = [
        ./machines/jessie-portable/configuration.nix
      ];
    };

    nixosConfigurations.jpi = nixos-raspberrypi.lib.nixosSystem {
      specialArgs = inputs;
      modules = [
        ./machines/jpi/configuration.nix
        nixos-raspberrypi.nixosModules.raspberry-pi-5.base
        nixos-raspberrypi.nixosModules.raspberry-pi-5.display-vc4
        nixos-raspberrypi.nixosModules.raspberry-pi-5.bluetooth
      ];
    };

    packages.x86_64-linux.iso =
      self.nixosConfigurations.jessie-portable.config.system.build.images.iso;

    packages.x86_64-linux.raw =
      self.nixosConfigurations.jessie-portable.config.system.build.images.raw;
  };
}
