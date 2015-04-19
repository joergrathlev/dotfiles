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

" Indent by 4 spaces
set softtabstop=4
set shiftwidth=4

" See http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set formatoptions=tcroq

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
