# Home Manager configuration
{ config, pkgs, nixgl, ... }:

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
    ./modules/git.nix
  ];

  home.username = "aimless";
  home.homeDirectory = "/home/aimless";
  home.stateVersion = "24.11";

  # NixGL for OpenGL/GPU support on non-NixOS
  targets.genericLinux.nixGL = {
    packages = nixgl.packages;
    defaultWrapper = "mesa";
    installScripts = [ "mesa" ];
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
