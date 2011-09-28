" -*- encoding: utf-8 -*-
" Linmic's vimrc
" Po-Huan Lin <linmicya@gmail.com>

color blugrine
lang C

set nocp " no vi
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Snippets
Bundle "http://github.com/gmarik/snipmate.vim.git"

" Git integration
Bundle "git.zip"
Bundle "fugitive.vim"

" acp
Bundle 'AutoComplPop'

" Command-T
Bundle "git://git.wincent.com/command-t.git"
let g:CommandTMatchWindowAtTop=1 " show window at top

" nerd series
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
nnoremap <silent> <F1> :NERDTree<CR>

" othree series
Bundle 'othree/html5.vim'
Bundle 'othree/xml.vim'

" JSLint
Bundle 'jslint.vim'
let $JS_CMD='node'

filetype plugin indent on
set ai " auto indent
set noci " no copyindent
set nosi " no smart indent

au BufRead,BufNewFile *.mako set ft=mako syntax=html
au BufRead,BufNewFile *.css set ft=css syntax=css3

syntax on " syntax highlight
set hlsearch " search highlighting

set guifont=Monaco:h14
set number " show line number

set ignorecase
set smartcase

set nobk " no backup
set nowb " no writebackup

set foldmethod=indent
set foldcolumn=2
set foldlevel=999 " expand all folds by default

set fo+=mB " Chinese/Japanese line wrap setting (no space joining lines/wrap fix)

set backspace=2
set expandtab " turn tab into spaces
set sw=4 sts=4 ts=4

set enc=utf-8
set fenc=utf-8
set ff=unix

set nolist
" set listchars=tab:>-,trail:- " clearly show the diff among tabs and trailing spaces
set ambw=double " only works if enc=utf-8
