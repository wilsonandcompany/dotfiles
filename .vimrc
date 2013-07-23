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
"Bundle 'scrooloose/syntastic.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'git://github.com/pangloss/vim-javascript.git'
Bundle 'tpope/vim-rails.git'
Bundle 'mileszs/ack.vim.git'
Bundle 'Lokaltog/vim-easymotion.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'Chiel92/vim-autoformat'
Bundle 'elzr/vim-json.git'
Bundle 'ervandew/screen.git'
Bundle 'slim-template/vim-slim'
Bundle 'othree/xml.vim'
Bundle 'scrooloose/nerdcommenter.git'
filetype plugin indent on 	" required by vundle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" stuff from steve's blog

" easily quit insert mode
inoremap jj <ESC>
"let mapleader = ","

set nocompatible
set modelines=0

" tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab                     " turn tabs into spaces

set encoding=utf-8
set scrolloff=5                   " minimal number of screen lines above/below cursor
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
set background=dark
colorscheme solarized
set scroll=5

set number                        " line numbers
set splitright                    " new splits are opened on the top
set splitbelow                    " new splits are opened on the bottom
set list                          " display unprinable characters with ^
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

nnoremap <c-w>< 10<c-w><
nnoremap <c-w>< 10<c-w>>
nnoremap <c-w>- 10<c-w>-
nnoremap <c-w>+ 10<c-w>+

command Vimrc e ~/.vimrc

let g:ackprg = 'ag --nogroup --ignore-case --literal --all-text --follow'

" xml
let xml_use_xhtml = 1

" easy motion

map <C-J> <leader><leader>j
map <C-K> <leader><leader>k

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
" mapping alt keys

"vnoremap <Esc> <C-v><Esc>
"cnoremap <Esc> <C-c>
"map <A-c> ihello<esc>
"let c='a'
"while c <= 'z'
"  exec "set <A-".c.">=\e".c
"  exec "imap \e".c." <A-".c.">"
"  let c = nr2char(1+char2nr(c))
"endw

"let c='A'
"while c <= 'Z'
"  exec "set <A-".c.">=\e".c
"  exec "imap \e".c." <A-".c.">"
"  let c = nr2char(1+char2nr(c))
"endw

"set timeout ttimeoutlen=50

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
