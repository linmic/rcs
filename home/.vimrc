" .vimrc by Linmic <linmicya@gmail.com>

" Vundle preconfig
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
" Bundle
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Italic fonts in iTerm2, tmux, and vim
" https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/

" lang C

set nocp " no vi
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" call plug#begin('~/.vim/plugged')

Bundle 'L9'
Bundle 'mhinz/vim-startify'
" let g:startify_custom_header = ""
function! s:filter_header(lines) abort
  let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
  let centered_lines = map(copy(a:lines),
    \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction
" let g:startify_custom_header = s:filter_header(['a', 'bb', 'ccc'])
let g:startify_custom_header = s:filter_header(map(split(system('fortune | cowsay -d'), '\n'), '"   ". v:val') + ['',''])

Bundle "rking/ag.vim"
let g:ag_working_path_mode="r"

" Bundle 'https://github.com/gorodinskiy/vim-coloresque.git'
Bundle 'ap/vim-css-color'

Bundle 'easymotion/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <Plug>(easymotion-s)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)
"
"" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Snippets
Bundle "http://github.com/gmarik/snipmate.vim.git"

Bundle "digitaltoad/vim-jade"

Bundle "mattn/emmet-vim"
let g:user_emmet_leader_key=','

Bundle "nginx.vim"
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,/usr/local/etc/nginx/sites-available/* if &ft == '' | setfiletype nginx | endif

" auto-pairs
Bundle "jiangmiao/auto-pairs"

" CSS3 syntax
Bundle "hail2u/vim-css3-syntax"

" vim-react-snippets:
Bundle "linmic/vim-react-snippets"

" SnipMate and its dependencies:
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

" coding style consistency tools, it's good for open source project
" Bundle 'editorconfig/editorconfig-vim'
" Bundle 'tpope/vim-sleuth'

" Other sets of snippets (optional):
Bundle "honza/vim-snippets"

Bundle "guns/xterm-color-table.vim"

Bundle "2072/PHP-Indenting-for-VIm"

Bundle 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Bundle 'mbbill/undotree'
" nnoremap <F5> :UndotreeToggle<cr>

" javascript indenter
" Bundle 'jiangmiao/simple-javascript-indenter'

Bundle 'vim-ruby/vim-ruby.git'

Bundle 'bling/vim-airline'

" stylus
Bundle 'https://github.com/wavded/vim-stylus.git'

" go
Bundle 'fatih/vim-go'

" javascript
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
let g:jsx_ext_required = 0
" Bundle 'JSON.vim'

Bundle 'othree/csscomplete.vim'
autocmd FileType css set omnifunc=csscomplete#CompleteCSS noci

" Git integration
Bundle "git.zip"
Bundle 'tpope/vim-fugitive'

Bundle "slim-template/vim-slim"

" acp
" Bundle 'AutoComplPop'
" Bundle "othree/vim-autocomplpop"
" Bundle "ervandew/supertab"
Bundle "Valloric/YouCompleteMe"

" Command-T
" Bundle "git://git.wincent.com/command-t.git"
" Bundle "wincent/command-t"
" let g:CommandTMatchWindowAtTop=1 " show window at top

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
Bundle 'othree/yajs.vim'

Bundle 'ciaranm/detectindent'

Bundle 'tpope/vim-rails'

" coffeescript
Bundle 'othree/coffee-check.vim'
au BufRead,BufNewFile *.coffee set ft=coffee

" coffeescript
Bundle 'kchmck/vim-coffee-script.git'

" handlebars
Bundle 'nono/vim-handlebars'

Bundle "https://github.com/plasticboy/vim-markdown.git"

" Themes
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'nanotech/jellybeans.vim'

" less
Bundle 'groenewege/vim-less.git'

" CSScomb
" Bundle 'git://github.com/miripiruni/CSScomb-for-Vim.git'
Bundle 'csscomb/vim-csscomb'
" Map bc to run CSScomb. bc stands for beautify css
autocmd FileType css noremap <buffer> <leader>bc :CSScomb<CR>
" Automatically comb your CSS on save
" autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb

Bundle "nathanaelkane/vim-indent-guides"
" let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=240
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=238

Bundle 'chilicuil/vim-sml-coursera'

" JSLint {{{
" Bundle 'jslint.vim'
" let $JS_CMD='node'
" }}}
"
Bundle 'scrooloose/syntastic'
" specify javascript checker to eslint
let g:syntastic_javascript_checkers = ['eslint']
" auto open location list when errors are found
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_always_populate_loc_list = 1

Bundle 'lfilho/cosco.vim'
autocmd FileType javascript,css nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" treat es6 as javascript
au BufNewFile,BufRead *.es6 set filetype=javascript

filetype plugin indent on
syntax on

" dracula theme
Bundle 'dracula/vim'
color dracula

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

Bundle 'joshdick/onedark.vim'
set background=dark
" Note: All options should be set before the colorscheme onedark line in your ~/.vimrc.
let g:onedark_terminal_italics = 1
colorscheme onedark
" Bundle 'joshdick/airline-onedark.vim'
" let g:airline_theme='onedark'
" call plug#end()

hi Pmenu ctermfg=white ctermbg=242 guifg=#ffffff guibg=#6c6c6c
hi PmenuSel ctermfg=white ctermbg=32 guifg=#ffffff guibg=#0087d7

" indent
set ai
set si
set ci

let g:SimpleJsIndenter_BriefMode = 1

set hlsearch " search highlighting

au BufRead,BufNewFile *.mako set ft=mako syntax=html
" au BufRead,BufNewFile *.css set ft=css syntax=css3
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
" set modelines=5
set foldmethod=marker
set foldcolumn=2
set foldlevel=999 " expand all folds by default

set fo+=mB " Chinese/Japanese line wrap setting (no space joining lines/wrap fix)

set backspace=2
set expandtab " turn tab into spaces

" indent spaces
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
Bundle "ctrlpvim/ctrlp.vim"
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

hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

" function BrightHighlightOn()
  " hi CursorLine guibg=darkred
" endfunction

" function BrightHighlightOff()
  " hi CursorLine guibg=#191919
" endfunction

" }}}

" line wrapping
" highlight OverLength ctermbg=darkgray ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
" set tw=72 fo=cqt wm=0
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>
" autocmd FileType python map <F8> :w<CR>:!python %<CR>

" inoremap <leader>; <C-o>A;
set clipboard=unnamed   " yank to the system register

" Don't override register when pasting
function! RestoreRegister()
  let @" = s:restore_reg
  if &clipboard == "unnamed"
    let @* = s:restore_reg
  endif
  return ''
endfunction

function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()
