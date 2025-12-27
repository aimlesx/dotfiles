# Desktop configs: Hyprland, Rofi, Dunst, etc.
{ ... }:

{
  home.file = {
    # Btop
    ".config/btop/btop.conf".source = ../configs/btop.conf;

    # Fastfetch
    ".config/fastfetch/config.jsonc".source = ../configs/fastfetch.jsonc;

    # Dunst
    ".config/dunst/dunstrc".source = ../configs/dunstrc;

    # Hyprland + Waybar (recursive directory)
    ".config/hypr" = {
      source = ../configs/hypr;
      recursive = true;
    };

    # Rofi
    ".config/rofi" = {
      source = ../configs/rofi;
      recursive = true;
    };

    # Electron/Code flags for Wayland
    ".config/electron-flags.conf".source = ../configs/electron-flags.conf;
    ".config/code-flags.conf".source = ../configs/code-flags.conf;
    ".config/codium-flags.conf".source = ../configs/codium-flags.conf;
    ".config/chrome-flags.conf".source = ../configs/chrome-flags.conf;
  };
}

