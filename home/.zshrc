ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="af-magic"
PATH="/Users/linmic/.rvm/gems/ruby-2.1.2/bin:/Users/linmic/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/Users/linmic/dev/adt-bundle-mac-x86_64-20140702/sdk/platform-tools:/Users/linmic/dev/adt-bundle-mac-x86_64-20140702/sdk/tools:$PATH"

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

alias tmux="TERM=screen-256color-bce tmux"
alias tls="tmux list-sessions"
alias tat="tmux attach -t "

# fix keybindings
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line

# default ruby version
rvm use 2.1.2

# for checking webpage compressed or not
function check_compression {
    local unzipped=`curl "$1" --silent --write-out "%{size_download}"  --output /dev/null`
    local zipped=`curl -H "Accept-Encoding: gzip,deflate" "$1" --silent --write-out "%{size_download}" --output /dev/null`
    echo "unzipped size: $unzipped, zipped size: $zipped"
}

# nvm
. ~/.nvm/nvm.sh

# if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  # export TERM='xterm-256color'
# else
  # export TERM='xterm-color'
# fi

# export TERM=screen-256color-bce
export TERM=screen-256color

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

alias mysql_start='sudo /usr/local/bin/mysqld_safe &'
alias mysql_stop='sudo /usr/local/bin/mysqladmin shutdown'

alias shoebox='tmux attach -t shoebox'
alias winsport='tmux a -t winsport'
alias es='elasticsearch start'
alias winsport_tunnel='ssh g.winsport.la -L8982:localhost:8982 -L8983:localhost:8983'
source /Users/linmic/.iterm2_shell_integration.zsh
export PATH=/Users/linmic/.rvm/gems/ruby-2.1.2/bin:/Users/linmic/.rvm/gems/ruby-2.1.2@global/bin:/Users/linmic/.rvm/rubies/ruby-2.1.2/bin:/Users/linmic/.rvm/bin:/Users/linmic/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/Users/linmic/dev/adt-bundle-mac-x86_64-20140702/sdk/platform-tools:/Users/linmic/dev/adt-bundle-mac-x86_64-20140702/sdk/tools:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/linmic/gosource/bin:/Users/linmic/depot_tools
