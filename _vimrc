"默认
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"编码
set fileencodings=utf-8
set fileencoding=utf-8
set encoding=utf-8
set langmenu=en_US.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages en_US.utf-8

"外观
set number
set nobackup
set noswapfile
set linebreak
set expandtab
set autoindent
set autochdir
set smartindent
set lines=20
set columns=80
set tabstop=4
set scrolloff=4
set shiftwidth=4
set softtabstop=4
set showtabline=1
set shortmess=atI
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Menlo:h14
set guicursor=i-ci:ver1-Cursor/lCursor
colorscheme darkZ

"语法高亮
au BufRead,BufNewFile *.less setfiletype css
au BufRead,BufNewFile *.ejs setfiletype html

"符号补全
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

"生成头部文件
function! InitHTML()
	call setline(1,'<!DOCTYPE html>')
	call append(1,'<html>')
	call append(2,'<head>')
	call append(3,'<meta charset="utf-8">')
	call append(4,'<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">')
	call append(5,'<title>undefined</title>')
	call append(6,'</head>')
	call append(7,'<body>')
	call append(8,'</body>')
	call append(9,'</html>')
endf
map html :call InitHTML()<CR>

"标签自动闭合
function! InsertHtmlTag()
	let pat = '\c<\w\+\s*\(\s\+\w\+\s*=\s*[''#$;,()."a-z0-9]\+\)*\s*>'
	normal! a>
	let save_cursor = getpos('.')
	let result = matchstr(getline(save_cursor[1]), pat)
	if (search(pat, 'b', save_cursor[1]))
		normal! lyiwf>
		normal! a</
		normal! p
		normal! a>
	endif
	:call cursor(save_cursor[1], save_cursor[2], save_cursor[3])
endfunction
inoremap > <ESC>:call InsertHtmlTag()<CR>a

"Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'EasyGrep'

call vundle#end()
filetype plugin indent on 

"NERDTree
map <F12> :NERDTreeToggle ~/workspace<CR>
map <F2> :NERDTreeFind<CR>
let NERDTreeMinimalUI=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
