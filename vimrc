set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'iCyMind/NeoSolarized'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()


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
set ignorecase
set relativenumber
set cc=80

set hlsearch
set laststatus=2  
set ruler 
set incsearch

map <C-n> : NERDTreeToggle<CR>
nmap <F8> : TagbarToggle<CR>

syntax on
set termguicolors
colorscheme NeoSolarized
set background=dark

set encoding=utf-8
