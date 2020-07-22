# install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# install omz plugins
git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
chmod 755 "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

$SUDOPREFIX apt install neovim -y

# for my nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp configs/vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
cp configs/tmux.conf ~/.tmux.conf

nvim -c 'PlugInstall' -c 'qa!'

