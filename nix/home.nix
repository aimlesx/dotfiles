# Home Manager configuration
{ config, pkgs, ... }:

{
  imports = [
    ./modules/cli.nix
    ./modules/shell.nix
    ./modules/terminal.nix
    ./modules/editor.nix
    ./modules/desktop.nix
    ./modules/zsh.nix
    ./modules/theming.nix
    ./modules/ide.nix
  ];

  home.username = "aimless";
  home.homeDirectory = "/home/aimless";
  home.stateVersion = "24.11";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
