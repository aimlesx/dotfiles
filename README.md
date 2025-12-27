# Dotfiles

Personal configuration files for a Hyprland-based Linux desktop environment.

## Configuration Management

This repository uses **two configuration systems** during migration:

| System | Status | Location |
|--------|--------|----------|
| **Nix Home Manager** | Primary (active) | `nix/` |
| **GNU Stow** | Legacy (deprecated) | Top-level directories |

### Current Setup

The active configuration is managed by [Nix Home Manager](https://github.com/nix-community/home-manager) with flakes. Legacy Stow packages remain in the repository but are no longer deployed.

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
├── home.nix            # Home Manager configuration
└── configs/            # Config files managed by home.file
    ├── btop.conf
    ├── dunstrc
    ├── fastfetch.jsonc
    ├── starship.toml
    ├── hypr/           # Hyprland + Waybar + scripts
    ├── nvim/           # Neovim + Lazy.nvim
    └── rofi/
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

## Legacy Stow Packages

These directories are **no longer deployed** but kept for reference:

| Package | Status | Notes |
|---------|--------|-------|
| `btop/` | Migrated | → `nix/configs/btop.conf` |
| `dunst/` | Migrated | → `nix/configs/dunstrc` |
| `fastfetch/` | Migrated | → `nix/configs/fastfetch.jsonc` |
| `hypr/` | Migrated | → `nix/configs/hypr/` |
| `kitty/` | Migrated | → `programs.kitty` in home.nix |
| `nvim/` | Migrated | → `nix/configs/nvim/` |
| `rofi/` | Migrated | → `nix/configs/rofi/` |
| `starship/` | Migrated | → `nix/configs/starship.toml` |
| `cursor/` | Not migrated | IDE settings |
| `gtk/` | Not migrated | GTK theming |
| `kvantum/` | Not migrated | Qt theming |
| `vscode/` | Not migrated | VS Code settings |
| `wofi/` | Not migrated | Wayland launcher |
| `zsh/` | Not migrated | Shell config (uses Oh-My-Zsh) |

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
├── btop/        → /nix/store/.../btop/
├── dunst/       → /nix/store/.../dunst/
├── fastfetch/   → /nix/store/.../fastfetch/
└── starship.toml → /nix/store/.../starship.toml
```

## License

Personal configuration - use at your own discretion.

