" packages

if has ('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle     'scrooloose/nerdcommenter'
NeoBundle     'scrooloose/syntastic'
NeoBundle     'bling/vim-airline'
"NeoBundle     'altercation/vim-colors-solarized'
NeoBundle     'Lokaltog/vim-easymotion'
NeoBundle     'tpope/vim-fugitive'
NeoBundle     'tpope/vim-git'
NeoBundle     'tpope/vim-surround'
NeoBundle     'tpope/vim-sensible'
NeoBundle     'airblade/vim-gitgutter'
NeoBundle     'clones/vim-l9'
NeoBundle     'tpope/vim-vividchalk'
NeoBundle     'kien/ctrlp.vim'
NeoBundle     'scrooloose/nerdtree'
NeoBundle     'moll/vim-bbye'

NeoBundleLazy 'vim-ruby/vim-ruby',            { 'autoload':{'filetypes':['ruby']}}
NeoBundleLazy 'tpope/vim-bundler',            { 'autoload':{'filetypes':['ruby']}}
NeoBundleLazy 'tpope/vim-classpath',          { 'autoload':{'filetypes':['clojure']}}
NeoBundleLazy 'guns/vim-clojure-static',      { 'autoload':{'filetypes':['clojure']}}
NeoBundleLazy 'kien/rainbow_parentheses.vim', { 'autoload':{'filetypes':['clojure']}}
NeoBundleLazy 'tpope/vim-endwise',            { 'autoload':{'filetypes':['lua','ruby','sh','zsh','vb','vbnet','aspvbs','vim','c','cpp','xdefaults']}}
NeoBundleLazy 'tpope/vim-fireplace',          { 'autoload':{'filetypes':['clojure']}}
NeoBundleLazy 'tpope/vim-haml',               { 'autoload':{'filetypes':['haml']}}
NeoBundleLazy 'stephpy/vim-yaml',             { 'autoload':{'filetypes':['yaml']}}
NeoBundleLazy 'pangloss/vim-javascript',      { 'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'tpope/vim-markdown',           { 'autoload':{'filetypes':['markdown']}}
NeoBundleLazy 'tpope/vim-rails',              { 'autoload':{'filetypes':['ruby']}}
NeoBundleLazy 'klen/python-mode',             { 'autoload':{'filetypes':['python']}}

call neobundle#end()

" CTRLP
"
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_open_multiple_files='1vir'
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_max_height=40
let g:ctrlp_show_hidden=0
let g:ctrlp_follow_symlinks=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_files=20000
let g:ctrlp_cache_dir='~/.vim/.cache/ctrlp'
let g:ctrlp_extensions=['funky']
let g:ctrlp_map='<nop>'
let g:ctrlp_abbrev = {
    \ 'gmode': 't',
    \ 'abbrevs': [
        \ {
        \ 'pattern': '-',
        \ 'expanded': '_',
        \ 'mode': 'pfrz',
        \ },
        \ {
        \ 'pattern': '\(^@.\+\|\\\@<!:.\+\)\@<! ',
        \ 'expanded': '_',
        \ 'mode': 'pfrz',
        \ },
        \ ]
    \ }

let mapleader=","

nnoremap <Leader>n :CtrlP<CR>
nnoremap <Leader>ff :CtrlP<CR>
nnoremap <Leader>fb :CtrlPBuffer<CR>
nnoremap <leader>ft :CtrlPTag<cr>
nnoremap <Leader>fm :CtrlPMixed<CR>
" nnoremap [ctrlp]t :CtrlPBufTag<cr>
" nnoremap [ctrlp]l :CtrlPLine<cr>
" nnoremap [ctrlp]o :CtrlPFunky<cr>

" NERDTREE
"
let NERDChristmasTree=1
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=50
let NERDTreeQuitOnOpen=0
let NERDTreeShowLineNumbers=1
let NERDTreeChDirMode=0
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.git','\.hg', '\.$', '\~$']
let NERDTreeBookmarksFile='~/.vim/.cache/NERDTreeBookmarks'

map <silent> <leader>l :NERDTreeFind<CR> " Jump to current file
nmap <F2> :NERDTreeToggle<CR> " Make F2 open NERDTree
nnoremap <C-e> :NERDTreeToggle<CR>

" VIM-AIRLINE
"let g:airline_theme="solarized"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" SYNTASTIC

" syntastic sucks at haml and sass
let g:syntastic_mode_map={ 'mode': 'active',
                          \ 'active_filetypes': ['ruby'],
                          \ 'passive_filetypes': ['haml', 'sass'] }

" Helptags

set title " sets shell title to correct thing
set hidden " does good stuff with buffers

set backupdir=/tmp
set directory=/tmp

set term=xterm-256color " force 256 color for colorschemes

if has('gui_running')
  set background=light
  set fuoptions=maxvert,maxhorz " default screen size
  set guioptions-=rL " turn off scrollbar

  " Unmap Apple+Shift+T and map to goto method
  "macmenu &File.Open\ Tab\.\.\. key=<nop>
  "nnoremap <D-T> :FufTag!<CR>
else
  set go-=T " hide the toolbar by default
  set background=dark
endif

"colorscheme solarized

" keep a bit of context around current cursor position
set scrolloff=5
set scrolljump=3

set nu " show line numbers

" invisible characters
set listchars=trail:.,tab:>-,eol:$
set nolist
nmap ,i :set list!<CR> " Toggle invisible chars

" set default font
set gfn=Inconsolata\ 14

" ignore case in searches, except if you type a capital letter
set ignorecase
set smartcase
set nohlsearch
set incsearch

" remove tabs for 2 spaces
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set cindent
set wildmode=list:longest " make completion better
set shortmess=atI " turn off annoying messages

map <F7> mzgg=G`z<CR>

" map comments to apple/
nmap <D-/> ,c<Space>
vmap <D-/> ,c<Space>
imap <D-/> <C-O>,c<Space>

" bind command-] to shift right
nmap <D-]> >>
vmap <D-]> >>
imap <D-]> <C-O>>>

" bind command-[ to shift left
nmap <D-[> <<
vmap <D-[> <<
imap <D-[> <C-O><<

" split editing settings
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
set wmh=0

" ack integration
set grepprg=ack\ -a
set swb=newtab " switch buffer mode opens a new tab

nnoremap <silent> <leader>T :TlistToggle<CR> " taglist shortcuts
inoremap <C-space> <C-n>                     " Remap autocomplete to CTRL+SPACE

" escape in insert mode
inoremap jk <esc>

" Remap alt-j alt-k to insert blank lines without going to insert mode
nnoremap <silent><D-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><D-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" paste toggle
set pastetoggle=<F5>
set matchtime=1

" ruby tests from drew pope
map <silent> <LocalLeader>rb :RunAllRubyTests<CR>
map <silent> <LocalLeader>rc :RunRubyFocusedContext<CR>
map <silent> <LocalLeader>rf :RunRubyFocusedUnitTest<CR>

" rebuild ctags
map <silent> <LocalLeader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f<CR>

vnoremap . :norm.<cr>

" remap semicolon to colon
nnoremap ; :
vnoremap ; :

"" Keep search matches in the middle of the window.
nnoremap * *zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

"" Also center the screen when jumping through the changelist
nnoremap g; g;zz
nnoremap g, g,zz

"" Map the arrow keys to be based on display lines, not physical lines
nnoremap <Down> gj
nnoremap <Up> gk

"" edit/reload vimrc
nnoremap <leader>v :e ~/.vimrc<CR>
nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <leader>V :source ~/.vimrc<CR>

"" fast saving
nnoremap <leader>ww :w !sudo tee %<CR>
nnoremap <leader>w :w!<cr>

"" for faster scrolling
nnoremap <C-f> 15gj
nnoremap <C-b> 15gk

" Ctrl-HJKL keys move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>wq <C-w>q

" reflow paragraph with Q in normal and visual mode
nnoremap Q gqap
vnoremap Q gq

" Dont exit visual mode when shifting code
vnoremap < <gv
vnoremap > >gv

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

"" splits and buffers
nnoremap <leader>sh :split<CR>
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>shb :split<CR>:b <C-Z><C-Z>
nnoremap <leader>svb :vsplit<CR>:b <C-Z><C-Z>
nnoremap <C-p> :bprev<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-x> :Bdelete<CR>
nnoremap <leader>q :Bdelete<CR>

"" Toggle hlsearch with <leader>hs
nnoremap <leader>hs :set hlsearch! hlsearch?<CR>

"" find merge conflict markers
nnoremap <silent> <leader>hm <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" GIT
"   grep
command! -nargs=1 Gg !git grep <args>

" clear trailing whitespaces
command! Gctw :%s/\s\+$//e

" paredit
let g:paredit_mode=0

" finish startup
filetype plugin indent on  " don't move/change this line
syntax enable
NeoBundleCheck

" python-mode
let g:pymode_folding=0
let g:pymode_options_max_line_length=120
autocmd FileType python set completeopt=longest,menuone " fixes autocomplete
