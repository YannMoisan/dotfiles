# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/yamo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
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
export PATH=/opt/scala-2.10.1/bin:~/.gem/ruby/2.0.0/bin:/mnt/data/backup/dev/projects/dotfiles/scripts:/opt/sbt/bin:/opt/apache-maven-3.0.4/bin:$PATH
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

source ~/liquidprompt/liquidprompt
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fortune | ponysay

alias tv="vlc http://mafreebox.freebox.fr/freeboxtv/playlist.m3u"
