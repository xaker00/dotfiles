#!/bin/bash -e

pushd $HOME
git clone --depth 1 https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

popd
