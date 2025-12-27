# Dotfiles Repository

Personal configuration files managed with [Nix Home Manager](https://github.com/nix-community/home-manager) (primary) and [GNU Stow](https://www.gnu.org/software/stow/) (legacy).

## Structure

The active configuration is in `nix/`. Legacy stow packages remain in top-level directories but are deprecated.

### Nix Home Manager (Active)

```
nix/
├── flake.nix       # Flake inputs (nixpkgs, home-manager)
├── flake.lock      # Pinned versions
├── home.nix        # Main configuration (imports modules)
├── modules/        # Modular configuration
│   ├── cli.nix     # CLI tools and packages
│   ├── shell.nix   # fzf, bat, eza, direnv, starship
│   ├── terminal.nix # Kitty configuration
│   ├── editor.nix  # Neovim configuration
│   ├── desktop.nix # Hypr, Rofi, Dunst configs
│   ├── zsh.nix     # Zsh shell with Oh-My-Zsh
│   ├── theming.nix # GTK, Qt, Kvantum, Wofi, XDG
│   ├── ide.nix     # Cursor, VS Code, Roocode
│   └── git.nix     # Git, SSH, GPG
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
| `zsh` | programs.zsh | Native module with Oh-My-Zsh |
| `gtk` | home.file | `nix/configs/gtk-4.0/` |
| `kvantum` | home.file | `nix/configs/Kvantum/` |
| `qt` | home.file | `nix/configs/qt5ct/`, `qt6ct/` |
| `wofi` | home.file | `nix/configs/wofi/` |
| `mimeapps` | xdg.mimeApps | Native module |
| `user-dirs` | xdg.userDirs | Native module |
| `cursor` | home.file | `nix/configs/cursor/` |
| `vscode` | home.file | `nix/configs/vscode/` |
| `roocode` | home.file | `nix/configs/roocode/` |
| `git` | programs.git | Native module |
| `ssh` | programs.ssh | Native module |
| `gpg` | programs.gpg + services.gpg-agent | Native module |

## Native Program Modules

These use Home Manager's native modules with shell integration:

- `programs.fzf` - Fuzzy finder
- `programs.bat` - Better cat (Catppuccin theme)
- `programs.eza` - Modern ls
- `programs.direnv` - Directory environments (nix-direnv)
- `programs.starship` - Shell prompt
- `programs.kitty` - Terminal (Tokyo Night theme)
- `programs.neovim` - Editor (default $EDITOR)
- `programs.zsh` - Shell with Oh-My-Zsh integration
- `programs.git` - Version control with GPG signing
- `programs.delta` - Git pager with side-by-side diffs
- `programs.ssh` - SSH client with host configurations
- `programs.gpg` - GPG key management
- `services.gpg-agent` - GPG agent with pinentry
- `xdg.mimeApps` - Default applications
- `xdg.userDirs` - XDG user directories

## Legacy Stow Packages (Not Migrated)

These remain as stow packages and are actively used:

| Package | Description |
|---------|-------------|
| `htop` | Process viewer (user preference) |
| `pcmanfm-qt` | File manager settings |
| `wob` | Wayland overlay bar for volume/brightness |

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
