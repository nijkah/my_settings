

$SUDOPREFIX apt install neovim -y

# for my nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp configs/zshrc ~/.zshrc
cp configs/vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
cp configs/tmux.conf ~/.tmux.conf

nvim -c 'PlugInstall' -c 'qa!'
source ~/.zshrc
