#!/bin/bash

# Setup script

echo "Let's get you set up with the environment you want!"

# Create links to bash files

echo "Moving to home directory..."

cd ~

echo "Creating symlinks to dotfiles..."

ln -s ~/dotfiles/.vimrc .vimrc
ln -s ~/dotfiles/.tmux.conf .tmux.conf
ln -s ~/dotfiles/.gitconfig .gitconfig
ln -s ~/dotfiles/.bash_profile .bash_profile

# Install vim plugins

echo "Installing vim plugins..."

cp -r ~/dotfiles/.vim ~/.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter
git clone https://github.com/flazz/vim-colorschemes.git ~/.vim/bundle/vim-colorschemes
git clone https://github.com/chr4/nginx.vim.git ~/.vim/bundle/nginx.vim

echo "You're all ready to go!"

