#!/bin/bash

sudo apt update

# install default packages
sudo apt install build-essential pkg-config wget curl git zsh -y
sudo apt-get install tmux
sudo apt-get install python3 python3-pip

sudo apt install locales -y
sudo locale-gen en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
#export LC_ALL=C.UTF-8
#export LANG=C.UTF-8

# --- Shell
# install powerline
pip3 install powerline-status
sudo apt-get install powerline fonts-powerline

# If you want to use consolas in Windows
# git clone https://github.com/Znuff/consolas-powerline

# install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# install omz plugins
git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
#chmod 755 "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
chsh -s `which zsh`
cp .zshrc ~/.zshrc


sudo apt install neovim -y


# for my nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim
cp vimrc ~/.config/nvim/init.vim

nvim -c 'PlugInstall' -c 'qa!'
