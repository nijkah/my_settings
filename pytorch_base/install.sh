# install oh-my-zsh
apt update -y
apt install vim wget curl git zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended 

# install omz plugins
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
chmod 755 "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

cp ../configs/zshrc ~/.zshrc
cp ../configs/tmux.conf ~/.tmux.conf

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

zsh

#source ~/.zshrc
