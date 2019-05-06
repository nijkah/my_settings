set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'nathanaelkane/vim-indent-guides'
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

set encoding=utf-8

colorscheme jellybeans
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
