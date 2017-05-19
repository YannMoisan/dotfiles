#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Lines configured by zsh-newuser-install
#HISTFILE=~/.histfile
#HISTSIZE=1000
#SAVEHIST=1000
#setopt appendhistory autocd beep extendedglob nomatch notify
#bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
#zstyle :compinstall filename '/home/yamo/.zshrc'
#zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
#zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
#zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
#                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# Crée un cache des complétion possibles
# très utile pour les complétion qui demandent beaucoup de temps
# comme la recherche d'un paquet aptitude install moz<tab>
#zstyle ':completion:*' use-cache on
#zstyle ':completion:*' cache-path ~/.zsh_cache
# des couleurs pour la complétion
# faites un kill -9 <tab><tab> pour voir :)
#zmodload zsh/complist
#setopt extendedglob
#zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# COMPLETION SETTINGS
# add custom completion scripts
fpath=(/usr/local/share/zsh/site-functions $fpath)
fpath=(~/.zsh/oc $fpath)
#
autoload -Uz compinit
compinit
# End of lines added by compinstall

# enable color support of ls and also add handy aliases
#if [[ $(uname -s) == "Darwin" ]]; then
#   alias ls='ls -G'
#else 
#   alias ls='ls --color=auto'
#fi
#eval $(dircolors -b ~/.dircolors)
#
#alias grep='grep --color=auto'

# some more ls aliases
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

CDPATH=.:~:/mnt/data/backup/dev/projects/

#export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:PermSize=128M -XX:MaxPermSize=256M -Xms2G -Xmx2G"
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxMetaspaceSize=512M -XX:MetaspaceSize=256M -Xms2G -Xmx2G"
export CLUSTERING=/data/client/clustering
export SCRIPT=/mnt/data/backup/dev/script/

if [[ $(uname -s) == "Darwin" ]]; then
    DOTFILES=~/Projects/dotfiles
else 
    DOTFILES=/mnt/data/backup/dev/projects/dotfiles
fi

export PATH=$DOTFILES/scripts:$PATH
#export PATH=/opt/scala-2.10.1/bin:$PATH
#export PATH=/opt/sbt/bin:$PATH
#export PATH=/opt/apache-maven-3.0.4/bin:$PATH
export PATH=~/.gem/ruby/2.0.0/bin:$PATH
export PATH=/usr/local/bin:$PATH
#export PATH=~/Projects/activator-1.2.3-minimal:$PATH

export EDITOR=vim
export VISUAL=vim

function cl() {
    echo "$1" >> $SCRIPT/yamocl.sh
}
function _cat() {
    pygmentize $@ 2>/dev/null || cat $@
}

alias dush="du -sh | sort -h | tail"
alias projects="cd /mnt/data/backup/dev/projects"
alias bkd="cd /mnt/data/backup/dev/realisation/atos/13\ -\ Bluekiwi/"
alias bkp="cd /mnt/data/backup/dev/projects/bluekarma/bluekarma-analytics-scala-play2"
alias todo="vim /mnt/data/backup/application/divers/TODO.txt"
alias h=history
alias idea="/opt/idea-IC-123.72/bin/idea.sh"
#alias mongod="/opt/mongodb-linux-x86_64-2.4.1/bin/mongod --dbpath /mnt/data/db"
alias cat='_cat'
alias vbox='sudo modprobe -a vboxnetadp vboxnetflt vboxpci'
alias rr='ranger'
alias vim='DYLD_FORCE_FLAT_NAMESPACE=1 vim'
alias v='vim'
#source $DOTFILES/liquidprompt/liquidprompt
#source $DOTFILES/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source $DOTFILES/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys
# zmodload zsh/terminfo
# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
#bindkey -M emacs '^P' history-substring-search-up
#bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
#bindkey -M vicmd 'k' history-substring-search-up
#bindkey -M vicmd 'j' history-substring-search-down

fortune | ponysay

alias tv="vlc http://mafreebox.freebox.fr/freeboxtv/playlist.m3u"

#axa
export GOPATH=~/Projects/.go
#export STORES_PATH=/Users/yamo/Projects/
#export STORE_SYMLINK_NAME=store
#export PATH=~/Projects/df-belisarius/scripts/util:$PATH
#export PATH=~/Projects/df-belisarius/scripts:$PATH
#export PATH=~/Downloads/spark-1.2.1-bin-hadoop2.4/bin:$PATH
export PATH=/usr/local/octave/3.8.0/bin:$PATH
export PATH=~/opt/source-to-image-v1.1.5-4dd7721-darwin-amd64:$PATH
export PATH=/Users/yamo/opt/openshift-origin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=~/opt/StreakyCobra-gws-3618de8/src:$PATH
export PATH=~/opt/spark/bin:$PATH
alias ngstart='sudo nginx -p ~/Projects/df-belisarius/thirdparties/nginx -c etc/multistores_nginx.conf'
alias ngstop='sudo nginx -p ~/Projects/df-belisarius/thirdparties/nginx -c etc/multistores_nginx.conf -s stop'
alias ngreload='sudo nginx -p ~/Projects/df-belisarius/thirdparties/nginx -c etc/multistores_nginx.conf -s reload'
alias cleanindex="curl -XDELETE 'http://localhost:9200/*'"
alias penguen="ssh penguen -t tmux a"
alias REPLesent='scala -Dscala.color -language:_ -nowarn -i REPLesent.scala'

# https://github.com/StreakyCobra/gws/issues/17
alias gws="PATH=/usr/local/opt/coreutils/libexec/gnubin:usr/local/opt/gnu-sed/libexec/gnubin:$PATH gws"

export JAVA_HOME=$(/usr/libexec/java_home)

# eval "$(boot2docker shellinit)"
# deactivate tls : https://coderwall.com/p/siqnjg/disable-tls-on-boot2docker
#unset DOCKER_TLS_VERIFY                                                                                                                                                                           ⏎
#unset DOCKER_CERT_PATH
#export DOCKER_HOST=tcp://192.168.59.103:2375

function oc_where() {
  oc get events | grep $1 | sed "s/.*to \([a-z0-9]*\).axa.enoshift.com/\1/"
}


# added by travis gem
[ -f /Users/yamo/.travis/travis.sh ] && source /Users/yamo/.travis/travis.sh

#docker
alias drmi='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'

alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport'
alias scan='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan'
alias wifioff='networksetup -setairportpower en0 off'
alias wifion='networksetup -setairportpower en0 on'
alias vpn='~/Projects/vpn-helpers/vpn'

VPN_SUBNET=10.233
VPN_HOSTS="outlook.office365.com"
VPN_SUBNETS="172.16.0.0/12 10.0.0.0/8 132.245.194.242/32"

## openshift
alias olb='oc logs -f build/$(oc get build -o json | jq -r "[.items[].metadata.name]|reverse|.[0]")'
alias bona="oc get pods -o wide"
function opf() { echo "1:$1-2:$2-3:$3"; watch -n0 oc port-forward $1 ${3:-8080} -n $2 }
function odp() { oc get project -o json | jq '.items[].metadata.name' | grep $1 | xargs oc delete project }
function ogt() { oc get secrets $(oc get sa/$1 -o json | jq -r ".secrets[].name" | grep token) -o json | jq -r ".data.token" | base64 -D - }
function ogpr() { oc get pods -o json | jq -r '.items[] | select(.status.phase == "Running") | .metadata.name' }
function opfj() { opf $(ogpr) $1 $2}
function ogp() {
    for project in $(oc get project -o json | jq -r '.items[].metadata.name' | grep $1)
    do
        oc get pods -o wide -n $project
    done
}
function odpb() { oc describe policyBindings :default -n $1 }
function ol() { for pod in $(oc get pods -o json | jq -r ".items[].metadata.name"); do oc logs $pod; done }
