" file paht: ~/.config/nvim/init.vim
call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
" 安装完coc.nvim后打开neovim安装coc-json -> :CocInstall coc-json
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
" tagbar need ctags : brew install ctags
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
" fzf installed using Homebrew
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
" code snippets
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

call plug#end()

" --------------------------------------------------------------------------------------------
" nerdtree config start
" --------------------------------------------------------------------------------------------

" open NERDTree automatically when neovim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" F2 -> NERDTreeToggle
map <F2> :NERDTreeToggle<CR>

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
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use `[e` and `]e` to navigate diagnostics
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
"  NERD Commenter settings start
" --------------------------------------------------------------------------------------------

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" --------------------------------------------------------------------------------------------
"  NERD Commenter settings end
" --------------------------------------------------------------------------------------------

" --------------------------------------------------------------------------------------------
"  fzf.vim settings start
" --------------------------------------------------------------------------------------------

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <silent> <Leader><Leader> :Files<CR>

" --------------------------------------------------------------------------------------------
"  fzf.vim settings end
" --------------------------------------------------------------------------------------------

" --------------------------------------------------------------------------------------------
"  vim-go settings start
" --------------------------------------------------------------------------------------------

" 告诉vim-go保存文件时自动执行goimports
let g:go_fmt_command = "goimports"

set autowrite
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" go语言使用驼峰命名法
let g:go_addtags_transform = "camelcase"

" --------------------------------------------------------------------------------------------
"  vim-go settings end
" --------------------------------------------------------------------------------------------

" --------------------------------------------------------------------------------------------
"  UltiSnips settings start
" --------------------------------------------------------------------------------------------

let g:python_host_prog  = '/Users/ronaldzhao/.pyenv/shims/python'    " 且需要 pip2 install --user --upgrade neovim
let g:python3_host_prog  = '/Users/ronaldzhao/.pyenv/shims/python3'  " 且需要 pip3 install --user --upgrade neovim
" let UltiSnips uses python3
let g:UltiSnipsUsePythonVersion = 3

" 使用<Ctrl-l>列出可用的代码片段
let g:UltiSnipsListSnippets="<c-l>"
" 设置UltiSnips自定义配置文件的路径
let g:UltiSnipsSnippetsDir="~/.config/UltiSnips"
" 使用 UltiSnipsEditSplit 的时候以垂直分屏的方式编辑当前文件格式的代码片段配置文件
let g:UltiSnipsEditSplit="vertical"
" Disable looking for SnipMate snippets in runtimepath.
let g:UltiSnipsEnableSnipMate=0

" --------------------------------------------------------------------------------------------
"  UltiSnips settings end
" --------------------------------------------------------------------------------------------

" --------------------------------------------------------------------------------------------
"  custom settings start
" --------------------------------------------------------------------------------------------

" syntax highlighting
syntax on

" color theme
" colorscheme dracula
colorscheme gruvbox

set background=dark

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

" 当光标所在行到底部还剩20行时开始滚动
set so=20

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" 将<Leader>键设置为","(默认为"\")
let mapleader = ","

" 设置代码折叠
set fdm=indent

" --------------------------------------------------------------------------------------------
"  custom settings end
" --------------------------------------------------------------------------------------------
