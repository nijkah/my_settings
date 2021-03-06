#!/bin/bash
SUDOPREFIX=$([ $EUID -eq 0 ] && echo "" || echo "sudo")

$SUDOPREFIX apt update -y

# install default packages
$SUDOPREFIX apt install build-essential apt-utils pkg-config wget curl git zsh -y
$SUDOPREFIX apt install tmux python3 python3-pip locales -y
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# If you want to use consolas in Windows
# git clone https://github.com/Znuff/consolas-powerline

# install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# install omz plugins
git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
chmod 755 "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
chsh -s `which zsh`
cp configs/zshrc ~/.zshrc

$SUDOPREFIX apt install neovim -y

# for my nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp configs/vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
cp configs/tmux.conf ~/.tmux.conf

nvim -c 'PlugInstall' -c 'qa!'
