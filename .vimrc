""""""""""""""""""""""""
"                      "
"    Phil's .vimrc     "
"                      "
""""""""""""""""""""""""

" general
set encoding=utf-8
set nocompatible

" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" commands
Plugin 'gmarik/Vundle.vim'                  " plugin manager                  :PluginInstall or $ vim +PluginInstall +qall
Plugin 'kien/ctrlp.vim'                     " searching files in directory    <C-p>
Plugin 'scrooloose/nerdtree'                " directory tree                  :e .
Plugin 'tomtom/tcomment_vim'                " comment/uncomment line          gcc
Plugin 'sirver/ultisnips'                   " snippets                        :UltiSnipsEdit
Plugin 'triglav/vim-visual-increment'       " incrementing nums in vis select <C-A>
Plugin 'tpope/vim-unimpaired'               " quick bracket commands          :cnext :cprev -> ]q [q
Plugin 'tpope/vim-abolish'                  " substitution with capitals      :%S/facilit{y,ies}/building{,s}/g
Plugin 'Valloric/YouCompleteMe'             " text completion                 <tab>
" look and feel plugins
Plugin 'airblade/vim-gitgutter'             " show git diff status by numbers
Plugin 'bling/vim-airline'                  " nice looking bottom status line
Plugin 'altercation/vim-colors-solarized'
" syntax highlighting
Plugin 'vim-scripts/trailing-whitespace'    " show trailing whitespace as red ->  
Plugin 'sukima/xmledit'
Plugin 'vim-scripts/django.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'burnettk/vim-angular'
Plugin 'posva/vim-vue'
Plugin 'tpope/vim-markdown'
Plugin 'ingydotnet/yaml-vim'
Plugin 'hashivim/vim-terraform'
Plugin 'hail2u/vim-css3-syntax'
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

" tabs
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

" indenting
set autoindent
set smartindent

" display line numbers
set number  " relativenumber

" no automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" search highlight
set incsearch

" smart case for search
set ignorecase
set smartcase

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

" settings for ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/vendors/*,*/vendor/*
set wildignore+=*/node_modules/*,*/coverage/*,*/.tox/*,*/.eggs/*,*/.cache/*
set wildignore+=*/.DS_Store,*.egg-info/*,*/build/lib/*.py
set wildignore+=*/.docker-pipenv-cache/*

" */staticfiles/*,
let g:ctrlp_show_hidden = 1

" highlighting at 80 columns and past 120
let &colorcolumn="88,".join(range(120,999),",")

" set default tex
let g:tex_flavor = "latex"

" YCM settings
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" ultsnips settings
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

" copy to clipboard
set clipboard=unnamed

" command mappings
nnoremap ; :
nnoremap <C-j> :bp<CR>
nnoremap <C-k> :bn<CR>
nmap <CR> o<Esc>
nmap <S-Enter> O<Esc>
nnoremap <Space> i<Space><Esc>l
inoremap kj <Esc>

" shortcuts to common commands
let mapleader = ","
nnoremap <leader>a   :Ack
nnoremap <leader>p   :set paste<CR>
nnoremap <leader>np  :set nopaste<CR>
nnoremap <leader>tw  :%s/\s\+$//<CR>
nnoremap <leader>c   gcc
nnoremap <leader>v   :e ~/.vimrc<CR>
nnoremap <leader>sv  :source ~/.vimrc<CR>
nnoremap <leader>hd  :setfiletype htmldjango<CR>

" make backspace work like most other apps
set backspace=2

" Set filetypes
autocmd BufNewFile,BufRead *.html set filetype=htmldjango
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead *.ino set filetype=c
au BufNewFile,BufRead *.yaml,*.yml set filetype=yaml

" set tab defaults for specific filetypes
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType sql setlocal shiftwidth=2 tabstop=2
autocmd FileType vue setlocal shiftwidth=2 tabstop=2
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType tf setlocal shiftwidth=2 tabstop=2

" Override default italic highlighting
highlight htmlItalic gui=italic guifg=#ff8700 ctermfg=214

" better python auto-indenting behavior
let g:pyindent_open_paren = 'shiftwidth()'
let g:pyindent_nested_paren = 'shiftwidth()'
let g:pyindent_continue = 'shiftwidth()'

" help vim not get confused
autocmd FileType vue syntax sync fromstart

" disable vim json quote concealing
let g:vim_json_syntax_conceal = 0

" let cursor stay where it was after yank
:vmap y ygv<Esc>
:vmap > >gv<Esc>
:vmap < <gv<Esc>

" jsx ok in javascript files
let g:jsx_ext_required = 0

" allow dashes in words when jumping by word
set iskeyword+=-

" to save a snippet for the filetype you're editing, type :UltiSnipsEdit
let g:UltiSnipsExpandTrigger = '<c-j>'  " '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetsDir = '/Users/philngo/.vim/my_ultisnips/'
let g:UltiSnipsSnippetDirectories=['/Users/philngo/.vim/my_ultisnips/']
