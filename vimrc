" Use Vim defaults, not vi defaults
set nocompatible

" Use Pathogen to manage plugins
execute pathogen#infect()

" Recognize file types
filetype plugin indent on

" Use UTF-8 encoding
set encoding=UTF-8

" Use comma as the leader key
let mapleader = ","

" Use UNIX line endings for new files, detect all line endings
set fileformats=unix,dos,mac

" Tab key inserts spaces, not tabs
set expandtab

" Automatically indent the next line
set autoindent

" Tab at beginning of line inserts based on indentation width, not tab size
set smarttab

" Indent by 4 spaces
set softtabstop=4
set shiftwidth=4

" Backspace works everywhere
set backspace=indent,eol,start

" Use incremental search
set incsearch

" Highlight search results
set hlsearch

" Clear search results
nnoremap <leader><space> :nohlsearch<cr>

" Smart case-sensitive search
set ignorecase
set smartcase

" See :help fo-table
set formatoptions=tcrq
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

" Format a paragraph of text (Q normally enters Ex mode)
nnoremap Q gqap

" No double spaces after punctuation when joining lines
set nojoinspaces

" Enable syntax highlighting
syntax on

" Highlight the current line
set cursorline

" Show line and column numbers
set ruler
set number

" Show the current mode and the command
set showmode
set showcmd

" Highlight matching parentheses
set showmatch

" Always show a status line
set laststatus=2

" Show menu if there are multiple completions
set wildmenu

" Show as much as possible of last line if it doesn't fit
set display+=lastline

" Scroll before hitting the edge
set scrolloff=2

" Automatically read files when changed outside of vim
set autoread

" History size
set history=200

" Assume a fast connection
set ttyfast

" Recognize .md as Markdown
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Use the vim-ansible plugin for all yaml files
autocmd BufNewFile,BufRead *.yml set filetype=ansible

" Customize the look
if has("gui")
  " No tearoff menu items (t), no toolbar (T)
  set guioptions-=tT

  if has("win32")
    " Don't use ALT keys for menus.
    set winaltkeys=no
    set guifont=Consolas:h11
  endif
endif
