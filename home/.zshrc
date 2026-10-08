# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Environment ------------------------------------------------------------
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export EDITOR='nvim'
export VISUAL='nvim'
export GPG_TTY=$TTY
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export JAVA_HOME="/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
export NVM_DIR="$HOME/.nvm"

HISTFILE=$HOME/.zhistory
HISTSIZE=50000
SAVEHIST=50000

# PATH -------------------------------------------------------------------
# Put the default Node on PATH directly; loading nvm costs ~0.5s per shell.
() {
  local default
  [[ -r $NVM_DIR/alias/default ]] && default=$(<$NVM_DIR/alias/default)
  local -a bins=($NVM_DIR/versions/node/v${default#v}*/bin(N-/nOn))
  (( $#bins )) || bins=($NVM_DIR/versions/node/*/bin(N-/nOn))
  _nvm_default_bin=$bins[1]
}

# Highest precedence first; (N-/) drops directories that don't exist
typeset -U path
path=(
  /opt/homebrew/opt/openjdk/bin(N-/)
  $HOME/.local/bin(N-/)
  $HOME/.rbenv/shims(N-/)
  $HOME/.rbenv/bin(N-/)
  $HOME/.codeium/windsurf/bin(N-/)
  $_nvm_default_bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
  $HOME/.yarn/bin(N-/)
  $HOME/.config/yarn/global/node_modules/.bin(N-/)
  $HOME/.bin(N-/)
  $path
)
unset _nvm_default_bin

# nvm: load on first use, and follow .nvmrc on cd ------------------------
nvm() {
  unfunction nvm
  source "$NVM_DIR/nvm.sh"
  nvm "$@"
}

# Switch Node when entering a directory whose .nvmrc asks for a different
# version, and go back to the default on leaving. Only loads nvm when needed.
_nvmrc_auto() {
  local dir=$PWD
  while [[ $dir != / && ! -f $dir/.nvmrc ]]; do dir=${dir:h}; done
  if [[ -f $dir/.nvmrc ]]; then
    local want=$(<$dir/.nvmrc) current=${commands[node]:h:h:t}
    want=${want//[[:space:]]/}
    [[ $current == v${want#v} || $current == v${want#v}.* ]] && return
    nvm use --silent 2>/dev/null || nvm install
    _nvmrc_switched=1
  elif [[ -n $_nvmrc_switched ]]; then
    nvm use --silent default
    unset _nvmrc_switched
  fi
}
autoload -U add-zsh-hook
add-zsh-hook chpwd _nvmrc_auto
_nvmrc_auto

# oh-my-zsh (runs compinit itself) ---------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_DISABLE_COMPFIX="true"
# No update check on every shell start; run `omz update` by hand
zstyle ':omz:update' mode disabled
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Case-insensitive, partial-word, then substring completion (set after
# oh-my-zsh, which would otherwise override it)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Aliases ----------------------------------------------------------------
alias vim='nvim'
alias prettify='prettier --single-quote --print-width 80 --trailing-comma es5 --write'
alias tls='tmux list-sessions'
alias tat='tmux attach -t'
alias gpom='git pull origin master'
alias fastlane='bundle exec fastlane'
alias adb-debug='adb reverse tcp:8081 tcp:8081'
alias pfdev='ngrok http --url=proofreader.ngrok.dev 3000'
alias code='code . --classic'
alias claude-sync='git -C ~/.claude pull --rebase --autostash && \
  git -C ~/.claude add -A && \
  git -C ~/.claude commit -qm "sync $(date +%F\ %T)" 2>/dev/null; \
  git -C ~/.claude push -q'

# Functions --------------------------------------------------------------
# Compare a page's size with and without compression
checkwebzip() {
  local unzipped=$(curl "$1" --silent --write-out "%{size_download}" --output /dev/null)
  local zipped=$(curl -H "Accept-Encoding: gzip,deflate" "$1" --silent --write-out "%{size_download}" --output /dev/null)
  echo "unzipped size: $unzipped, zipped size: $zipped"
}

# Copy a JS file to the clipboard as highlighted RTF
codehighlight() {
  highlight --syntax=js -O rtf "$1" | pbcopy
}

# Restart the React Native iOS build, freeing Metro's port first
rni() {
  local pids=$(lsof -t -i:8081)
  [[ -n $pids ]] && kill ${=pids}
  rm -rf ios/build/
  react-native run-ios
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Secrets and machine-specific settings, kept out of version control
[[ -r ~/.zshrc.local ]] && source ~/.zshrc.local

# fzf: Ctrl-R history, Ctrl-T file path, Option-C cd into a folder
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'

# Source a tool's generated shell setup from a cache, regenerating it when
# the tool is updated, instead of running the tool on every shell start
_source_cached() {
  local file=$HOME/.cache/zsh/$1.zsh; shift
  if [[ ! -s $file || $commands[$1] -nt $file ]]; then
    mkdir -p ${file:h} && "$@" >| $file
  fi
  source $file
}

_source_cached fzf fzf --zsh
bindkey 'ç' fzf-cd-widget # iTerm's Option-C types ç rather than Alt-C

# zoxide: z <part of a path> jumps to a folder you've visited, zi to pick
_source_cached zoxide zoxide init zsh

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Must be sourced last
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
