{pkgs, ...}: {
  # users
  users.mutableUsers = false;
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC0phC/CSTdXqP/vvoCLHA5ZDpfnOJsTQzqpBU3F4qvB"
  ];
  users.users.jessie.isNormalUser = true;
  users.users.jessie.extraGroups = [ "wheel" ];

  services.ntp.enable = true;

  # networking
  services.resolved.enable = true;
  networking.networkmanager.enable = true;
  services.zerotierone = {
    enable = true;
    joinNetworks = [ "93AFAE59632EFB13" ];
  }

  # ssh
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    vim
  ];

  zramSwap.enable = true;
}
