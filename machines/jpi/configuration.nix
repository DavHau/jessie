{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../nixosModules/common.nix
    ../../nixosModules/desktop.nix
  ];

  networking.hostName = "jpi";
  system.stateVersion = "25.05";

  users.users.jessie.password = "jessie";
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDuhpzDHBPvn8nv8RH1MRomDOaXyP4GziQm7r3MZ1Syk dave"
  ];

  time.timeZone = "Asia/Bangkok";
}
