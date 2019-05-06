set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
call vundle#end()


set showmode
set nowrap
set tabstop=4
set textwidth=120
set smarttab
set tags=tags
set softtabstop=4
set expandtab
set shiftwidth=4
set shiftround
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set cc=80

set hlsearch
set laststatus=2  
set ruler 
set incsearch

map <C-n> : NERDTreeToggle<CR>
nmap <F8> : TagbarToggle<CR>

syntax on
set background=dark
colorscheme gruvbox

set encoding=utf-8
