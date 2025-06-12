{pkgs, ...}: {
  imports = [
    ../../nixosModules/common.nix
    ../../nixosModules/desktop.nix
  ];
  users.users.jessie.password = "jessie";
}
