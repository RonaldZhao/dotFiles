" --------------------------------- neovim配置文件 ---------------------------------
"
" RonaldZhao个人使用的配置，主要适配Go语言。
"
" 此文件的存放路径: ~/.config/nvim/init.vim

" 指定一个插件安装的目录
" - 避免使用如'plugin'的标准Vim目录
call plug#begin('~/.nvim/plugins')
" 确保非注释使用单引号

" 一个简单易用的Vim对齐插件
Plug 'junegunn/vim-easy-align'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" 针对Go语言开发的插件
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" 一个搜索插件，需要先brew install fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" 文件管理器
Plug 'scrooloose/nerdtree'
" nerdtree中显示git状态的插件
Plug 'Xuyuanp/nerdtree-git-plugin'

" 文件图标插件
Plug 'ryanoasis/vim-devicons'

" 异步代码补全插件，需要pynvim(pip3 install --user --upgrade pynvim)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" 异步Go语言代码补全插件，需要deoplete.nvim插件和gocode工具
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

call plug#end()

" 默认的<Leader>键为"\",这里设置为";"
let mapleader = ";"

" 开启语法高亮
syntax on

" 显示行号
set number

" 设置编码格式为utf-8
set encoding=UTF-8

" 自动缩进
set autoindent

" 智能缩进
set smartindent

" 高亮当前行
set cursorline

" 高亮当前列
set cursorcolumn

" 设置读取到'\t'(即tab)的时候，解析为为4个空格
set tabstop=4

" 设置tab为4个空格宽
set shiftwidth=4

" 将tab转为对应宽度个数的空格
set expandtab

" 退格操作时将4个空格当作一个tab删除
set softtabstop=4

" 搜索时忽略大小写
set ignorecase

" cancel line break
set nowrap

" 当光标所在行到底部还剩20行时开始滚动
set so=20

" 设置代码折叠
set fdm=indent

" 设置自动折叠的行数限制
set foldlevel=99

" 调整窗口大小 START
nmap <Leader>v :vertical resize -3<CR>
nmap <Leader>V :vertical resize +3<CR>
nmap <Leader>h :resize -3<CR>
nmap <Leader>H :resize +3<CR>
" 调整窗口大小 END

" -------------------------------- vim-easy-align插件配置开始 --------------------------------
"
" 在visual模式下使用
xmap ga <Plug>(EasyAlign)

" 在normal模式下使用
nmap ga <Plug>(EasyAlign)
"
" -------------------------------- vim-easy-align插件配置结束 --------------------------------


" -------------------------------- nerdtree配置开始 --------------------------------
"
" 当Vim中只剩下nerdtree的时候关闭Vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 将Ctrl-n设置为togglenerdtree的快捷键(Normal模式)
nmap <silent> <C-n> :NERDTreeToggle<CR>

" 即使不指定打开文件时也打开nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当指定打开一个文件夹的时候打开nerdtree
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" 当打开Vim未指定文件时也打开nerdtree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
" -------------------------------- nerdtree配置结束 --------------------------------

" -------------------------------- deoplete插件配置开始 --------------------------------
"
" 启动nvim时启用deoplete
let g:deoplete#enable_at_startup = 1

" 设置gocode的路径
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'

" By default, the completion word list is in the sort order of gocode. Same as omnifunc.
" Display all words while sorting.
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" 启用指针匹配
let g:deoplete#sources#go#pointer = 1

" When enabled, deoplete-go can complete builtin objects.
let g:deoplete#sources#go#builtin_objects = 1

" When enabled, deoplete-go can complete standard library packages that are not explicitely imported yet.
let g:deoplete#sources#go#unimported_packages = 1
"
" -------------------------------- deoplete插件配置开始 --------------------------------
