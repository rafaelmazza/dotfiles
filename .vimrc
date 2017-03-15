" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set modelines=0 " prevents some security exploits having to do with modelines in files

" ================ General Config ====================

set fillchars+=vert:\ 
hi VertSplit ctermfg=240 ctermbg=240 cterm=bold

set clipboard=unnamed
set relativenumber 
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set laststatus=2                "Always show status line
set nowrap                      "Don't wrap lines
set linebreak                   "Wrap lines at convenient points
set cursorline
set t_Co=256
set undofile
set undodir=$HOME/.vim/undo 
set mouse=a

hi cursorline cterm=none ctermbg=240

syntax on

inoremap jj <ESC>

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

set splitbelow
set splitright

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let mapleader = ","
let g:elm_format_autosave = 1

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" Make gf (go to file) create the file, if not existent
nnoremap <C-w>f :sp +e<cfile><CR>
nnoremap <C-w>gf :tabe<cfile><CR>


" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb


" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" ==== NERD tree
map <Leader>n :NERDTreeToggle<CR>
map <Leader>d :NERDTree %:h<CR>

nmap <Leader>t :GFiles<CR><esc>
nmap <Leader>f :Files<CR><esc>

nnoremap <leader>ev :e $MYVIMRC<cr>
" nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" move up/down quickly by using Cmd-j, Cmd-k
" which will move us around by functions
nnoremap <silent> <D-j> }
nnoremap <silent> <D-k> {

nnoremap ; :

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

map <C-q> :!python -m json.tool<cr>

" dash separated words as a word
set isk+=-


" ================ Grep =============================

"grep the current word using K (mnemonic Kurrent)
nnoremap <silent> K :Ag <cword><CR>

",gg = Grep! - using Ag the silver searcher
" open up a grep line, with a quote started for the search
nnoremap ,gg :Ag 

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ================ Plugins ==========================

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'elmcast/elm-vim'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab'
Plug 'tpope/vim-rails'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'hashivim/vim-terraform'

call plug#end()
