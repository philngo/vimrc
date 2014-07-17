"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"    .vimrc
"
"    commands
"
"       ;               :
"       <C-c>           <Esc>
"       <C-p>           to open a file
"       '. or `.        to last edit
"       g*              find word under cursor
"       gd              find definition of word under cursor
"       ,               leader
"       <C-u> or <C-d>  pageup/pagedown
"       t_ or f_        delete to next _ (ex/inclusive)
"       ,tw             :%s/\s\+$//
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" general
set encoding=utf-8
set nocompatible

" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'              " :PluginInstall
Plugin 'hukl/Smyck-Color-Scheme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mileszs/ack.vim'                " searching                 ,a
Plugin 'kien/ctrlp.vim'                 " searching                 <C-p>
Plugin 'scrooloose/nerdtree'            " directory tree            :e .
Plugin 'vim-scripts/trailing-whitespace'
Plugin 'tomtom/tcomment_vim'            " comment line              gcc
Plugin 'tpope/vim-fugitive'             " git viewing               :Gedit
Plugin 'gregsexton/gitv'                " gitk clone                :Gitv
Plugin 'bling/vim-airline'              " status line
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-markdown'
Plugin 'davidhalter/jedi-vim'
call vundle#end()
filetype plugin indent on

" syntax highlighting and auto-indentation
syntax on

" solarized - use corresponding terminal theme
if has('gui_running')
    set background=light
else
    set background=dark
endif
set t_Co=16
let g:solarized_termcolors=16
colorscheme solarized

" smyck - use corresponding terminal theme
" set background=dark
" set t_Co=256
" colorscheme smyck

" tabs
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

" indenting
set autoindent
set smartindent

" display line numbers
set number

" no automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" search highlight
set incsearch

" disable backups
set nobackup
set nowritebackup
set noswapfile

" disable sounds
set noerrorbells

" keep at least 5 lines below the cursor
set scrolloff=5

" show which mode (insert/visual/normal) is on
set showmode

" show partially typed command in bottom right
set showcmd

" show grid number in bottom right
set ruler

" smoother redraws for a fast terminal
set ttyfast

" always draw a status line
set laststatus=2

" set airline statusline
let g:airline#extensions#tabline#enabled = 1

" Show hidden files *except* the known temp files, system files & VCS files
let NERDTreeShowHidden = 1

let NERDTreeIgnore = []
for suffix in split(&suffixes, ',')
    let NERDTreeIgnore += [ escape(suffix, '.~') . '$' ]
endfor
let NERDTreeIgnore += ['^\.bundle$', '^\.bzr$', '^\.git$', '^\.hg$', '^\.sass-cache$', '^\.svn$', '^\.$', '^\.\.$', '^Thumbs\.db$']


" wrap long lines and break them at natural places
set wrap
set linebreak

" don't show ends of lines or tab v. space
set nolist

" better tab completion on commands
"  1 tab completes, 2 tabs list, 3+ tabs cycles
set wildmenu
set wildmode=longest,list,full

" highlighting at 80 columns and past 120
let &colorcolumn="80,".join(range(120,999),",")

" set default tex
let g:tex_flavor = "latex"

" copy to clipboard
set clipboard=unnamed

" command mappings
nnoremap ; :
nnoremap <C-j> :bp<CR>
nnoremap <C-k> :bn<CR>
nmap <CR> o<Esc>
nmap <S-Enter> O<Esc>

" shortcuts to common commands
let mapleader = ","
nnoremap <leader>a   :Ack
nnoremap <leader>p   :set paste<CR>
nnoremap <leader>tw  :%s/\s\+$//<CR>

" make backspace work like most other apps
set backspace=2

" Set filetypes
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead *.ino set filetype=c
