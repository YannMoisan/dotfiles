# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/yamo/.zshrc'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# Crée un cache des complétion possibles
# très utile pour les complétion qui demandent beaucoup de temps
# comme la recherche d'un paquet aptitude install moz<tab>
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
# des couleurs pour la complétion
# faites un kill -9 <tab><tab> pour voir :)
zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# COMPLETION SETTINGS
# add custom completion scripts
fpath=(~/.zsh/completion $fpath) 

autoload -Uz compinit
compinit
# End of lines added by compinstall

# enable color support of ls and also add handy aliases
if [[ $(uname -s) == "Darwin" ]]; then
   alias ls='ls -G'
else 
   alias ls='ls --color=auto'
fi
eval $(dircolors -b ~/.dircolors)

alias grep='grep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

CDPATH=.:~:/mnt/data/backup/dev/projects/

export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:PermSize=128M -XX:MaxPermSize=256M"
export CLUSTERING=/data/client/clustering
export SCRIPT=/mnt/data/backup/dev/script/

if [[ $(uname -s) == "Darwin" ]]; then
    DOTFILES=~/Projects/dotfiles
else 
    DOTFILES=/mnt/data/backup/dev/projects/dotfiles
fi

export PATH=$DOTFILES/scripts:$PATH
export PATH=/opt/scala-2.10.1/bin:$PATH
export PATH=/opt/sbt/bin:$PATH
export PATH=/opt/apache-maven-3.0.4/bin:$PATH
export PATH=~/.gem/ruby/2.0.0/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/Projects/activator-1.2.3-minimal:$PATH

export EDITOR=vim

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
alias mongod="/opt/mongodb-linux-x86_64-2.4.1/bin/mongod --dbpath /mnt/data/db"
alias cat='_cat'
alias vbox='sudo modprobe -a vboxnetadp vboxnetflt vboxpci'
alias r='ranger'
alias vim='DYLD_FORCE_FLAT_NAMESPACE=1 vim'
alias v='vim'

source $DOTFILES/liquidprompt/liquidprompt
source $DOTFILES/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $DOTFILES/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys
# zmodload zsh/terminfo
# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

fortune | ponysay

alias tv="vlc http://mafreebox.freebox.fr/freeboxtv/playlist.m3u"

#axa
export STORES_PATH=/Users/yamo/Projects/
export STORE_SYMLINK_NAME=store
export PATH=~/Projects/df-belisarius/scripts/util:$PATH
