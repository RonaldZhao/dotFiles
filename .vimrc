set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

" themes
"Plugin 'morhetz/gruvbox'
Plugin 'joshdick/onedark.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" golang plugin
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" show line number
set number
set relativenumber

set ruler

set cursorline

set textwidth=79

set wrap

" syntax highlighting
syntax on

set encoding=utf-8

set autoindent
set smartindent

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set showmatch

set hlsearch

set ignorecase

" Auto open NERDTree
" autocmd vimenter * NERDTree

" Toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set background=dark
"colorscheme gruvbox
colorscheme onedark

" set vim-airline theme
let g:airline_theme='onedark'

" onedark theme settings
let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1

