#!/bin/sh

show_usage() {
    echo "usage: $0 [clone|vim|zsh]" && exit 1
}

clone() {
    git clone --recursive git@github.com:YannMoisan/prezto.git $SETUP_PROJECTS/zprezto
    git clone git@github.com:YannMoisan/dotfiles.git $SETUP_PROJECTS/dotfiles
}

setup_vim() {
    echo "setup vim"
    ln -s $SETUP_PROJECTS/dotfiles/.vimrc ~/.vimrc
    ln -s $SETUP_PROJECTS/dotfiles/.vim ~/.vim
    cd ~/.vim
    gws update
}

setup_zsh() {
    ln -s $SETUP_PROJECTS/zprezto ~/.zprezto

    ln -s ~/.zprezto/runcoms/zlogin ~/.zlogin
    ln -s ~/.zprezto/runcoms/zlogout ~/.zlogout
    ln -s ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc
    ln -s ~/.zprezto/runcoms/zprofile ~/.zprofile
    ln -s ~/.zprezto/runcoms/zshenv ~/.zshenv
    ln -s ~/.zprezto/runcoms/zshrc ~/.zshrc
}

SETUP_PROJECTS=${PROJECTS:-$HOME/projects}
echo "Projects dir:$SETUP_PROJECTS"

case "$1" in
    clone) clone ;;
    vim)   setup_vim ;;
    zsh)   setup_zsh ;;
    *)     show_usage ;;
esac
