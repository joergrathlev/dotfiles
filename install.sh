#!/bin/bash

# Find out the directory this script is in
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

ln -f -s "$DIR"/ackrc ~/.ackrc
ln -f -s "$DIR"/bash_profile ~/.bash_profile
ln -f -s "$DIR"/bashrc ~/.bashrc
ln -f -s "$DIR"/gitconfig ~/.gitconfig
ln -f -s "$DIR"/gitignore_global ~/.gitignore_global
ln -f -s "$DIR"/inputrc ~/.inputrc
ln -f -s "$DIR"/profile ~/.profile
ln -f -s "$DIR"/psqlrc ~/.psqlrc
ln -f -s "$DIR"/vimrc ~/.vimrc
ln -f -s "$DIR"/vim ~/.vim
