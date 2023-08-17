"
" A (not so) minimal vimrc.
" Mostly taken from https://github.com/mhinz/vim-galore
"
" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitly to make our position clear!
set nocompatible

" Install vim-plug if it isn't installed yet
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Configure plugins with vim-plug
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'chriskempson/base16-vim'

Plug 'editorconfig/editorconfig-vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
call plug#end()

" Things already included in vim-sensible
"filetype plugin indent on  " Load plugins according to detected filetype.
"syntax on                  " Enable syntax highlighting.
"set autoindent             " Indent according to previous line.
"set backspace   =indent,eol,start  " Make backspace work as you would expect.
"set laststatus  =2         " Always show statusline.
"set display     =lastline  " Show as much as possible of the last line.

set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set hidden                 " Switch between buffers without having to save first.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

set list                   " Show non-printable characters.


if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#temporary-files
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo

""""""""""""""""""""""""""
" My settings start here "
""""""""""""""""""""""""""
set ignorecase      " Do case insensitive search
set smartcase       " Do case sensitive search if the search includes uppercase chars
set showmatch       " When typing a bracket, briefly jump to its match
set visualbell      " Flash the screen when an error occurs
set title           " Set window title to current filename and path
set undolevels=1000 " Allow undo up to 1000 times. Matches the history setting in vim-sensible
set nofoldenable    " Disable folding
set number          " Show absolute line numbers

set termguicolors   " Allow 24-bit color in the terminal. Requires ISO-8613-3 compatible terminal
" if has('gui_running')
    set background=dark
    " set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 13
    set guifont=InconsolataGo\ Nerd\ Font\ Regular\ 16
    colorscheme base16-tomorrow-night
" else
"     colorscheme elflord
" endif

" Set the leader key to , instead of the default \
let mapleader = ","

" In gvim, disable the buttons toolbar
set guioptions-=T

" Switch to previous buffer with ",b"
map <leader>b :b#<CR>

" Reselect visual block after indent/outdent 
vnoremap < <gv
vnoremap > >gv

" Remap the vim-commentary commands to match nerdcommenter
nmap <leader>c<Space> gcc
vmap <leader>c<Space> gc

" Make netrw easier to use
let g:netrw_banner       = 0    " Don't show the banner
let g:netrw_keepdir      = 0    " The current directory tracks the browsing directory
let g:netrw_liststyle    = 3    " Use the tree view
let g:netrw_sort_options = 'i'  " Use case-insensitive sort

" FZF
" Set the size and location of the fzf window
let g:fzf_layout = {'down': '70%'}
" Preview window on the upper side of the window with 40% height.
" ctrl-/ should toggle the preview window, but it doesn't work
" for some reason.
let g:fzf_preview_window = ['up:50%', 'ctrl-/'] 
" CTRL-N to search for files by name
map <C-N> :Files<CR>
" CTRL-E to search for open buffers by filename
map <C-e> :Buffers<CR>
" CTRL-f to search the contents of all files using ripgrep
map <C-f> :Rg<CR>


autocmd filetype ruby set shiftwidth=2
autocmd filetype ruby set tabstop=2
autocmd filetype ruby set softtabstop=2

