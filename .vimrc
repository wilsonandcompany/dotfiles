set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle

filetype off			" required by vundle

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'
Bundle 'airblade/vim-gitgutter.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'git://github.com/pangloss/vim-javascript.git'
Bundle 'tpope/vim-rails.git'
Bundle 'mileszs/ack.vim.git'
Bundle 'mhinz/vim-startify.git'
Bundle 'Lokaltog/vim-easymotion.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'Chiel92/vim-autoformat'
Bundle 'elzr/vim-json.git'
Bundle 'ervandew/screen.git'
Bundle 'slim-template/vim-slim'
filetype plugin indent on 	" required by vundle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" stuff from steve's blog

inoremap jj <ESC>
"nnoremap ; :
let mapleader = ","

set nocompatible
set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
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
nnoremap <leader><space> :noh<cr>

nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my stuff

syntax on
set background=dark
colorscheme solarized
set scroll=5

set number
set splitright
set splitbelow
set list
set listchars:trail:·
set scrolloff=5
set autoread
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

map <c-n> :NERDTreeToggle<CR>
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" ultisnips

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
let g:UltiSnipsSnippetsDir="~/.vim/my_snippets"
set runtimepath+=~/.vim/bundle/ultisnips/

" ctrl p navigation

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc'

" ctags convenience funcs

set tags=./tags;/
"map <A-]> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" irb-config

" Screen settings
let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
let g:ScreenShellInitialFocus = 'shell'
let g:ScreenShellQuitOnVimExit = 0
map <F5> :ScreenShellVertical<CR>
command -nargs=? -complete=shellcmd W  :w | :call ScreenShellSend("load '".@%."';")
map <Leader>r :w<CR> :call ScreenShellSend("rspec ".@% . ':' . line('.'))<CR>
map <Leader>e :w<CR> :call ScreenShellSend("cucumber --format=pretty ".@% . ':' . line('.'))<CR>
map <Leader>b :w<CR> :call ScreenShellSend("break ".@% . ':' . line('.'))<CR>
