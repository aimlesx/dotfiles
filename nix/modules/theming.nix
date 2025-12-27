# GTK, Qt, and visual theming
{ ... }:

{
  # XDG user directories
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = "$HOME/Desktop";
    documents = "$HOME/Documents";
    download = "$HOME/Downloads";
    music = "$HOME/Music";
    pictures = "$HOME/Pictures";
    publicShare = "$HOME/Public";
    templates = "$HOME/Templates";
    videos = "$HOME/Videos";
    extraConfig = {
      XDG_SCREENSHOTS_DIR = "$HOME/Screenshots";
    };
  };

  # MIME default applications
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/chrome" = "zen.desktop";
      "text/html" = "zen.desktop";
      "application/x-extension-htm" = "zen.desktop";
      "application/x-extension-html" = "zen.desktop";
      "application/x-extension-shtml" = "zen.desktop";
      "application/xhtml+xml" = "zen.desktop";
      "application/x-extension-xhtml" = "zen.desktop";
      "application/x-extension-xht" = "zen.desktop";
    };
  };

  # Config files for theming
  home.file = {
    # GTK4 CSS (Catppuccin overrides)
    ".config/gtk-4.0/gtk.css".source = ../configs/gtk-4.0/gtk.css;
    ".config/gtk-4.0/gtk-dark.css".source = ../configs/gtk-4.0/gtk-dark.css;

    # Kvantum theme
    ".config/Kvantum/kvantum.kvconfig".source = ../configs/Kvantum/kvantum.kvconfig;

    # Qt config (qt5ct/qt6ct)
    ".config/qt5ct/qt5ct.conf".source = ../configs/qt5ct/qt5ct.conf;
    ".config/qt6ct/qt6ct.conf".source = ../configs/qt6ct/qt6ct.conf;

    # Wofi launcher
    ".config/wofi" = {
      source = ../configs/wofi;
      recursive = true;
    };
  };
}

