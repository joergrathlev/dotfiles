" Use Vim defaults, not vi defaults
set nocompatible

" Use Pathogen to manage plugins
execute pathogen#infect()

" Recognize file types
filetype plugin indent on

" Use UTF-8 encoding
set encoding=UTF-8

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

" See :help fo-table
set formatoptions=tcrq
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

" Format a paragraph of text
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

" Always show a status line
set laststatus=2

" Show menu if there are multiple completions
set wildmenu

" Show as much as possible of last line if it doesn't fit
set display+=lastline

" Automatically read files when changed outside of vim
set autoread

" History size
set history=200

" Recognize .md as Markdown
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

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
