# Neovim configuration
{ ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  # Neovim config (Lazy.nvim managed)
  home.file.".config/nvim" = {
    source = ../configs/nvim;
    recursive = true;
  };
}

