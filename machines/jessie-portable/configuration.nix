{pkgs, ...}: {
  imports = [
    ../../nixosModules/common.nix
    ../../nixosModules/desktop.nix
  ];
  hardware.enableAllHardware = true;
  hardware.enableRedistributableFirmware = true;
  users.users.jessie.password = "jessie";
}
