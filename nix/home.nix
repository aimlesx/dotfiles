{ config, pkgs, ... }:

{
  home.username = "aimless";
  home.homeDirectory = "/home/aimless";
  home.stateVersion = "24.11";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # Modern CLI tools
    fd              # Better find
    fzf             # Fuzzy finder
    bat             # Better cat with syntax highlighting
    eza             # Modern ls replacement
    htop            # Interactive process viewer
    lazygit         # Git TUI
    delta           # Better git diff
    dust            # Better du (disk usage)
    duf             # Better df (disk free)
    yq              # YAML processor (like jq for YAML)

    # Development
    gh              # GitHub CLI
    httpie          # Modern curl alternative

    # Utilities
    tldr            # Simplified man pages
    tree            # Directory tree view
    unzip           # Archive extraction

    # Keep test package for now
    cowsay
  ];

  # Config files (migrated from stow)
  home.file = {
    ".config/starship.toml".source = ./configs/starship.toml;
    ".config/btop/btop.conf".source = ./configs/btop.conf;
    ".config/fastfetch/config.jsonc".source = ./configs/fastfetch.jsonc;
    ".config/dunst/dunstrc".source = ./configs/dunstrc;
  };
}

