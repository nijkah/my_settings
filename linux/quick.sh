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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# install omz plugins
git clone https://github.com/z-shell/F-Sy-H ~/.oh-my-zsh/custom/plugins/f-sy-h
source ~/.oh-my-zsh/custom/plugins/f-sy-h/F-Sy-H.plugin.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
chmod 755 "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
chsh -s `which zsh`
cp ../configs/zshrc ~/.zshrc

$SUDOPREFIX apt install neovim -y

# for my nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp ../configs/vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
cp ../configs/tmux.conf ~/.tmux.conf

nvim -c 'PlugInstall' -c 'qa!'
echo 'source ~/path/to/f-sy-h/F-Sy-H.plugin.zsh' >> ~/.zshrc
