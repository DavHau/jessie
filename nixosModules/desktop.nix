{pkgs, ...}: {
  services.xserver.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.xkbOptions = "caps:ctrl_modifier";

  environment.systemPackages = with pkgs; [
    firefox
    blueberry
  ];

  # audio
  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.pulse.enable = true;
  security.rtkit.enable = true;
}
