FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
MAINTAINER Hakjin Lee <nijkah@gmail.com>

RUN apt update

# install default packages
RUN apt install -qq -y build-essential wget curl git zsh tmux
RUN apt-get -qq -y install python3 python3-pip

# Set Locale
RUN apt install locales -y
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# --- Shell
# install powerline
RUN pip3 install powerline-status -y

# If you want to use consolas in Windows
# git clone https://github.com/Znuff/consolas-powerline

# install oh-my-zsh
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# install omz plugins
RUN git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
#chmod 755 "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
RUN chsh -s `which zsh`

RUN sudo apt install neovim -y

# for my nvim
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

