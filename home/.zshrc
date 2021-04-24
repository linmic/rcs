export ZSH="/Users/linmic/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

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

export EDITOR='nvim'
export GIT_EDITOR='nvim'
export vi='nvim'
export vim='nvim'

alias vim='nvim'
alias prettify='prettier --single-quote --print-width 80 --trailing-comma es5 --write'

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

rvm use 2.7

alias tls="tmux list-sessions"
alias tat="tmux attach -t "

export PATH=$HOME/.bin:$PATH
# export PATH=/usr/local/opt/tig/etc/bash_completion.d:$PATH
export PATH="/usr/local/opt/mozjpeg/bin:$PATH"
export PATH=$HOME/Library/Python/3.8/lib/python/site-packages:$PATH

# ruby
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH

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
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. ~/.nvm/nvm.sh
nvm use 12.22.0
PATH=$PATH:$HOME/.nvm/versions/node/v12.22.0/bin

export GPG_TTY=$(tty)

# Charles
PATH=$PATH:/Applications/Charles.app/Contents/MacOS

# MAMP
PATH=$PATH:/Applications/MAMP/Library/bin

PATH=$PATH:$HOME/.bin

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
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'

# yarn needs this to work globally without issues
export PATH="$(yarn global bin):$PATH"
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin

# Java & Android
export ANDROID_HOME=$HOME/Library/Android/sdk
# only enable this if Android NDK is installed
# ANDROID_NDK=$HOME/Library/Android/android-ndk-r10e
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
launchctl setenv JAVA_HOME /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin

alias fastlane='bundle exec fastlane'

# app secrets -> DON'T COMMIT THIS
export SIGNING_STORE_PASSWORD='paidyuxe'
export SIGNING_KEY_PASSWORD='paidyuxe'
export SIGNING_KEY_ALIAS='key0'

export SIGNING_STORE_PASSWORD_PROD='@Pay123!'
export SIGNING_KEY_PASSWORD_PROD='MyPaidy'
export SIGNING_KEY_ALIAS_PROD='paidyApp'

# export APPLE_CONNECT_USERNAME='mobile-dev@paidy.com'
# export APPLE_CONNECT_USERNAME='mobile@paidy.com'
export APPLE_CONNECT_USERNAME='linmic@paidy.com'

# export FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD='vmkn-rhsc-dmvs-yaxa'
export FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD='ewys-zszm-ywzp-dcqs'
# export MATCH_PASSWORD='@Paidy123!'
# export MATCH_PASSWORD='@Pay123!'
# export FASTLANE_PASSWORD='@Paidy123!'

# alias imgsfit='ssh -i /Users/linmic/imgsfit-ec2.pem ubuntu@ec2-3-113-1-64.ap-northeast-1.compute.amazonaws.com'
alias imgsfit='ssh -i /Users/linmic/imgsfit-ec2.pem ubuntu@imgs.fit'
alias imgsfit2='ssh -i /Users/linmic/imgsfit.pem ubuntu@ec2-13-212-38-90.ap-southeast-1.compute.amazonaws.com'


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

alias ftx='ssh ftx-ai.app'
