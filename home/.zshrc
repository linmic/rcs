ZSH=$HOME/.oh-my-zsh

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
fi

TZ="Asia/Taipei"
HISTFILE=$HOME/.zhistory
HISTSIZE=2000
SAVEHIST=1000
HOSTNAME="`hostname`"
PAGER='less'

EDITOR='vim'
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
PS1="[$PR_BLUE%n$PR_WHITE@$PR_GREEN%U%m%u$PR_NO_COLOR:$PR_RED%2c$PR_NO_COLOR]%(!.#.$) "
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

# alias tmux="TERM=screen-256color-bce tmux"
alias tls="tmux list-sessions"
alias tat="tmux attach -t "

# fix keybindings
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line

# default ruby version
rvm use 2.1.5

# for checking webpage compressed or not
function check_compression {
    local unzipped=`curl "$1" --silent --write-out "%{size_download}"  --output /dev/null`
    local zipped=`curl -H "Accept-Encoding: gzip,deflate" "$1" --silent --write-out "%{size_download}" --output /dev/null`
    echo "unzipped size: $unzipped, zipped size: $zipped"
}

# nvm
. ~/.nvm/nvm.sh

export TERM=xterm-256color

# alias tmux="TERM=screen-256color-bce tmux"
#This line will tell the Go installer where to place the source code before compilation
# export GOROOT=$HOME/gosource
export GOPATH=$HOME/gosource

#With this line, you choose the architecture of your machine.  
#Those with 64 bit CPUs should enter "amd64" here.  
export GOARCH=386
export GOOS=linux
export GOBIN=$GOPATH/bin

#Include Go binaries in command path
export PATH=$PATH:$GOBIN

# aliases
# -- mysql --
alias mysql_start='sudo /usr/local/bin/mysqld_safe &'
alias mysql_stop='sudo /usr/local/bin/mysqladmin shutdown'
alias winsport_tunnel='ssh g.winsport.la -L8982:localhost:8982 -L8983:localhost:8983'
alias bb='brew update && brew upgrade'

if [[ $platform == 'linux' ]]; then
   alias ls='ls --color=auto'
elif [[ $platform == 'freebsd' ]]; then
   alias ls='ls -G'
fi

source $HOME/.iterm2_shell_integration.zsh

ORIGINAL_PATH=$PATH
# ruby path
PATH=$HOME/.rvm/gems/ruby-2.1.5/bin:$HOME/.rvm/bin
# system bin path
PATH=$PATH:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/sbin:/opt/X11/bin
# user bin path
PATH=$PATH:$HOME/bin
# android path
PATH=$PATH:$HOME/dev/adt-bundle-mac-x86_64-20140702/sdk/platform-tools:$HOME/dev/adt-bundle-mac-x86_64-20140702/sdk/tools
# php path
case $OSTYPE in darwin*)
  PATH="$PATH:$(brew --prefix homebrew/php/php55)/sbin"
esac
# original path (if exists)
PATH=$PATH:$ORIGINAL_PATH

# php autoconf
PHP_AUTOCONF="/usr/local/bin/autoconf"
