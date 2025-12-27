# Zsh shell configuration
{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    # Enable shell integrations
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    # History settings
    history = {
      path = "$HOME/.config/zsh/.zsh_history";
      size = 10000;
      save = 10000;
      ignoreDups = true;
      share = true;
    };

    # Oh-My-Zsh configuration
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "gpg-agent"
        "git"
        "docker"
        "kubectl"
        "gh"
      ];
    };

    # Additional plugins from Nix
    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
    ];

    # Shell aliases
    shellAliases = {
      df = "df -h";
      free = "free -m";
      ls = "ls --color=auto";
      # eza aliases (from shell.nix integration)
      ll = "eza -la";
      la = "eza -a";
      lt = "eza --tree";
    };

    # Session variables
    sessionVariables = {
      PNPM_HOME = "$HOME/.local/share/pnpm";
    };

    # Profile extra (runs in .zprofile)
    profileExtra = ''
      # Node memory limit
      export NODE_OPTIONS=--max-old-space-size=8192
    '';

    # Init content (runs in .zshrc after oh-my-zsh)
    initContent = ''
      # Add local bin to PATH
      export PATH="$HOME/.local/bin:$PATH"

      # pnpm path
      case ":$PATH:" in
        *":$PNPM_HOME:"*) ;;
        *) export PATH="$PNPM_HOME:$PATH" ;;
      esac

      # fnm: fast Node manager (if installed)
      (( $+commands[fnm] )) && eval "$(fnm env --shell zsh --use-on-cd)"

      # Tool completions (only for tools without OMZ plugins)
      (( $+commands[pnpm] ))  && eval "$(pnpm completion zsh)"
      (( $+commands[ngrok] )) && eval "$(ngrok completion zsh)"

      # z - jump around (system package)
      [[ -f /usr/share/z/z.sh ]] && source /usr/share/z/z.sh

      # mise (if installed)
      (( $+commands[mise] )) && eval "$(mise activate zsh)"
    '';
  };

}

