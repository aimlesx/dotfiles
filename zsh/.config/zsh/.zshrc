export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
ZSH_THEME="robbyrussell"

# OMZ settings
zstyle ':omz:update' mode disabled
export ZSH_DISABLE_COMPFIX=true
typeset -g ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump"

# aliases
alias df='df -h'
alias free='free -m'
alias ls='ls --color=auto'

# fnm: fast Node manager
eval "$(fnm env --shell zsh --use-on-cd)"

plugins=(
  gpg-agent
  git
  docker
  kubectl
  gh
  zsh-better-npm-completion
  zsh-autosuggestions
  fast-syntax-highlighting
  fzf-tab
)

source "$ZSH/oh-my-zsh.sh"

# Tool completions (only for tools without OMZ plugins)
(( $+commands[pnpm] ))  && eval "$(pnpm completion zsh)"
(( $+commands[ngrok] )) && eval "$(ngrok completion zsh)"

# direnv
eval "$(direnv hook zsh)"

# z - jump around
[[ -f /usr/share/z/z.sh ]] && source /usr/share/z/z.sh

# starship prompt
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

eval "$(mise activate zsh)"

# Use powerline
# USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
# HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
# if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
#   source /usr/share/zsh/manjaro-zsh-config
# fi
