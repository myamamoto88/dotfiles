#!/usr/bin/env bash

git clone git@github.com:myamamoto88/dotfiles.git

DOT_FILES=(.vimrc .tmux.conf)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
