# zprof only while tuning (remove later)
# zmodload zsh/zprof

export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
ZSH_THEME="robbyrussell"

# Speed: disable OMZ update checks and compfix
zstyle ':omz:update' mode disabled
export ZSH_DISABLE_COMPFIX=true

# Completion cache + compdump location (OMZ reads this)
typeset -g ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completion"

# DO NOT add Homebrew site-functions to fpath; it’s huge and slows compinit
# if command -v brew >/dev/null 2>&1; then
#   fpath+=("$(brew --prefix)/share/zsh/site-functions")
# fi

# fnm: fast Node manager (reads .nvmrc/.node-version; auto-switch on cd)
eval "$(fnm env --shell zsh --use-on-cd)"

plugins=(
  gpg-agent
  git
  zsh-better-npm-completion
  zsh-autosuggestions
  fast-syntax-highlighting
  zsh-autocomplete    # keep last; comment out to compare speed
)

# Oh My Zsh (runs compinit once and uses the cache)
source "$ZSH/oh-my-zsh.sh"

# Cache and load only the completions you actually use
_cache_comp() {
  local cmd="$1" gen="$2" out="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions/_${cmd}"
  if command -v "$cmd" >/dev/null 2>&1; then
    if [[ ! -s "$out" || "$(command -v "$cmd")" -nt "$out" ]]; then
      mkdir -p "${out:h}"
      eval "$gen" >| "$out"
    fi
    source "$out"
  fi
}

# Add/remove lines below to match your toolset
_cache_comp docker  'docker completion zsh'
_cache_comp kubectl 'kubectl completion zsh'
_cache_comp gh      'gh completion -s zsh'
_cache_comp pnpm    'pnpm completion zsh'
_cache_comp ngrok   'ngrok completion zsh'
_cache_comp fnm     'fnm completions --shell zsh'

# Jump utility (z)
. /opt/homebrew/etc/profile.d/z.sh

# direnv
eval "$(direnv hook zsh)"

# Remove Docker’s fpath injection (we’re loading its tiny cached file above)
# fpath=(/Users/aimless/.docker/completions $fpath)
# autoload -Uz compinit
# compinit

# starship prompt (comment to compare its cost with `time`)
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/Users/aimless/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# zprof at end only while profiling
# zprof
