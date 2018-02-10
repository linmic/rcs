# ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh_custom
ZSH_THEME="spaceship"

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='osx'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
  platform='freebsd'
fi

TZ="Asia/Taipei"
HISTFILE=$HOME/.zhistory
HISTSIZE=2000
SAVEHIST=1000
HOSTNAME="`hostname`"
PAGER='less'

# export EDITOR="vim"
# export GIT_EDITOR="vim"
export EDITOR='nvim'
export GIT_EDITOR='nvim'
export vi='nvim'
export vim='nvim'

alias vim='nvim'
alias checkin='/usr/bin/python $HOME/dev/checkin/checkin.py'
alias prettify='prettier --single-quote --print-width 120 --trailing-comma es5 --write'

# fix keybindings
bindkey -e # for emacs
# bindkey "^[OH" beginning-of-line
# bindkey "^[OF" end-of-line

autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
fi

for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
  eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
  (( count = $count + 1 ))
done

PR_NO_COLOR="%{$terminfo[sgr0]%}"
PS1="<$PR_BLUE%n$PR_WHITE:$PR_RED%2c$PR_NO_COLOR>%(!.#.$) "
RPS1="$PR_LIGHT_YELLOW(%D{%m-%d %H:%M})$PR_NO_COLOR"
## Completions
autoload -U compinit
compinit -C

## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LC_CTYPE=C

# enable dir n file highlight
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

alias tls="tmux list-sessions"
alias tat="tmux attach -t "

# default ruby version
rvm use ruby-2.5.0

# for checking webpage compressed or not
function checkwebzip {
  local unzipped=`curl "$1" --silent --write-out "%{size_download}"  --output /dev/null`
  local zipped=`curl -H "Accept-Encoding: gzip,deflate" "$1" --silent --write-out "%{size_download}" --output /dev/null`
  echo "unzipped size: $unzipped, zipped size: $zipped"
}

function codehighlight {
  `highlight --syntax=js -O rtf "$1" | pbcopy`
}

# nvm
. ~/.nvm/nvm.sh
nvm use 8.9.4
PATH=$PATH:/Users/linmic/.nvm/versions/node/v8.9.4/bin

PATH=$PATH:/Applications/Charles.app/Contents/MacOS

PATH=$PATH:/Applications/MAMP/Library/bin

PATH=$PATH:$HOME/.bin
export TERM=xterm-256color-italic

#This line will tell the Go installer where to place the source code before compilation
export GOPATH=$HOME/go

#With this line, you choose the architecture of your machine.  
#Those with 64 bit CPUs should enter "amd64" here.  
# export GOARCH=386
# export GOOS=linux
# export GOBIN=$GOPATH/bin

#Include Go binaries in command path
export PATH=$PATH:$GOBIN

# aliases 
# -- mysql --
alias mysql_start='sudo /usr/local/bin/mysqld_safe &'
alias mysql_stop='sudo /usr/local/bin/mysqladmin shutdown'

# -- lazy aliases --
alias bb='brew update && brew upgrade'
# alias pg_start='pg_ctl -D /usr/local/var/postgres/data -l /usr/local/var/postgres/server.log start'
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'

alias gitc='git link | pbcopy'

if [ $platform == 'linux' ] || [ $platform == 'osx' ]; then
  alias ls='ls --color=auto'
elif [ $platform == 'freebsd' ]; then
  alias ls='ls -G'
fi

#source $HOME/.iterm2_shell_integration.zsh

ORIGINAL_PATH=$PATH
# ruby path
PATH=$HOME/.rvm/gems/ruby-2.5.0/bin:$HOME/.rvm/bin:$PATH
# coreutils
PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin
# system bin path
PATH=$PATH:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/sbin:/opt/X11/bin
# user bin path
PATH=$PATH:$HOME/bin
# android path
# PATH=$PATH:$HOME/dev/adt-bundle-mac-x86_64-20140702/sdk/platform-tools:$HOME/dev/adt-bundle-mac-x86_64-20140702/sdk/tools
# original path (if exists)
PATH=$PATH:$ORIGINAL_PATH

# php autoconf
PHP_AUTOCONF="/usr/local/bin/autoconf"

autoload -U colors && colors
source ./zsh-git-prompt/zshrc.sh
PROMPT='%{$fg[yellow]%}(・ω・)%{$reset_color%}[L][$(basename `pwd`)]$(git_super_status)$ '

COWPATH="$COWPATH:$HOME/.cowsay"
# Cow-spoken fortunes every time you open a terminal
function cowsayfortune {
  NUMOFCOWS=`cowsay -l | tail -n +2 | wc -w`
  WHICHCOW=$((RANDOM%$NUMOFCOWS+1))
  THISCOW=`cowsay -l | tail -n +2 | sed -e 's/\ /\'$'\n/g' | sed $WHICHCOW'q;d'`

  #echo "Selected cow: ${THISCOW}, from ${WHICHCOW}"
  fortune | cowsay -f $THISCOW -W 100
}

cowsayfortune
PATH=$PATH:/usr/local/sbin
PHP_AUTOCONF="/usr/local/bin/autoconf"
# source ~/.bash_aliases
export WORKON_HOME=~/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh
PATH="$PATH":$HOME/src/depot_tools

ANDROID_HOME=$HOME/Library/Android/sdk
ANDROID_SDK=$HOME/Library/Android/sdk
ANDROID_NDK=$HOME/Library/Android/android-ndk-r10e
PATH=$PATH:$ANDROID_HOME/emulator
PATH=$PATH:$ANDROID_HOME/tools
PATH=$PATH:$ANDROID_HOME/platform-tools

JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home"
PATH=$PATH:$JAVA_HOME/bin
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=~/Env
source /usr/local/bin/virtualenvwrapper.sh
export GPG_TTY=$(tty)

# internal use only
alias chrome="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \--args --ignore-certificate-errors --disable-web-security"
alias git_set_gmail="git config user.email 'linmicya@gmail.com'"

alias findf='find . -type f -name'
