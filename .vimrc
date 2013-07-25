set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle

filetype off                            " required by vundle

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
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'git://github.com/pangloss/vim-javascript.git'
Bundle 'tpope/vim-rails.git'
Bundle 'mileszs/ack.vim.git'
Bundle 'Lokaltog/vim-easymotion.git'
Bundle 'xolox/vim-easytags.git'
"Bundle 'altercation/vim-colors-solarized.git'
Bundle 'Chiel92/vim-autoformat'
Bundle 'elzr/vim-json.git'
Bundle 'othree/xml.vim'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'mhinz/vim-startify.git'
filetype plugin indent on               " required by vundle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" stuff from steve's blog

" easily quit insert mode
inoremap jj <ESC>
"let mapleader = ","

set nocompatible
set modelines=0

" tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab                     " turn tabs into spaces

set encoding=utf-8
set scrolloff=3                   " minimal number of screen lines above/below cursor
set autoindent

set showmode                      " show current mode
set showcmd                       " show command last line bottom right
set hidden                        " buffers become hidden when abandoned
set wildmenu                      " enhanced autocomplete
set wildmode=list:longest         " ...
set cursorline                    " highlight line that cursor is on
set ttyfast                       " fast terminal connection for redrawing
set ruler                         " show line column number
set backspace=indent,eol,start    " fixes possible issues with backspace on certain systems
set laststatus=2                  " last window will always have status line

" literal search
nnoremap / /\V
vnoremap / /\V

set gdefault                      " g is on by default for substitute
set ignorecase                    " ignores case sensitivity in search
set smartcase                     " ignores ignorecase if any capitals present in search
set showmatch                     " briefly move the cursor to matching cursor
set incsearch                     " highlights while typing search
set hlsearch                      " highlights all search matches
" clear search highlight
nnoremap <leader><Space> :noh<cr>

" sane movement over line wrapped lines
nnoremap j gj
nnoremap k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my stuff

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

syntax on
colorscheme molokai
set background=dark
set scroll=5

command! Vimrc e ~/.vimrc

set number                        " line numbers
set splitright                    " new splits are opened on the top
set splitbelow                    " new splits are opened on the bottom
"set list                          " display unprinable characters with ^
set listchars:trail:·             " show trailing spaces with symbol
set showbreak=↪                   " show line breaks
set autoread                      " auto read files changed outside of vim

" swap jump to beginning of line with beginning of text
nnoremap 0 ^
nnoremap ^ 0

set nofoldenable
nnoremap Q <nop>

map <c-n> :NERDTreeToggle<CR>
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" syntastic

let g:syntastic_check_on_open=1
"let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_quiet_warnings=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" easy motion

map <C-J> <leader><leader>j
map <C-K> <leader><leader>k

nnoremap <c-w>< 10<c-w><
nnoremap <c-w>< 10<c-w>>
nnoremap <c-w>- 10<c-w>-
nnoremap <c-w>+ 10<c-w>+

let g:ackprg = 'ag --nogroup --ignore-case --literal --all-text --follow --column'

" ycm 

let g:ycm_key_list_select_completion = ['<c-j>']
let g:ycm_key_list_previous_completion = ['<c-k>']

" xml

let xml_use_xhtml = 1

" easy motion

map <C-J> <leader><leader>j
map <C-K> <leader><leader>k

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

"autocmd FileType objc let g:alternateExtensions_h = "m" 
"autocmd FileType objc let g:alternateExtensions_m = "h"

" auto reloading of vimrc

augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" irb-config

" Screen settings
let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
let g:ScreenShellInitialFocus = 'shell'
let g:ScreenShellQuitOnVimExit = 0
map <F5> :ScreenShellVertical<CR>
"command -nargs=? -complete=shellcmd W  :w | :call ScreenShellSend("load '".@%."';")
map <Leader>r :w<CR> :call ScreenShellSend("rspec ".@% . ':' . line('.'))<CR>
map <Leader>e :w<CR> :call ScreenShellSend("cucumber --format=pretty ".@% . ':' . line('.'))<CR>
map <Leader>b :w<CR> :call ScreenShellSend("break ".@% . ':' . line('.'))<CR>
