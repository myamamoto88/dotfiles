#!/usr/bin/env bash

pushd $HOME

[ ! -e ~/dotfiles ] &&  git clone git@github.com:myamamoto88/dotfiles.git

DOT_FILES=(.vimrc .tmux.conf .zshrc .gitignore .gitconfig)

for file in ${DOT_FILES[@]}
do
  ln -fs $HOME/dotfiles/$file $HOME/$file
done

popd
