""""""""""""""""""""""""

"                      "
"    Phil's .vimrc     "
"                      "
""""""""""""""""""""""""
" general
set encoding=utf-8
set nocompatible

let g:pymode_python = 'python3'
" Disable virtualenv in Pymode
let g:pymode_virtualenv = 0
" Disable pymode init and lint because of #897
let g:pymode_init = 0
let g:pymode_lint = 0

" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" commands
Plugin 'gmarik/Vundle.vim'                  " plugin manager                  :PluginInstall or $ vim +PluginInstall +qall
Plugin 'kien/ctrlp.vim'                     " searching files in directory    <C-p> (F5 to reload)
Plugin 'scrooloose/nerdtree'                " directory tree                  :e .

" commenting
Plugin 'tomtom/tcomment_vim'                " comment/uncomment line          gcc

" Plugin 'sirver/ultisnips'                   " snippets                        :UltiSnipsEdit  " TODO disabled because slow
Plugin 'triglav/vim-visual-increment'       " incrementing nums in vis select <C-A>
Plugin 'tpope/vim-unimpaired'               " quick bracket commands          :cnext :cprev -> ]q [q
Plugin 'tpope/vim-abolish'                  " substitution with capitals      :%S/facilit{y,ies}/building{,s}/g
Plugin 'tpope/vim-eunuch'                   " :Move, :Rename
Plugin 'Valloric/YouCompleteMe'             " text completion                 <tab>
Plugin 'psf/black'                          " python black formatter          :Black
Plugin 'junegunn/vim-easy-align'            " align markdown tables           :EasyAlign*<Bar><Enter> (mapped to <leader><Bslash>)

" look and feel plugins
Plugin 'airblade/vim-gitgutter'             " show git diff status by numbers
Plugin 'bling/vim-airline'                  " nice looking bottom status line and tabs
Plugin 'altercation/vim-colors-solarized'

" syntax highlighting
Plugin 'burnettk/vim-angular'
Plugin 'cespare/vim-toml'
Plugin 'dense-analysis/ale'
Plugin 'elzr/vim-json'
Plugin 'godlygeek/tabular'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'hashivim/vim-terraform'
Plugin 'ingydotnet/yaml-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'mechatroner/rainbow_csv'
Plugin 'pangloss/vim-javascript'
Plugin 'posva/vim-vue'
Plugin 'preservim/vim-markdown'
"  Plugin 'prettier/vim-prettier'       " restore when compatible with prettier 3.X
Plugin 'adnan007d/vim-prettier'
Plugin 'rust-lang/rust.vim'
Plugin 'sukima/xmledit'
Plugin 'vim-scripts/django.vim'
Plugin 'vim-scripts/trailing-whitespace'    " show trailing whitespace as red ->  
Plugin 'delphinus/vim-firestore'
Plugin 'jparise/vim-graphql'
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
silent! colorscheme solarized

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
let g:ctrlp_root_markers = ['docker-compose.yml']  " for etls directory so it doesn't use .git/

" */staticfiles/*,
let g:ctrlp_show_hidden = 1

" respect .gitignore
let g:ctrlp_user_command = [
    \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
    \ 'find %s -type f'
    \ ]

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
let g:ycm_autoclose_preview_window_after_completion = 1
" Use homebrew's clangd
let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'

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
nnoremap <leader><Bslash> :EasyAlign*<Bar><CR>
vnoremap <leader><Bslash> :EasyAlign*<Bar><CR>

" make backspace work like most other apps
set backspace=2

" set text width to 88 instead of 80
" great for breaking one really long line into multiple lines with gq
set textwidth=88
" but don't auto-enter newlines
set wrapmargin=0

" Set filetypes
autocmd BufNewFile,BufRead *.html set filetype=htmldjango
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead *.ino set filetype=c
autocmd BufNewFile,BufRead *.yaml,*.yml set filetype=yaml
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead .prettierrc set filetype=json

" set tab defaults for specific filetypes
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
autocmd FileType python set shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType sql setlocal shiftwidth=2 tabstop=2
autocmd FileType tf setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType vue setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" Override default italic highlighting
highlight htmlItalic gui=italic guifg=#b58900 ctermfg=136

" better python auto-indenting behavior
let g:pyindent_open_paren = 'shiftwidth()'
let g:pyindent_nested_paren = 'shiftwidth()'
let g:pyindent_continue = 'shiftwidth()'

" help vim not get confused
autocmd FileType vue syntax sync fromstart

" disable vim json quote concealing
let g:vim_json_syntax_conceal = 0

" let cursor stay where it was after yank
vmap y ygv<Esc>
vmap > >gv<Esc>
vmap < <gv<Esc>

" jsx ok in javascript files
let g:jsx_ext_required = 0

" allow dashes in words when jumping by word
set iskeyword+=-

" ultsnips settings
" to save a snippet for the filetype you're editing, type :UltiSnipsEdit
" TODO: restore! Disabled because slow
" let g:UltiSnipsExpandTrigger       = "<c-j>"
" let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
" let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
" let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file
" let g:UltiSnipsSnippetsDir = '/Users/philngo/.vim/my_ultisnips/'
" let g:UltiSnipsSnippetDirectories=['/Users/philngo/.vim/my_ultisnips/']

" let g:black_virtualenv = '/Users/philngo/.pyenv/versions/3.10.1/'

" automatic rust formatting
let g:rustfmt_autosave = 1

" automatic js, json, ts and vue formatting
let g:prettier#autoformat = 0
" let g:prettier#config#single_quote = 'true'
" let g:prettier#config#trailing_comma = 'all'
autocmd BufWritePre *.js,*.json,*.vue,*.ts Prettier

" automatic SQL formatting
" autocmd BufWritePre *.sql Prettier

" automatic blackening
autocmd BufWritePre *.py Black
"
" " automatic import sorting
" autocmd BufWritePre *.py :!isort %

" Spellchedk for markdown files.
"  Use `zg` to add a word to the spellfile dictionary
"  Use `]s` to go to the next misspelled word
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.rst setlocal spell

" no folding markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_new_list_item_indent = 0

" tcomment
let g:tcomment#filetype#guess_vue = 1

" ALE
" let g:ale_fixers = {
" \   'javascript': ['prettier', 'eslint'],
" \   'vue': ['prettier', 'eslint'],
" \   'typescript': ['prettier', 'eslint'],
" \   'json': ['prettier'],
" \}
"
" let g:ale_linters_explicit = 1
" let g:ale_fix_on_save = 1
