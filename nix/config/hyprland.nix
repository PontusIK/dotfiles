{ pkgs, ... }:

{

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "where_is_my_sddm_theme";
    };
  };

  environment.systemPackages = with pkgs; [
    where-is-my-sddm-theme
    hyprpaper
  ];

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      #      xwayland.enable = true;
    };

    uwsm = {
      enable = true;
      waylandCompositors.hyprland = {
        prettyName = "Hyprland";
        binPath = "/run/current-system/sw/bin/Hyprland";
      };
    };
    hyprlock.enable = true;
    waybar.enable = true;
  };

  services.hypridle.enable = true;

}
