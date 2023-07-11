#!/bin/bash -e

pushd $HOME

#
# tmux
#
git clone --depth 1 https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

#
# fzf
#
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


#
# vim
#
curl -L "https://raw.githubusercontent.com/xaker00/dotfiles/master/.vimrc" > $HOME/.vimrc

#
# vundle
#
git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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

popd
