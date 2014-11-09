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

Bundle 'bling/vim-airline'

" stylus
Bundle 'https://github.com/wavded/vim-stylus.git'

" go
Bundle 'fatih/vim-go'

" Bundle 'othree/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'JSON.vim'

" Git integration
Bundle "git.zip"
Bundle 'tpope/vim-fugitive'

Bundle "slim-template/vim-slim"

Bundle 'mtscout6/vim-cjsx'

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

Bundle 'tpope/vim-rails'

" coffeescript
Bundle 'othree/coffee-check.vim'
au BufRead,BufNewFile *.coffee set ft=coffee

" coffeescript
Bundle 'kchmck/vim-coffee-script.git'

" hahhah
" Bundle 'mattn/hahhah-vim.git'
" set statusline=%<\ %n:%f\ %m%r%y[%{&fo}]%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)%=%{g:HahHah()}
" set laststatus=2

" Tagbar
" gem install CoffeeTags
Bundle 'majutsushi/tagbar'
" nmap <F8> :TagbarToggle<CR>
" inoremap <c-t> <Esc>:TagbarToggle<CR>
nmap <c-t> :TagbarToggle<CR>
" coffeetags --vim-conf >> ~/.vimrc
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

" handlebars
Bundle 'nono/vim-handlebars'

Bundle "https://github.com/plasticboy/vim-markdown.git"
" Bundle "tpope/vim-markdown"
Bundle 'altercation/vim-colors-solarized.git'

" less
Bundle 'groenewege/vim-less.git'

" CSScomb
" Bundle 'linmic/CSScomb-for-Vim.git'
Bundle 'git://github.com/miripiruni/CSScomb-for-Vim.git'

Bundle "nathanaelkane/vim-indent-guides"

" JSLint {{{
Bundle 'jslint.vim'
let $JS_CMD='node'
" }}}

filetype plugin indent on
syntax on

set t_Co=256

if has('gui_running')
  set guicolors
endif

" 24 bit
if !exists('$TMUX')
  set background=dark
  let g:solarized_visibility="high"
  let g:solarized_contrast="high"
  let g:solarized_termcolors=256
  colorscheme solarized
else
  set background=dark
  let g:solarized_visibility="high"
  let g:solarized_contrast="high"
  let g:solarized_termcolors=256
  colorscheme solarized
endif

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

au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.jade set filetype=html

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

set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
" set list
" set listchars=tab:>-,trail:- " clearly show the diff among tabs and trailing spaces
set ambw=double " only works if enc=utf-8

" tab to indent
nmap <tab> V>
vmap <tab> >gv
nmap <s-tab> V<
vmap <s-tab> <gv

map <Esc>[B <Down>

" if &term=="xterm" || &term=="xterm-color"
  " :imap <Esc>Oq 1
  " :imap <Esc>Or 2
  " :imap <Esc>Os 3
  " :imap <Esc>Ot 4
  " :imap <Esc>Ou 5
  " :imap <Esc>Ov 6
  " :imap <Esc>Ow 7
  " :imap <Esc>Ox 8
  " :imap <Esc>Oy 9
  " :imap <Esc>Op 0
" endif
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

" git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
" ctrlp: {{{
"
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_show_hidden = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 0

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules$\|\.git$\|\.meteor$\|\.svn$\|dist$\|\.hg$',
  \ 'file': '\.DS_Store$\|\.jpg$\|\.png$\|\.jpeg$\|\.gif$\|\.svg$'
  \ }

" let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" }}}

" line wrapping
" highlight OverLength ctermbg=darkgray ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
" set tw=72 fo=cqt wm=0
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>

set background=dark
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
