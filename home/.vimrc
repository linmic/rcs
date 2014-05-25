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

" stylus
Bundle 'https://github.com/wavded/vim-stylus.git'

" go
Bundle 'git://github.com/uggedal/go-vim.git'

Bundle 'othree/vim-javascript-syntax'
" Bundle 'jiangmiao/simple-javascript-indenter'
Bundle 'JSON.vim'

" Git integration
Bundle "git.zip"
Bundle "fugitive.vim"

Bundle "slim-template/vim-slim"

" acp
Bundle 'AutoComplPop'

" Command-T
" Bundle "git://git.wincent.com/command-t.git"
Bundle "wincent/Command-T"
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
" Bundle 'mattn/hahhah-vim.git'
" set statusline=%<\ %n:%f\ %m%r%y[%{&fo}]%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)%=%{g:HahHah()}
" set laststatus=2

" Tagbar
Bundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" handlebars
Bundle 'nono/vim-handlebars'

" Bundle "tpope/vim-markdown"
Bundle "https://github.com/plasticboy/vim-markdown.git"

" less
Bundle 'groenewege/vim-less.git'

" CSScomb
" Bundle 'linmic/CSScomb-for-Vim.git'
Bundle 'git://github.com/miripiruni/CSScomb-for-Vim.git'

" JSLint {{{
Bundle 'jslint.vim'
let $JS_CMD='node'
" }}}

filetype plugin indent on
syntax on

set t_Co=256
" color leo
color Tomorrow-Night-Eighties

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

if &term=="xterm" || &term=="xterm-color"
  :imap <Esc>Oq 1
  :imap <Esc>Or 2
  :imap <Esc>Os 3
  :imap <Esc>Ot 4
  :imap <Esc>Ou 5
  :imap <Esc>Ov 6
  :imap <Esc>Ow 7
  :imap <Esc>Ox 8
  :imap <Esc>Oy 9
  :imap <Esc>Op 0
endif

""""""""""""""
" tmux fixes "
""""""""""""""
" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen-256color'
  map <Esc>OH <Home>
  map! <Esc>OH <Home>
  map <Esc>OF <End>
  map! <Esc>OF <End>
endif
if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" line wrapping
" highlight OverLength ctermbg=darkgray ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
" set tw=72 fo=cqt wm=0
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>
