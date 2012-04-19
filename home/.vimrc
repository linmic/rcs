" .vimrc by Linmic <linmicya@gmail.com>

" Vundle preconfig
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

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

Bundle "guns/xterm-color-table.vim"

" javascript indenter
Bundle 'jiangmiao/simple-javascript-indenter'

Bundle 'vim-ruby/vim-ruby.git'
Bundle 'vim-rails'

" stylus
Bundle 'https://github.com/wavded/vim-stylus.git'

Bundle 'othree/javascript-syntax.vim'
Bundle 'jiangmiao/simple-javascript-indenter'
Bundle 'JSON.vim'

" Git integration
Bundle "git.zip"
Bundle "fugitive.vim"

" acp
Bundle 'AutoComplPop'

" Command-T
Bundle "git://git.wincent.com/command-t.git"
let g:CommandTMatchWindowAtTop=1 " show window at top

" nerd series {{{
Bundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims = 1
let mapleader = ','
Bundle 'scrooloose/nerdtree'
nnoremap <silent> <F1> :NERDTree<CR>
" }}}

" othree series
Bundle 'othree/html5.vim'
Bundle 'othree/xml.vim'

" coffeescript
Bundle 'othree/coffee-check.vim'
au BufRead,BufNewFile *.coffee set ft=coffee

Bundle 'tpope/vim-rails.git'

" coffeescript
Bundle 'kchmck/vim-coffee-script.git'

" hahhah
Bundle 'mattn/hahhah-vim.git'
set statusline=%<\ %n:%f\ %m%r%y[%{&fo}]%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)%=%{g:HahHah()}
set laststatus=2

" handlebars
Bundle 'nono/vim-handlebars'

Bundle "tpope/vim-markdown"

" less
Bundle 'groenewege/vim-less.git'

" JSLint {{{
Bundle 'jslint.vim'
let $JS_CMD='node'
" }}}

filetype plugin indent on
syntax on

set t_Co=256
color leo

" indent
set ai
set si
set ci

let g:SimpleJsIndenter_BriefMode = 1

set hlsearch " search highlighting

au BufRead,BufNewFile *.mako set ft=mako syntax=html
au BufRead,BufNewFile *.css set ft=css syntax=css3
au BufRead,BufNewFile *.conf set ft=sh syntax=sh

au FileType python set omnifunc=pythoncomplete#Complete nosi
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType c set omnifunc=ccomplete#Complete

set guifont=Monaco:h14
set number

set ignorecase
set smartcase

set nobk " no backup
set nowb " no writebackup

set modeline
set modelines=5
set foldmethod=marker
set foldcolumn=2
" set foldlevel=999 " expand all folds by default

set fo+=mB " Chinese/Japanese line wrap setting (no space joining lines/wrap fix)

set backspace=2
set expandtab " turn tab into spaces
set sw=2 sts=2 ts=2

set enc=utf-8
set fenc=utf-8
set ff=unix

set list
set listchars=tab:>-,trail:- " clearly show the diff among tabs and trailing spaces
set ambw=double " only works if enc=utf-8

" tab to indent
nmap <tab> V>
vmap <tab> >gv
nmap <s-tab> V<
vmap <s-tab> <gv

" line wrapping
highlight OverLength ctermbg=darkgray ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set tw=72 fo=cqt wm=0
