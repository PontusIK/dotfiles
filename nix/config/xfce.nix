{ config, pkgs, callPackage, ... }:

{

  nixpkgs.config.pulseaudio = true;

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    windowManager.i3.enable = true;
    displayManager.lightdm.enable = true;
  };
  services.displayManager.defaultSession = "xfce";

}
