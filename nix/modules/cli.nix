# CLI tools and packages
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Modern CLI tools
    fd              # Better find
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
  ];
}

