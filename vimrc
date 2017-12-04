"Lets use vim instead of vi
set nocompatible

" This is the plugins pathogen file. Installations instructions at
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
" color dracula
syntax enable
set background=dark
se t_Co=16
let g:solarized_termcolors=256
colorscheme solarized

" ========================= global config ============================
set relativenumber
set number                 " show the absolute line number as well
set history=1000           " store lots of :cmdline history
set showcmd                " show partial command while they're being typed
set visualbell             " Please don't make sounds when trying to delete something with backspace
set autoread               " Reload files changed outside of vim
set cursorline             " Put a line showing the line you're currently at
set background=dark        " Black, obviously
set backspace=indent,eol,start " Go up a line when deleting
set guifont=Menlo:h15


syntax on                  " Turn on syntax highlighting

" Set the leader to , because its much easier than \
let mapleader=","

" How long it takes vim to decide if I typed a command or not
set timeout timeoutlen=1500

" ========================= disable swap files ======================== 
set noswapfile
set nobackup
set nowb

" ========================  Scrolling =================================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Allows us to switch between the last two used files
noremap <leader><leader><leader> <c-^>

" Increase the line number by a tiny bit
set colorcolumn=160

" allow us to exit insert mode faster
inoremap jk <esc>l

" allow us to source the vimrc file in an easier fashion
nnoremap <leader>src :source $MYVIMRC<CR>

" ======================= Status Line ==================================
" always display the status line
set laststatus=2 
" organize the status line
set statusline=%.20F
set statusline+=\ -\ 
set statusline+=%y
set statusline+=\ 
set statusline+=l:%l/%L
set statusline+=\ c:\ %c
set statusline+=\ %m

" ======================= Search =======================================
set incsearch   " Highlight searches while we're still typing
set hlsearch    " Highlight search results
set ignorecase	" Ignore case when searching
set smartcase	" Unless we use a captial

" ======================= Indentation ==================================
set autoindent		
set smartindent		" Figures out when it should use indentation and when it should not 
set smarttab		" Convert all tabs into whitespaces
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab		" When in insert mode pressing TAB will produce the correct amount of spaces

filetype plugin on
filetype indent on

set list listchars=tab:\ \ ,trail:·

set nowrap		" Dont wrap lines
set linebreak		" Wrap lines at convient points

" Allows us to create new line while still in insert mode
inoremap <leader>o <Esc>o
inoremap <leader><S-O> <Esc>O
" Skips one char while in insert mode and then throws us back to insert mode
inoremap <Leader>j <Esc>la
inoremap <Leader>a <Esc>A
nnoremap <Leader>nh :noh<CR>

" =============== Wrapping Settings =======================
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>f" viW<esc>a"<esc>hBi"<esc>lEl

nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>f' viW<esc>a'<esc>hBi'<esc>lEl

nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>f( viW<esc>a)<esc>hBi(<esc>lEl
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
nnoremap <leader>f[ viW<esc>a]<esc>hBi[<esc>lEl
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
nnoremap <leader>f{ viW<esc>a}<esc>hBi{<esc>lEl

" surrounds text with single quotes instead of double quotes
nnoremap <leader>ct' F"r'lf"r'
" surrounds text with double quotes instead of single quotes
nnoremap <leader>ct" F'r"lf'r"


" ================ CtrlP Settings ========================
" in order to tweak these settings you can also use this link: https://github.com/kien/ctrlp.vim/issues/187
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_match_window = 'results:100,min:4,max:45'

" ================ General Navigation Settings ===========
nnoremap <leader>erc :vsplit $MYVIMRC<CR>
nnoremap <leader>exp :Sexplore<CR>

" ================ Pane Settings ===========================
" maximize pane horizontally
nmap <leader>\| <C-w>\|
" maximize pane vertically
nmap <leader>_ <C-w>_
" increase size by 5
nmap <leader>+ <C-w>5+
" decrease size by 5
nmap <leader>- <C-w>5-
" all panes are in the same size mapping
nmap <leader>= <C-w>=
" resize current pane
nmap <leader>M <leader>\| <leader>_
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k



" ========== UtilsSnips Settings ===============
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/ultisnips/vim-snippets'
let g:UltiSnipsSnippetDirectories = ['vim-snippets']

" allow basic mouse scroll
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

nnoremap <leader>d "_d

" make vimdiff display diffs vertically
set diffopt+=vertical

nmap <F8> :TagbarToggle<CR>

nnoremap <leader>v /\u<cr>:noh<cr>
