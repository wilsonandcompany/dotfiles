set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle

filetype off			" required by vundle

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'
Bundle 'airblade/vim-gitgutter.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'mileszs/ack.vim.git'
Bundle 'Lokaltog/vim-easymotion.git'
Bundle 'xolox/vim-easytags.git'
Bundle 'mhinz/vim-startify.git'
Bundle 'vim-scripts/EasyGrep.git'
filetype plugin indent on 	" required by vundle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" stuff from steve's blog

inoremap jj <ESC>
let mapleader = ","

set nocompatible
set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

nnoremap / /\V
vnoremap / /\V
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <silent> <leader><space> :nohlsearch<CR>

nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my stuff

syntax on
colorscheme molokai
set scroll=5

set splitright
set splitbelow
set showbreak=↪
set nofoldenable
nnoremap Q <nop>

map <c-n> :NERDTreeToggle<CR>
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"let g:EasyMotion_leader_key = '<tab>'

" ycm

let g:ycm_key_list_select_completion = ['<c-j>']
let g:ycm_key_list_previous_completion = ['<c-k>']

" ultisnips
 
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
let g:UltiSnipsSnippetsDir="~/.vim/bundle/ultisnips/Ultisnips"
set runtimepath+=~/.vim/bundle/ultisnips/

" ctrl p navigation

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'c'

" ctags convenience funcs

set tags=./tags;/
"nnoremap <A-]> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
let g:easytags_updatetime_min = 2000

" alternate

autocmd FileType objc let g:alternateExtensions_h = "m" 
autocmd FileType objc let g:alternateExtensions_m = "h"

" auto reloading of vimrc

augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

