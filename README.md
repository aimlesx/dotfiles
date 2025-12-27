# Dotfiles

Personal configuration files for a Hyprland-based Linux desktop environment.

## Configuration Management

This repository is **fully managed by Nix Home Manager**.

## Quick Start

### Prerequisites

- [Nix](https://nixos.org/download.html) with flakes enabled
- Home Manager (bootstrapped via flake)

### Deploy Configuration

```bash
cd ~/dotfiles/nix
home-manager switch --flake '.#aimless'
```

### Update Packages

```bash
cd ~/dotfiles/nix
nix flake update
home-manager switch --flake '.#aimless'
```

## Nix Configuration

The primary configuration lives in `nix/`:

```
nix/
├── flake.nix           # Flake definition (inputs: nixpkgs, home-manager)
├── flake.lock          # Pinned versions
├── home.nix            # Home Manager configuration (imports modules)
├── modules/            # Modular configuration
│   ├── cli.nix         # CLI tools and packages
│   ├── shell.nix       # fzf, bat, eza, direnv, starship
│   ├── terminal.nix    # Kitty terminal
│   ├── editor.nix      # Neovim
│   ├── desktop.nix     # Hyprland, Rofi, Dunst
│   ├── zsh.nix         # Zsh with Oh-My-Zsh
│   ├── theming.nix     # GTK, Qt, Kvantum, Wofi, XDG
│   ├── ide.nix         # Cursor, VS Code, Roocode
│   └── git.nix         # Git, SSH, GPG
└── configs/            # Config files managed by home.file
```

### Programs (Native Modules)

| Program | Description | Shell Integration |
|---------|-------------|-------------------|
| `fzf` | Fuzzy finder | Ctrl+R, Ctrl+T |
| `bat` | Better cat | Catppuccin theme |
| `eza` | Modern ls | Aliases enabled |
| `direnv` | Directory envs | nix-direnv enabled |
| `starship` | Shell prompt | Auto-initialized |
| `kitty` | Terminal | Tokyo Night theme |
| `neovim` | Editor | Default $EDITOR |
| `zsh` | Shell | Oh-My-Zsh with plugins |
| `git` | Version control | Delta integration, GPG signing |
| `ssh` | SSH client | GitHub/GitLab hosts configured |
| `gpg` | GPG | pinentry-gnome3, gpg-agent |
| `delta` | Git pager | Side-by-side diffs |

### Packages

CLI tools installed via `home.packages`:

- `fd`, `htop`, `lazygit`, `delta`, `dust`, `duf`, `yq`
- `gh`, `httpie`, `tldr`, `tree`, `unzip`

### Config Files

Configurations managed via `home.file`:

| Config | Source | Notes |
|--------|--------|-------|
| Starship | `configs/starship.toml` | Custom prompt |
| btop | `configs/btop.conf` | System monitor |
| Dunst | `configs/dunstrc` | Notification daemon |
| Fastfetch | `configs/fastfetch.jsonc` | System info |
| Hyprland | `configs/hypr/` | Compositor + Waybar |
| Neovim | `configs/nvim/` | Lazy.nvim plugins |
| Rofi | `configs/rofi/` | Application launcher |
| Wofi | `configs/wofi/` | Wayland launcher |
| GTK | `configs/gtk-4.0/` | GTK4 CSS theming |
| Kvantum | `configs/Kvantum/` | Qt theme engine |
| Qt | `configs/qt5ct/`, `qt6ct/` | Qt settings |
| Cursor | `configs/cursor/` | IDE settings |
| VS Code | `configs/vscode/` | IDE settings |
| Roocode | `configs/roocode/` | AI rules |
| htop | `configs/htoprc` | Process viewer |
| PCManFM-Qt | `configs/pcmanfm-qt/` | File manager |
| wob | `configs/wob.ini` | Volume/brightness overlay |

### XDG (Native Modules)

- `xdg.mimeApps` - Default applications (Zen Browser)
- `xdg.userDirs` - XDG directories (Desktop, Documents, etc.)

## Desktop Environment

### Hyprland

- **Monitors**: Dual 1440p setup
- **Workspaces**: 1-5 on main, 6-10 on secondary
- **Key bindings**: Super as mod key

| Keybind | Action |
|---------|--------|
| `Super + Return` | Open Kitty |
| `Super + Q` | Close window |
| `Super + X` | Open Wofi |
| `Super + 1-0` | Switch workspace |
| `Print` | Screenshot |

### Kitty Terminal

- **Font**: JetBrainsMono Nerd Font Mono (18pt)
- **Theme**: Tokyo Night
- **Opacity**: 80% with blur

## Neovim

Lazy.nvim-managed configuration with 20+ plugins:

- **LSP**: Full language server support
- **Treesitter**: Syntax highlighting
- **Telescope**: Fuzzy finder
- **Neo-tree**: File explorer
- **Catppuccin**: Color scheme

## Shell (Zsh)

Managed by `programs.zsh` with:

- **Oh-My-Zsh**: Plugins (git, docker, kubectl, gh, gpg-agent)
- **zsh-fzf-tab**: Fuzzy completion
- **Autosuggestions**: Native module
- **Syntax highlighting**: Native module

## Useful Commands

```bash
# Apply Home Manager changes
home-manager switch --flake '~/dotfiles/nix#aimless'

# View generations (for rollback)
home-manager generations

# Rollback to previous generation
home-manager switch --flake '~/dotfiles/nix#aimless' --rollback

# Garbage collect old generations
nix-collect-garbage -d

# Update flake inputs
nix flake update
```

## License

Personal configuration - use at your own discretion.
