FROM nvcr.io/nvidia/pytorch:20.07-py3
MAINTAINER Hakjin Lee <nijkah@gmail.com>
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /
RUN apt-get update
RUN apt-get install -y zsh tmux openssh-server

RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" \ 
 && sed -i "s/robbyrussell/ys/g" ~/.zshrc \
 && chsh -s /usr/bin/zsh 

RUN sed -i "s/PermitRootLogin/PermitRootLogin yes #/g" /etc/ssh/sshd_config


# --- Shell
# install omz plugins
RUN git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN chmod 755 "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

RUN apt-get install neovim -y

# for my nvim
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN sed -i -e "$ a alias vi='nvim'" ~/.zshrc
RUN sed -i -e "$ a alias vim='nvim'" ~/.zshrc


CMD ["zsh"]
