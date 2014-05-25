ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="af-magic"
PATH="/usr/local/bin:/usr/local/sbin/:/bin:/sbin:/usr/bin:/usr/sbin:$PATH"

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

LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C

# enable dir n file highlight
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

alias ls="ls -GFv --color"

alias tmux="TERM=screen-256color-bce tmux"
alias tls="tmux list-sessions"
alias tat="tmux attach -t "

# fix keybindings
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line

# default ruby version
rvm use 2.0.0

# for checking webpage compressed or not
function check_compression {
    local unzipped=`curl "$1" --silent --write-out "%{size_download}"  --output /dev/null`
    local zipped=`curl -H "Accept-Encoding: gzip,deflate" "$1" --silent --write-out "%{size_download}" --output /dev/null`
    echo "unzipped size: $unzipped, zipped size: $zipped"
}

# nvm
. ~/.nvm/nvm.sh
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

alias tmux="TERM=screen-256color-bce tmux"
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

alias clean_assets="rm -rf tmp && rake assets:clean"
