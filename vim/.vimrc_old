set nocompatible              " be iMproved, required
filetype off                  " required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Other plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'chriskempson/base16-vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'fatih/vim-go'
Plugin 'jremmen/vim-ripgrep'
Plugin 'kien/ctrlp.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ap/vim-css-color'
Plugin 'cespare/vim-toml'
" Plugin 'fholgado/minibufexpl.vim'
" Plugin 'tomtom/quickfixsigns_vim'
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required by Vundle
filetype plugin indent on    " required by Vundle

" Settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set number
set autoindent
set smarttab
set showmatch
set hidden

set ignorecase
set smartcase
set hlsearch
set incsearch

set history=64
set undolevels=64
set title
set visualbell

" Syntax highlighting can cause searching in a file to be slow if these are enabled
set nocursorcolumn
set nocursorline

" Disable folding
set nofoldenable

" In gvim, disable the buttons toolbar
set guioptions-=T

" Set the leader key to , instead of the default \
let mapleader = ","

map nt :NERDTree<CR>
"map <C-T> :CtrlP<CR>
" Remap ctrlP to CTRL-N to be closer to the IntelliJ shortcuts
let g:ctrlp_map = '<c-s-n>'
map <c-e> :CtrlPBuffer<CR>

" Tell CTRL-P to use ripgrep if it's installed
" The main advantage here is the way it respects .gitignore and .ignore, but
" it's also generally faster than CTRL-P itself.
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" Switch to previous buffer with ",b"
map <leader>b :b#<CR>

" Reselect visual block after indent/outdent 
vnoremap < <gv
vnoremap > >gv

" Remap the vim-commentary commands to match nerdcommenter
nmap <leader>c<Space> gcc
vmap <leader>c<Space> gc

" Draw a vertical line in the 80th column
set colorcolumn=80

" Set up the status line
" set statusline=%t             "tail of the filename
" set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
" set statusline+=%{&ff}]       "file format
" set statusline+=%h            "help file flag
" set statusline+=%m            "modified flag
" set statusline+=%r            "read only flag
" set statusline+=%y            "filetype
" set statusline+=%=            "left/right separator
" set statusline+=%#warningmsg# " warning highlight color
" set statusline+=%{SyntasticStatuslineFlag()} " syntastic flags, if they exist
" set statusline+=%*            "switch back to normal statusline highlight
" set statusline+=%c,           "cursor column
" set statusline+=%l/%L         "cursor line/total lines
" set statusline+=\ %P          "percent through file

" Syntastic settings
" let g:syntastic_auto_loc_list=1 " Automatically open and close the location list
" let g:syntastic_loc_list_height=4 " Set the default size of the location list

" vim-powerline settings
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" vim-airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'

if has('gui_running')
  set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 13
endif

"if &t_Co >= 256 || has("gui_running")
if has("gui_running")
    set background=dark
    colorscheme base16-tomorrow-night
    " colorscheme Tomorrow-Night
    " colorscheme elflord
else
    colorscheme Tomorrow-Night
    " colorscheme elflord
endif

" autocmd filetype ruby set shiftwidth=2
" autocmd filetype ruby set tabstop=2
" autocmd filetype ruby set softtabstop=2

" autocmd filetype python set shiftwidth=4
" autocmd filetype python set tabstop=4
" autocmd filetype python set softtabstop=4

" Set SASS and SCSS files to be the CSS file type
" autocmd BufNewFile,BufRead *.scss set filetype=scss
" autocmd BufNewFile,BufRead *.sass set filetype=sass

" Set line marker to 100 for rust files
autocmd filetype rust set colorcolumn=100

" Run rustfmt on save
let g:rustfmt_autosave = 1

" Set Mozilla JSM files to use the javascript file type
" au BufNewFile,BufRead *.jsm set filetype=javascript

" Go syntax
" au BufRead,BufNewFile *.go set filetype=go

" Recognize .md files as Markdown, not Modula-2
" autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Rust :make support
" autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo

" Perl Template Toolkit syntax
" au BufNewFile,BufRead *.tt2 setf tt2html
" au BufNewFile,BufRead *.tt setf tt2html

" Fix HTML indenting
" autocmd FileType html setlocal indentkeys-=*<Return>

" Start NERDTree automatically
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

