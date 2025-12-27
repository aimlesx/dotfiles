# Dotfiles Repository

Personal configuration files managed with [Nix Home Manager](https://github.com/nix-community/home-manager) (primary) and [GNU Stow](https://www.gnu.org/software/stow/) (legacy).

## Structure

The active configuration is in `nix/`. Legacy stow packages remain in top-level directories but are deprecated.

### Nix Home Manager (Active)

```
nix/
├── flake.nix       # Flake inputs (nixpkgs, home-manager)
├── flake.lock      # Pinned versions
├── home.nix        # Main configuration
└── configs/        # Config files (symlinked via home.file)
```

### Deploy Configuration

```bash
cd ~/dotfiles/nix
home-manager switch --flake '.#aimless'
```

## Migrated Packages (Nix)

These are now managed by Home Manager:

| Package | Method | Location |
|---------|--------|----------|
| `btop` | home.file | `nix/configs/btop.conf` |
| `dunst` | home.file | `nix/configs/dunstrc` |
| `fastfetch` | home.file | `nix/configs/fastfetch.jsonc` |
| `hypr` | home.file (recursive) | `nix/configs/hypr/` |
| `kitty` | programs.kitty | Native module in home.nix |
| `nvim` | programs.neovim + home.file | `nix/configs/nvim/` |
| `rofi` | home.file | `nix/configs/rofi/` |
| `starship` | programs.starship + home.file | `nix/configs/starship.toml` |

## Native Program Modules

These use Home Manager's native modules with shell integration:

- `programs.fzf` - Fuzzy finder
- `programs.bat` - Better cat (Catppuccin theme)
- `programs.eza` - Modern ls
- `programs.direnv` - Directory environments (nix-direnv)
- `programs.starship` - Shell prompt
- `programs.kitty` - Terminal (Tokyo Night theme)
- `programs.neovim` - Editor (default $EDITOR)

## Legacy Stow Packages (Not Migrated)

These remain as stow packages and are NOT actively deployed:

| Package | Description |
|---------|-------------|
| `cursor` | Cursor IDE settings |
| `gtk` | GTK theming |
| `htop` | Process viewer |
| `kvantum` | Qt theme engine |
| `libfm` | File manager library |
| `mimeapps` | Default applications |
| `nwg-wrapper` | Wayland widget wrapper |
| `pcmanfm-qt` | File manager |
| `profile.d` | Shell profile scripts |
| `qt` | Qt settings |
| `roocode` | Roo Code extension |
| `sworkstyle` | Workspace icons/styling |
| `user-dirs` | XDG user directories |
| `vscode` | VS Code settings |
| `wob` | Wayland overlay bar |
| `wofi` | Wayland launcher |
| `zsh` | Zsh shell config (Oh-My-Zsh) |

## Legacy Stow Usage

```bash
# Deploy a legacy package
stow <package>

# Remove a package
stow -D <package>
```

## Key Commands

```bash
# Apply Home Manager config
home-manager switch --flake '~/dotfiles/nix#aimless'

# View generations
home-manager generations

# Rollback
home-manager switch --flake '~/dotfiles/nix#aimless' --rollback

# Update flake
nix flake update
```
