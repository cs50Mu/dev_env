" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" fix backspace key doesn't work in Insert mode
" see also: http://vimdoc.sourceforge.net/htmldoc/options.html#%27backspace%27
set backspace=2

" pathogen  插件管理工具
execute pathogen#infect()
syntax on
filetype plugin indent on

" settings for ctrlp
let g:ctrlp_map = ',,'
let g:ctrlp_open_multiple_files = 'v'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
let g:ctrlp_custom_ignore = {
            \'dir': '\v[\/]\.(git)$',
            \'file': '\v\.(jpg|png|jpeg)$',
            \}

" vim-go configeration
" auto import dependencies
let g:go_fmt_command = "goimports"
" Code highlighting
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
" highlight the same variable
"let g:go_auto_sameids = 1
" Show type information in status line
"let g:go_auto_type_info = 1
"

" tagbar configeration
let g:tagbar_autofocus = 1


"set fenc=utf-8 " default fileencoding
set fencs=utf-8,gb18030,gbk,gb2312,cp936,ucs-bom,euc-jp,

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ignorecase
set smartcase   "启用智能大小写
" hotkey for remove highlight
nnoremap <leader><space> :noh<cr>
"简化显示
set go=
"设置gui字体
"set guifont=monospace\ 12
"代码折叠方案
set foldmethod=manual
"set foldlevel=99
nnoremap <space> za
vnoremap <space> zf
" highlight folded
" https://stackoverflow.com/questions/24626476/how-to-change-the-folded-part-color-on-vim
highlight Folded ctermbg=red
"设置配色
"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
"显示行号
set number
"设置缩进有三个取值cindent(c风格)、smartindent(智能模式，其实不觉得有什么智能)、autoindent(简单的与上一行保持一致)
set smartindent
"用空格键替换制表符
set expandtab
"制表符占4个空格
set tabstop=4
"默认缩进4个空格大小
set shiftwidth=4
"高亮搜索
set hlsearch
"突出显示当前行
set cursorline
" set statusline
set laststatus=2
set statusline=%F:\ %l,%c
" use tab to switch between different buffers
set hidden "in order to switch between buffers with unsaved change
map <s-tab> :bp<cr>
map <tab> :bn<cr>

"auto complete
autocmd FileType python set omnifunc=pythoncomplete#Complete

" auto close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap () ()
inoremap [ []<left>
inoremap [] []
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.sh,*.php,*.py,*.go exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func! SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1, "\#!/bin/bash") 
		call append(1, "\#########################################################################") 
		call append(2, "\# Author: (".$USER."@domob.cn)") 
		call append(3, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
		call append(4, "\# File Name: ".expand("%")) 
		call append(5, "\# Description: ")
		call append(6, "\#########################################################################") 
	elseif &filetype == 'php'
		call setline(1, "<?php") 
		call append(1, "\#########################################################################") 
		call append(2, "\# Author: (".$USER."@domob.cn)") 
		call append(3, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
		call append(4, "\# File Name: ".expand("%")) 
		call append(5, "\# Description: ")
		call append(6, "\#########################################################################") 
		call append(7, "") 
		call append(8, "class ".substitute(expand("%"), '.php', '', 1)." extends ") 
	elseif &filetype == 'python'
		call setline(1, "\#!/usr/bin/env python")
		call append(1, "\#-*- coding: utf-8 -*-")
		call append(2, "\#########################################################################")
		call append(4, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
		call append(7, "\#########################################################################")
	elseif &filetype == 'go'
		call setline(1, "\//######################################################################")
		call append(2, "\# Author: (".$USER."@domob.cn)") 
		call append(3, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
		call append(4, "\# File Name: ".expand("%")) 
		call append(5, "\# Description: ")
		call append(6, "\//#######################################################################")
	endif
	"endif
	"	if &filetype == 'java'
	"		call append(line(".")+6,"public class ".expand("%"))
	"		call append(line(".")+7,"")
	"	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc 

"Set mapleader
let mapleader = ","
""Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
""When .vimrc is edited, reload it
autocmd bufwritepost .vimrc source ~/.vimrc

"settings for vim-syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_python_checkers = ['pyflakes']

"settings for ale(Asynchronous Lint Engine)
let g:ale_linters = {
\   'python': ['flake8'],
\   'go': ['gofmt', 'golint', 'go build', 'gotype'],
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Set this in your vimrc file to disabling highlighting
let g:ale_set_highlights = 0

"settings for python-syntax
let python_highlight_all = 1

"" set fcitx off when go back into command mode
"let g:input_toggle = 1
"function! Fcitx2en()
"   let s:input_status = system("fcitx-remote")
"   if s:input_status == 2
"      let g:input_toggle = 1
"      let l:a = system("fcitx-remote -c")
"   endif
"endfunction
"
"function! Fcitx2zh()
"   let s:input_status = system("fcitx-remote")
"   if s:input_status != 2 && g:input_toggle == 1
"      let l:a = system("fcitx-remote -o")
"      let g:input_toggle = 0
"   endif
"endfunction
"
"set timeoutlen=150   " 这里的设置与surround.vim冲突，启用后会导致surround.vim不起作用，但这个配置对于针对fcitx的配置又必不可少，只能暂时停用关于fcitx的配置
"autocmd InsertLeave * call Fcitx2en()
""autocmd InsertEnter * call Fcitx2zh()
