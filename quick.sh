#!/bin/bash

# change apt mirror to kakao
sudo apt update

# install default packages
sudo apt install build-essential git wget curl tmux zsh -y
# snap install tmux --classic

# --- Shell
# install powerline
pip install powerline-status
sudo apt-get install powerline fonts-powerline

# If you want to use consolas in Windows
# git clone https://github.com/Znuff/consolas-powerline

# install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# install omz plugins
git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
chmod 755 "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions


sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim -y

chsh -s $(which zsh)
cp .zshrc ~/.zshrc

# for my nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir ~/.config/nvim
cp vimrc ~/.config/nvim/init.vim

nvim -c 'PlugInstall' -c 'qa!'
echo alias vi='nvim' >> ~/.zshrc
