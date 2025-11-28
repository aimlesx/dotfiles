# Dotfiles Repository

Personal configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

Each directory is a stow package that symlinks into `~` when deployed with `stow <package>`.

## Packages

| Package | Description |
|---------|-------------|
| `btop` | System resource monitor |
| `cursor` | Cursor IDE settings |
| `dunst` | Notification daemon |
| `fastfetch` | System info display |
| `gtk` | GTK theming |
| `htop` | Process viewer |
| `hypr` | Hyprland compositor |
| `kitty` | Terminal emulator |
| `kvantum` | Qt theme engine |
| `libfm` | File manager library |
| `mimeapps` | Default applications |
| `nvim` | Neovim editor |
| `nwg-wrapper` | Wayland widget wrapper |
| `pcmanfm-qt` | File manager |
| `profile.d` | Shell profile scripts |
| `qt` | Qt settings |
| `rofi` | Application launcher |
| `roocode` | Roo Code extension |
| `starship` | Shell prompt |
| `sworkstyle` | Workspace icons/styling |
| `user-dirs` | XDG user directories |
| `vscode` | VS Code settings |
| `wob` | Wayland overlay bar |
| `wofi` | Wayland launcher |
| `zsh` | Zsh shell config |

## Usage

```bash
# Deploy a package
stow <package>

# Remove a package
stow -D <package>

# Deploy all packages
stow */
```

