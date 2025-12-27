# Dotfiles

Personal configuration files for a Hyprland-based Linux desktop environment.

## Configuration Management

This repository is **fully managed by Nix Home Manager**. Legacy Stow packages have been migrated.

| System | Status | Location |
|--------|--------|----------|
| **Nix Home Manager** | Primary (active) | `nix/` |
| **GNU Stow** | Legacy (deprecated) | Top-level directories |

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
│   └── theming.nix     # GTK, Qt, Kvantum, Wofi, XDG
└── configs/            # Config files managed by home.file
    ├── btop.conf
    ├── dunstrc
    ├── fastfetch.jsonc
    ├── starship.toml
    ├── hypr/           # Hyprland + Waybar + scripts
    ├── nvim/           # Neovim + Lazy.nvim
    ├── rofi/           # Application launcher
    ├── wofi/           # Wayland launcher
    ├── gtk-4.0/        # GTK CSS
    ├── Kvantum/        # Qt theme
    ├── qt5ct/          # Qt5 settings
    └── qt6ct/          # Qt6 settings
```

### Programs (Native Modules)

These programs are fully managed by Home Manager with shell integration:

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

### Packages

CLI tools installed via `home.packages`:

- `fd`, `htop`, `lazygit`, `delta`, `dust`, `duf`, `yq`
- `gh`, `httpie`, `tldr`, `tree`, `unzip`

### Config Files

Configurations managed via `home.file` (symlinked to Nix store):

| Config | Source | Notes |
|--------|--------|-------|
| Starship | `configs/starship.toml` | Custom prompt with Nerd Font icons |
| btop | `configs/btop.conf` | System monitor |
| Dunst | `configs/dunstrc` | Notification daemon |
| Fastfetch | `configs/fastfetch.jsonc` | System info |
| Hyprland | `configs/hypr/` | Compositor + Waybar + scripts |
| Neovim | `configs/nvim/` | Lazy.nvim plugin manager |
| Rofi | `configs/rofi/` | Application launcher |
| Wofi | `configs/wofi/` | Wayland launcher |
| GTK | `configs/gtk-4.0/` | GTK4 CSS theming |
| Kvantum | `configs/Kvantum/` | Qt theme engine |
| Qt | `configs/qt5ct/`, `qt6ct/` | Qt settings |

### XDG (Native Modules)

- `xdg.mimeApps` - Default applications (Zen Browser)
- `xdg.userDirs` - XDG directories (Desktop, Documents, etc.)

## Desktop Environment

### Hyprland

- **Monitors**: Dual 1440p setup (Gigabyte G32QC + ASUS XG27UCG)
- **Workspaces**: 1-5 on main, 6-10 on secondary
- **Key bindings**: Super as mod key

| Keybind | Action |
|---------|--------|
| `Super + Return` | Open Kitty |
| `Super + Q` | Close window |
| `Super + X` | Open Wofi |
| `Super + 1-0` | Switch workspace |
| `Super + Shift + 1-0` | Move to workspace |
| `Print` | Screenshot |

### Waybar

Modular configuration in `configs/hypr/component/waybar/`:

- Workspaces, clock, system stats, media controls
- Network, pulseaudio, tray
- Custom styling with CSS variables

### Kitty Terminal

- **Font**: JetBrainsMono Nerd Font Mono (18pt)
- **Theme**: Tokyo Night
- **Opacity**: 80% with blur
- **Layout**: Splits

## Neovim

Lazy.nvim-managed configuration with 20+ plugins:

- **LSP**: Full language server support
- **Treesitter**: Syntax highlighting
- **Telescope**: Fuzzy finder
- **Neo-tree**: File explorer
- **Catppuccin**: Color scheme
- **Completions**: nvim-cmp based

Plugin lockfile: `configs/nvim/lazy-lock.json`

## Shell (Zsh)

Managed by `programs.zsh` with:

- **Oh-My-Zsh**: Plugins (git, docker, kubectl, gh, gpg-agent)
- **zsh-fzf-tab**: Fuzzy completion via Nix
- **Autosuggestions**: Native module
- **Syntax highlighting**: Native module
- **Starship**: Prompt integration

## Legacy Stow Packages

These directories are **no longer deployed** and kept for reference only:

| Package | Status | Notes |
|---------|--------|-------|
| `cursor/` | Not migrated | IDE settings (not in nixpkgs) |
| `htop/` | Deprecated | Using btop instead |
| `libfm/` | Not migrated | File manager library |
| `nwg-wrapper/` | Not migrated | Wayland widget |
| `pcmanfm-qt/` | Not migrated | File manager |
| `profile.d/` | Not migrated | Shell profiles |
| `roocode/` | Not migrated | AI extension config |
| `sworkstyle/` | Not migrated | Old workspace setup |
| `vscode/` | Not migrated | VS Code settings |
| `wob/` | Deprecated | Using Waybar instead |

### Using Legacy Stow

If needed, deploy a stow package:

```bash
cd ~/dotfiles
stow <package>      # Deploy
stow -D <package>   # Remove
```

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

# Check flake
nix flake check
```

## File Locations

After deployment, configs are symlinked:

```
~/.config/
├── hypr/        → /nix/store/.../hypr/
├── kitty/       → /nix/store/.../kitty/
├── nvim/        → /nix/store/.../nvim/
├── rofi/        → /nix/store/.../rofi/
├── wofi/        → /nix/store/.../wofi/
├── btop/        → /nix/store/.../btop/
├── dunst/       → /nix/store/.../dunst/
├── fastfetch/   → /nix/store/.../fastfetch/
├── gtk-4.0/     → /nix/store/.../gtk-4.0/
├── Kvantum/     → /nix/store/.../Kvantum/
├── qt5ct/       → /nix/store/.../qt5ct/
├── qt6ct/       → /nix/store/.../qt6ct/
├── zsh/         → /nix/store/.../zsh/
└── starship.toml → /nix/store/.../starship.toml
```

## License

Personal configuration - use at your own discretion.
