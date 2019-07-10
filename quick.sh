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

# If you want to use consolas in Windows
# git clone https://github.com/Znuff/consolas-powerline

# install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# install omz plugins
git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

cp .zshrc ~/.zshrc



# for my vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp vimrc ~/.vimrc

vim -c 'PluginInstall' -c 'qa!'
