{ pkgs, ... }: 

{

  services = {
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;
  };

  environment.systemPackages = with pkgs; [
    cosmic-bg
    cosmic-osd
    cosmic-idle
    cosmic-edit
    cosmic-comp
    cosmic-randr
    cosmic-panel
    cosmic-icons
    cosmic-files
    cosmic-player
    cosmic-session
    cosmic-applets
    cosmic-ext-ctl
    cosmic-settings
    cosmic-launcher
    cosmic-wallpapers
    cosmic-screenshot
    cosmic-ext-tweaks
    cosmic-applibrary
    cosmic-design-demo
    cosmic-notifications
    cosmic-ext-calculator
    cosmic-settings-daemon
    cosmic-workspaces-epoch
    xdg-desktop-portal-cosmic
    tasks
  ];

}
