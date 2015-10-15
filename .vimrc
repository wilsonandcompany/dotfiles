set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle

filetype off                            " required by vundle

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic.git'
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/nerdtree.git'
Bundle 'tpope/vim-surround.git'
Bundle 'mileszs/ack.vim.git'
Bundle 'Lokaltog/vim-easymotion.git'
Bundle 'xolox/vim-easytags.git'
Bundle 'xolox/vim-session.git'
Bundle 'xolox/vim-misc.git'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'majutsushi/tagbar.git'
Bundle 'vim-scripts/greplace.vim.git'
Bundle 'bling/vim-airline'
Bundle 'tomasr/molokai'

Bundle 'airblade/vim-gitgutter.git'
Bundle 'tpope/vim-fugitive.git'

Bundle 'elzr/vim-json.git'
Bundle 'git://github.com/pangloss/vim-javascript.git'
Bundle 'othree/javascript-libraries-syntax.vim.git'
"Bundle 'kchmck/vim-coffee-script.git'
"Bundle 'tpope/vim-liquid.git'
"Bundle 'tpope/vim-markdown.git'
"Bundle 'tpope/vim-rails.git'

filetype plugin indent on               " required by vundle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" stuff from steve's blog

" easily quit insert mode
inoremap jj <ESC>
inoremap jf <ESC>
"let mapleader = ","

set nocompatible
set modelines=0

" tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab                     " turn tabs into spaces

augroup file_type_styling
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
augroup END

set encoding=utf-8
set scrolloff=3                   " minimal number of screen lines above/below cursor
set autoindent
set autochdir

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

" sane movement over line wrapped lines
nnoremap j gj
nnoremap k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my stuff

nnoremap <leader><space> :noh<cr>
set gfn=Menlo\ Regular:h14

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" fix for macvim
set go-=L

syntax on
colorscheme molokai

set number                        " line numbers
set splitright                    " new splits are opened on the top
set splitbelow                    " new splits are opened on the bottom
set list                          " display unprinable characters with ^
set listchars:trail:·             " show trailing spaces with symbol
"set listchars=tab:>-,trail:~,extends:>,precedes:<
set showbreak=↪                   " show line breaks
set autoread                      " auto read files changed outside of vim

" swap jump to beginning of line with beginning of text
nnoremap 0 ^
nnoremap ^ 0

set nofoldenable
nnoremap K <nop>
nnoremap Q <nop>
nnoremap <C-W><C-C> <nop>
nnoremap <C-W>c <nop>

nnoremap <c-w>< 15<c-w><
nnoremap <c-w>> 15<c-w>>
nnoremap <c-w>- 10<c-w>-
nnoremap <c-w>+ 10<c-w>+

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set clipboard=unnamed

let g:ackprg = 'ag --nogroup --ignore-case --literal --all-text --follow --column'

set completeopt-=preview

"autocmd BufEnter * silent! lcd %:p:h

" javascript-libraries-syntax

let g:used_javascript_libs = 'jquery,angularjs,jasmine'

" tag bar
nmap <c-[> :TagbarOpenAutoClose<CR>

" session

let g:session_autosave = 'no'
let g:session_autoload = 'yes'
nnoremap <f5> :OpenSession<cr>

" NERD Tree

let NERDTreeShowBookmarks = 1
map <c-b> :NERDTreeFind<CR>
map <c-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.swp$','\.pyc$', '\.meta$']

" syntastic

let g:syntastic_check_on_open=1
let g:syntastic_quiet_quiet_messages = {'level': 'warnings'}
let g:syntastic_stl_format = '[E:%fe]'
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_html_tidy_ignore_errors = [
    \"trimming empty <i>",
    \"trimming empty <span>",
    \"<input> proprietary attribute \"autocomplete\"",
    \"proprietary attribute \"role\"",
    \"proprietary attribute \"hidden\"",
    \"proprietary attribute \"ng-",
\]

"let g:loaded_syntastic_javascript_jshint_checker
let g:syntastic_always_populate_loc_list=1

" status line

set statusline=
set statusline+=%m
set statusline+=%f\                    " path
set statusline+=%=%#error#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*[%l:%c]            " line and column

" ycm

let g:ycm_key_list_select_completion = ['<C-J>']
let g:ycm_key_list_previous_completion = ['<C-K>']
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0

" git gutter

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" easy motion

map <C-J> <leader><leader>j
map <C-K> <leader><leader>k
let g:EasyMotion_keys = 'asdfghjkl;'

" xml

let xml_use_xhtml = 1

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
"let g:UltiSnipsSnippetsDir="~/.vim/bundle/ultisnips/Ultisnips"
let g:UltiSnipsSnippetsDir="~/.vim/my_snippets"
set runtimepath+=~/.vim/bundle/ultisnips/

" ctrl p

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'c'
set wildignore+=*/build/*,*/tmp/*,*.so,*.swp,*.zip,*.exe,*.so,*.dll,*.meta,*.png,*.wav

let g:ctrlp_root_markers = ['.ctrlp_root']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|xcodeproj)|_site$',
  \ 'file': '\v\.(exe|so|dll|meta)|node_modules|test_out$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_max_depth = 1000
let g:ctrlp_max_files = 0

" ctags convenience funcs

let g:easytags_updatetime_min = 2000
let g:easytags_async = 1

" functions + commands =========================================================

command! Vimrc e ~/.vimrc
command! Respace %s!\s\+$!

" auto reloading of vimrc

augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" max/min windows

nnoremap <C-\> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    unlet s:maximize_session
    wincmd =
  else
    let s:maximize_session = 1
    vertical res
  endif
endfunction

" Delete hidden buffers
function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
    echo 'OK'
endfunction

" SetTab
function! SetTab(spaces)
    set shiftwidth=a:spaces tabstop=a:spaces softtabstop=a:spaces
endfunction

" SaveQuickFixList
command! SaveQuickFixList call SaveQuickFixList()
function! SaveQuickFixList()
    let fname = $HOME . "/.vim_quick_fix_list"
    let list = getqflist()
    for i in range(len(list))
        if has_key(list[i], 'bufnr')
            let list[i].filename = fnamemodify(bufname(list[i].bufnr), ':p')
            unlet list[i].bufnr
        endif
    endfor
    let string = string(list)
    let lines = split(string, "\n")
    call writefile(lines, fname)
endfunction

" LoadQuickFixlist
command! LoadQuickFixList call LoadQuickFixList()
function! LoadQuickFixList()
    let fname = $HOME . "/.vim_quick_fix_list"
    let lines = readfile(fname)
    let string = join(lines, "\n")
    call setqflist(eval(string))
endfunction
