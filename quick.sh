#!/bin/bash

# change apt mirror to kakao
sudo cp /etc/apt/sources.list /etc/apt/sources.list.org
sed -e 's/\(us.\)\?archive.ubuntu.com/mirror.kakao.com/g' -e 's/security.ubuntu.com/mirror.kakao.com/g' < /etc/apt/sources.list.org > sources.list
sudo mv sources.list /etc/apt
sudo apt update

# install default packages
sudo apt install wget curl tmux zsh -y

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


sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt-get install neovim -y


# for my nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp vimrc ~/.config/nvim/init.vim

nvim -c 'PlugInstall' -c 'qa!'
echo alias vi='nvim' >> ~/.zshrc
