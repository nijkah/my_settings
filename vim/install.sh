
# for unix
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp ../configs/vimrc ~/.vimrc

vim -c 'PlugInstall' -c 'qa!'
