# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ pkgs, ... }:

let
  py-devenv = pkgs.writeShellScriptBin "py-devenv" ''
    cd /mnt/c/Users/Pontus/Project/python
    nix develop ~/dotfiles/nix#python
  '';

  java-devenv = pkgs.writeShellScriptBin "java-devenv" ''
    cd /mnt/c/Users/Pontus/Project/java
    nix develop ~/dotfiles/nix#java
  '';
in {
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules> # --impure
    ./nvf.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  environment.systemPackages = with pkgs; [
    xclip
    gitFull
    tree
    py-devenv
    java-devenv
  ];

  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
