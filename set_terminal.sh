cp configs/zshrc ~/.zshrc

mkdir -p ~/.config/nvim
cp configs/vimrc ~/.vimrc
ln -s ~/.vimrc ~/.config/nvim/init.vim
cp configs/tmux.conf ~/.tmux.conf

nvim -c 'PlugInstall' -c 'qa!'

