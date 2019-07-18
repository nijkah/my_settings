#!/bin/bash
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
#git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
chmod 755 "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

chsh -s 'which zsh'
cp .zshrc ~/.zshrc


# for my vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp vimrc ~/.vimrc

vim -c 'PluginInstall' -c 'qa!'
