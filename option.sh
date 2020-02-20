cp .zshrc ~/.zshrc

mkdir -p ~/.config/nvim
cp vimrc ~/.config/nvim/init.vim

nvim -c 'PlugInstall' -c 'qa!'

cp .condarc ~/.condarc
