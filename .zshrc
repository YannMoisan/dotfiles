# Start configuration added by Zim Framework install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh
# }}} End configuration added by Zim Framework install

export PATH="$PATH:/Users/yamo/Library/Application Support/Coursier/bin"
export JAVA_HOME="/Users/yamo/Library/Caches/Coursier/arc/https/github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.7%252B6/OpenJDK21U-jdk_x64_mac_hotspot_21.0.7_6.tar.gz/jdk-21.0.7+6/Contents/Home"

DOTFILES=~/projects/perso/dotfiles

SPARK_DIR=~/opt/spark
[[ -d $SPARK_DIR ]] && export PATH=$SPARK_DIR/bin:$PATH
[[ -f ~/projects/perso/gws/src/gws ]] && export PATH=~/projects/perso/gws/src:$PATH

export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

function cl() {
    echo "$1" >> $DOTFILES/bin/yamocl.txt
}

if [[ $(uname -s) == "Linux" ]]; then
    # https://github.com/sharkdp/bat#on-ubuntu-using-apt
    alias cat='batcat'
    # https://github.com/sharkdp/fd#on-ubuntu
    alias fd='fdfind'
fi
alias drmi='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias du="ncdu --color dark"
alias dush="\du -sh | sort -h | tail"
alias rr='ranger'
alias todo="vim ~/Dropbox/Documents/TODO.txt"
alias tv="vlc http://mafreebox.freebox.fr/freeboxtv/playlist.m3u"
alias sbt-new="sbt new scala/scala-seed.g8"
alias org_image="exiftool -r -ext 'jpg' '-filename<Photos/\${Exif:Make}_\${Exif:Model}/\${CreateDate}/\${filename}' -d '%Y/%Y-%m-%d'"
alias org_video="exiftool -r -ext 'mp4' -ext 'mov' '-filename<Videos/\${CreateDate}/\${filename}' -d '%Y/%Y-%m-%d'"

# https://github.com/StreakyCobra/gws/issues/17
alias gws="PATH=/usr/local/opt/coreutils/libexec/gnubin:usr/local/opt/gnu-sed/libexec/gnubin:$PATH gws"

# https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration
source <(fzf --zsh)

# https://github.com/zsh-users/zsh-autosuggestions?tab=readme-ov-file#suggestion-highlight-style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias oo='book'

fif() {
	rg  \
	--column \
	--line-number \
	--no-column \
	--no-heading \
	--fixed-strings \
	--ignore-case \
	--hidden \
	--follow \
	--glob '!.git/*' "$1" \
	| awk -F  ":" '/1/ {start = $2<5 ? 0 : $2 - 5; end = $2 + 5; print $1 " " $2 " " start ":" end}' \
	| fzf --preview 'bat --wrap character --color always {1} --highlight-line {2} --line-range {3}' --preview-window wrap
}

export DYLD_LIBRARY_PATH="/home/yamo/opt/async-profiler-2.9-macos/build/"


# source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/opt/chruby/share/chruby/auto.sh
# chruby ruby-3.1.3

#   export NVM_DIR="$HOME/.nvm"
#   [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"
