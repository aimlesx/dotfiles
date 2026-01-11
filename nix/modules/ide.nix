# IDE configurations: Cursor, VS Code, Roocode
{ lib, ... }:

let
  cursorSettingsSource = ../configs/cursor/settings.json;
  cursorKeybindingsSource = ../configs/cursor/keybindings.json;
in
{
  home.file = {
    # Cursor keybindings (symlink is fine for this)
    ".config/Cursor/User/keybindings.json".source = cursorKeybindingsSource;

    # VS Code / Code OSS
    ".config/Code/User/settings.json".source = ../configs/vscode/settings.json;
    ".config/Code - OSS/User/settings.json".source = ../configs/vscode/settings.json;

    # Roocode rules and indexing
    ".roo" = {
      source = ../configs/roocode/.roo;
      recursive = true;
    };
    ".config/roocode-indexing" = {
      source = ../configs/roocode/roocode-indexing;
      recursive = true;
    };
  };

  # Copy Cursor settings instead of symlinking so Cursor can modify it
  # Changes made in Cursor will persist until next `home-manager switch`
  home.activation.copyCursorSettings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    $DRY_RUN_CMD mkdir -p $HOME/.config/Cursor/User
    $DRY_RUN_CMD cp -f ${cursorSettingsSource} $HOME/.config/Cursor/User/settings.json
    $DRY_RUN_CMD chmod 644 $HOME/.config/Cursor/User/settings.json
  '';
}

