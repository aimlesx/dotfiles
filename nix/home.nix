# Home Manager configuration
{ config, pkgs, ... }:

{
  imports = [
    ./modules/cli.nix
    ./modules/shell.nix
    ./modules/terminal.nix
    ./modules/editor.nix
    ./modules/desktop.nix
  ];

  home.username = "aimless";
  home.homeDirectory = "/home/aimless";
  home.stateVersion = "24.11";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
