filetype plugin indent on

syntax on
colorscheme elflord

" ctrl p navigation

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'c'

" relative and absolute numbers

set number
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-m> :call NumberToggle()<cr>

" stuff from steve's blog

inoremap jj <ESC>
nnoremap ; :
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
set undofile

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" my stuff

set scroll=5
nnoremap <leader>j :A<cr>

set runtimepath+=~/.vim/bundle/ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

map <C-n> :NERDTreeToggle<CR>

" vundle

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" vundle bundles

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'
Bundle 'airblade/vim-gitgutter.git'
