#!/bin/bash -e

#
# tmux
#
install_tmux() {
    git clone --depth 1 https://github.com/gpakosz/.tmux.git
    ln -s -f .tmux/.tmux.conf
    cp .tmux/.tmux.conf.local .
}

#
# fzf
#
install_fzf() {
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
}


#
# vim
#
install_vim() {
    wget "https://raw.githubusercontent.com/xaker00/dotfiles/master/.vimrc" -O $HOME/.vimrc

    #
    # vundle
    #
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall

    #
    # YouCompleteMe
    #
    # Requires:
    #  - cmake
    #  - python3-dev
    #  - build-essential
    #
    $HOME/.vim/bundle/YouCompleteMe/install.py
}

pushd $HOME

case $1 in
    tmux)
        install_tmux
        ;;
    fzf)
        install_fzf
        ;;
    vim)
        install_vim
        ;;
    *)
        install_tmux
        install_fzf
        ;;
esac

popd
