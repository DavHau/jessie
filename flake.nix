{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    nixpkgs,
    self,
  } @ inputs :
  let

    allSystems = [
      "aarch64-darwin"
      "x86_64-linux"
    ];

    lib = nixpkgs.lib;

    pkgsFor = lib.genAttrs allSystems (system: import nixpkgs {
      inherit system;
    });

  in {
    nixosModules.jessie-portable = ./machines/jessie-portable/configuration.nix;

    nixosConfigurations.jessie-portable = pkgsFor.x86_64-linux.nixos {
      imports = [
        self.nixosModules.jessie-portable
      ];
    };

    packages.x86_64-linux.iso =
      self.nixosConfigurations.jessie-portable.config.system.build.images.iso;

    packages.x86_64-linux.raw =
      self.nixosConfigurations.jessie-portable.config.system.build.images.raw;
  };
}
