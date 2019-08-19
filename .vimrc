" file paht: ~/.config/nvim/init.vim
call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" tagbar need ctags : brew install ctags
Plug 'majutsushi/tagbar'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" --------------------------------------------------------------------------------------------
" nerdtree config start
" --------------------------------------------------------------------------------------------

" open NERDTree automatically when neovim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Ctrl+n -> NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>

" close neovim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" --------------------------------------------------------------------------------------------
" nerdtree config end
" --------------------------------------------------------------------------------------------

" --------------------------------------------------------------------------------------------
" coc.nvim settings start
" --------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" --------------------------------------------------------------------------------------------
" coc.nvim settings end
" --------------------------------------------------------------------------------------------

" --------------------------------------------------------------------------------------------
" tagbar settings start
" --------------------------------------------------------------------------------------------

nmap <F8> :TagbarToggle<CR>

" --------------------------------------------------------------------------------------------
" tagbar settings end
" --------------------------------------------------------------------------------------------

" --------------------------------------------------------------------------------------------
"  custom settings start
" --------------------------------------------------------------------------------------------

" syntax highlighting
syntax on

" color theme
color dracula

" show line number
set number

set encoding=utf-8

set autoindent
set smartindent

set cursorline
set cursorcolumn

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" search ignore case
set ignorecase

" cancel line break
set nowrap

set ruler

" 当光标所在行到底部还剩7行时开始滚动
set so=7

" --------------------------------------------------------------------------------------------
"  custom settings end
" --------------------------------------------------------------------------------------------
