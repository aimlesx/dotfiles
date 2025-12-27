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

  # Native program modules (with shell integration)
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "Catppuccin-mocha";
    };
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    git = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  # Kitty terminal (native module)
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 18;
    };
    settings = {
      background_opacity = "0.8";
      background_blur = 8;
      window_padding_width = 6;
      enabled_layouts = "splits:split_axis=auto";
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      notify_on_cmd_finish = "invisible 15";
      allow_remote_control = "yes";
      confirm_os_window_close = 0;
    };
    extraConfig = ''
      # Tokyo Night theme
      background #1a1b26
      foreground #c0caf5
      selection_background #283457
      selection_foreground #c0caf5
      url_color #73daca
      cursor #c0caf5
      cursor_text_color #1a1b26

      # Tabs
      active_tab_background #7aa2f7
      active_tab_foreground #16161e
      inactive_tab_background #292e42
      inactive_tab_foreground #545c7e

      # Windows
      active_border_color #7aa2f7
      inactive_border_color #292e42

      # Colors
      color0 #15161e
      color1 #f7768e
      color2 #9ece6a
      color3 #e0af68
      color4 #7aa2f7
      color5 #bb9af7
      color6 #7dcfff
      color7 #a9b1d6
      color8 #414868
      color9 #f7768e
      color10 #9ece6a
      color11 #e0af68
      color12 #7aa2f7
      color13 #bb9af7
      color14 #7dcfff
      color15 #c0caf5
      color16 #ff9e64
      color17 #db4b4b

      # Keyboard shortcuts
      kitty_mod ctrl+shift

      action_alias launch_tab launch --type=tab --cwd=current
      map f1 launch_tab nvim

      map ctrl+c copy_and_clear_or_interrupt
      map ctrl+v paste_from_clipboard

      map kitty_mod+up scroll_line_up
      map kitty_mod+k scroll_line_up
      map kitty_mod+down scroll_line_down
      map kitty_mod+j scroll_line_down

      map kitty_mod+page_up scroll_page_up
      map kitty_mod+page_down scroll_page_down
      map kitty_mod+home scroll_home
      map kitty_mod+end scroll_end

      map kitty_mod+z scroll_to_prompt -1
      map kitty_mod+x scroll_to_prompt 1

      map kitty_mod+g show_last_command_output

      map kitty_mod+enter new_window
      map kitty_mod+d>enter new_window_with_cwd

      map kitty_mod+q close_window

      map kitty_mod+h neighboring_window left
      map kitty_mod+j neighboring_window down
      map kitty_mod+k neighboring_window up
      map kitty_mod+l neighboring_window right

      map kitty_mod+r start_resizing_window

      map kitty_mod+] next_tab
      map kitty_mod+tab next_tab

      map kitty_mod+[ previous_tab

      map kitty_mod+t new_tab !neighbor
      map kitty_mod+d>t new_tab_with_cwd !neighbor
      map kitty_mod+w close_tab

      map kitty_mod+alt+t set_tab_title

      map kitty_mod+1 goto_tab 1
      map kitty_mod+2 goto_tab 2
      map kitty_mod+3 goto_tab 3
      map kitty_mod+4 goto_tab 4
      map kitty_mod+5 goto_tab 5
      map kitty_mod+6 goto_tab 6
      map kitty_mod+7 goto_tab 7
      map kitty_mod+8 goto_tab 8
      map kitty_mod+9 goto_tab 9
      map kitty_mod+0 goto_tab 10

      map kitty_mod+equal change_font_size all +2.0
      map kitty_mod+plus change_font_size all +2.0
      map kitty_mod+kp_add change_font_size all +2.0

      map kitty_mod+minus change_font_size all -2.0
      map kitty_mod+kp_subtract change_font_size all -2.0

      map kitty_mod+f11 toggle_fullscreen
      map kitty_mod+u kitten unicode_input
      map kitty_mod+f2 edit_config_file
      map kitty_mod+f5 load_config_file
    '';
  };

  # Neovim (native module with Lazy.nvim config)
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  # Config files (migrated from stow)
  home.file = {
    ".config/starship.toml".source = ./configs/starship.toml;
    ".config/btop/btop.conf".source = ./configs/btop.conf;
    ".config/fastfetch/config.jsonc".source = ./configs/fastfetch.jsonc;
    ".config/dunst/dunstrc".source = ./configs/dunstrc;

    # Hyprland + Waybar (recursive directory)
    ".config/hypr" = {
      source = ./configs/hypr;
      recursive = true;
    };

    # Rofi
    ".config/rofi" = {
      source = ./configs/rofi;
      recursive = true;
    };

    # Electron/Code flags
    ".config/electron-flags.conf".source = ./configs/electron-flags.conf;
    ".config/code-flags.conf".source = ./configs/code-flags.conf;
    ".config/codium-flags.conf".source = ./configs/codium-flags.conf;
    ".config/chrome-flags.conf".source = ./configs/chrome-flags.conf;

    # Neovim config (Lazy.nvim managed)
    ".config/nvim" = {
      source = ./configs/nvim;
      recursive = true;
    };
  };
}

