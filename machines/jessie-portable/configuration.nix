{pkgs, ...}: {
  hardware.enableAllHardware = true;
  hardware.enableRedistributableFirmware = true;

  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.enable = true;

  users.mutableUsers = false;
  users.users.jessie.password = "jessie";
  users.users.jessie.isNormalUser = true;
  users.users.jessie.extraGroups = [ "wheel" ];
}
