"encode
set fileencodings=utf-8
set fileencoding=utf-8
set encoding=utf-8
set langmenu=en_US.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages en_US.utf-8

"interface
set number
set nowrap
set hlsearch
set nobackup
set linebreak
set expandtab
set noswapfile
set autoindent
set smartindent
set nocompatible
set go=
set lines=20
set columns=80
set tabstop=4
set scrolloff=4
set shiftwidth=4
set softtabstop=4
set showtabline=1
set shortmess=atI
set guifont=Menlo:h14
set guicursor=i-ci:ver1-Cursor/lCursor

"Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'easymotion/vim-easymotion'
Plugin 'pangloss/vim-javascript'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'gregsexton/MatchTag'
Plugin 'Raimondi/delimitMate'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'

call vundle#end()
filetype plugin indent on 

"solarized
syntax enable
set background=dark
colorscheme solarized

"airline
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

"syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"CtrlP
let g:ctrlp_working_path_mode = 'a'

"NERDTree
map <F12> :NERDTreeToggle ~/workspace<CR>
map <F2> :NERDTreeFind<CR>
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=2
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

"jsbeautify
autocmd FileType javascript noremap <buffer>  <F5> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <F5> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <F5> :call CSSBeautify()<cr>
