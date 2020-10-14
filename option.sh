cp .zshrc ~/.zshrc

mkdir -p ~/.config/nvim
cp vimrc ~/.vimrc
ln -s ~/.vimrc ~/.config/nvim/init.vim
cp .tmux.conf ~/.tmux.conf

nvim -c 'PlugInstall' -c 'qa!'

