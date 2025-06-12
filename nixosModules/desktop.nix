{pkgs, ...}: {
  services.xserver.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.xkbOptions = "ctrl:swapcaps";

  environment.systemPackages = with pkgs; [
    firefox
  ];
}
