" file paht: ~/.config/nvim/init.vim
call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" =======================================================

syntax on
color dracula
