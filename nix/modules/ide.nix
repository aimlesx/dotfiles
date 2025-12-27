# IDE configurations: Cursor, VS Code, Roocode
{ ... }:

{
  home.file = {
    # Cursor IDE
    ".config/Cursor/User/settings.json".source = ../configs/cursor/settings.json;
    ".config/Cursor/User/keybindings.json".source = ../configs/cursor/keybindings.json;

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
}

