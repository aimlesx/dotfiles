{ config, pkgs, ... }:

{
  home.username = "aimless";
  home.homeDirectory = "/home/aimless";
  home.stateVersion = "24.11";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # Test package - we'll remove this later
  home.packages = with pkgs; [
    cowsay
  ];
}

