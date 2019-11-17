" --------------------------------- neovim配置文件 ---------------------------------
"
" RonaldZhao个人使用的配置，主要适配Go语言。
"
" 此文件的存放路径: ~/.config/nvim/init.vim
"
" 指定一个插件安装的目录
" - 避免使用如'plugin'的标准Vim目录
call plug#begin('~/.nvim/plugins')
" 一个简单易用的Vim对齐插件
Plug 'junegunn/vim-easy-align'
" 针对Go语言开发的插件
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" 一个搜索插件，需要先brew install fzf
" 如果使用Rg命令还需要提前安装ripgrep(brew install ripgrep)
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" 文件管理器
Plug 'scrooloose/nerdtree'
" nerdtree中显示git状态的插件
Plug 'Xuyuanp/nerdtree-git-plugin'
" 智能注释插件，需要在配置文件中添加'filetype plugin on'
Plug 'scrooloose/nerdcommenter'
" 文件图标插件
Plug 'ryanoasis/vim-devicons'
" 状态栏插件
Plug 'vim-airline/vim-airline'
" vim-airline主题插件
Plug 'vim-airline/vim-airline-themes'
" 代码大纲插件
Plug 'majutsushi/tagbar'
" git集成插件
Plug 'tpope/vim-fugitive'
" git状态提示插件
Plug 'airblade/vim-gitgutter'
" dracula主题
Plug 'dracula/vim', { 'as': 'dracula' }
" onedark主题
Plug 'joshdick/onedark.vim'
" gruvbox主题
Plug 'morhetz/gruvbox'
" 实现了大部分Langserver的自动补全插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
" -------------------------------- vim配置开始 --------------------------------
"
" 默认的<Leader>键为"\",这里设置为";"
let mapleader = ";"
" 开启语法高亮
syntax on
" nerdcommenter插件需要
filetype plugin on
" 将主题设置为dracula
" colorscheme dracula
" 将主题设置为onedark
" colorscheme onedark
" 将主题设置为gruvbox
colorscheme gruvbox
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
" 自动折行，但不加入换行符
set wrap
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
" 配置FZF快捷键，需要fzf和fzf.vim
nmap <silent> ff :FZF<CR>
" -------------------------------- vim配置结束 --------------------------------

" -------------------------------- vim-easy-align插件配置开始 --------------------------------
" 在visual模式下使用
xmap ga <Plug>(EasyAlign)
" 在normal模式下使用
nmap ga <Plug>(EasyAlign)
" -------------------------------- vim-easy-align插件配置结束 --------------------------------

" -------------------------------- nerdtree配置开始 --------------------------------
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
" -------------------------------- nerdtree配置结束 --------------------------------
"
" -------------------------------- vim-go插件配置开始 --------------------------------
" 将转到定义应设为<Leader>gd(Normal模式)
nmap <silent> <Leader>gd :GoDef<CR>
" 转到定义Pop
nmap <silent> <Leader>gdp :GoDefPop<CR>
" 格式化代码
nmap <silent> <Leader>gf :GoFmt<CR>
" -------------------------------- vim-go插件配置结束 --------------------------------
"
" -------------------------------- tagbar插件配置开始 --------------------------------
nmap <silent> <Leader>tg :TagbarToggle<CR>
" -------------------------------- tagbar插件配置结束 --------------------------------
"
" -------------------------------- git插件配置开始 --------------------------------
nmap <silent> <Leader>gb :Gblame<CR>
" -------------------------------- git插件配置结束 --------------------------------
"
" -------------------------------- nerdcommenter插件配置开始 --------------------------------
" 自动在注释符后边加一个空格
let g:NERDSpaceDelims = 1
" 取消注释的时候自动去掉末尾的空格
let g:NERDTrimTrailingWhitespace = 1
" 让插件自动判断所有行是否注释了
let g:NERDToggleCheckAllLines = 1
" 使用块注释的时候统一左对齐注释符
let g:NERDDefaultAlign = 'left'
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" -------------------------------- nerdcommenter插件配置结束 --------------------------------
"
" -------------------------------- coc.nvim插件配置开始 --------------------------------
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

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" enable highlight current symbol on CursorHold ---- coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')
" coc-prerrier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" -------------------------------- coc.nvim插件配置结束 --------------------------------
