" Lets use vim instead of vi
set nocompatible

" This is the plugins pathogen file. Installations instructions at
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" ========================= global config ============================
set relativenumber
set number                 " show the absolute line number as well
set history=1000           " store lots of :cmdline history
set showcmd                " show partial command while they're being typed
set visualbell             " Please don't make sounds when trying to delete something with backspace
set autoread               " Reload files changed outside of vim
set cursorline             " Put a line showing the line you're currently at
set background=dark        " Black, obviously

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
noremap <leader><leader> <c-^>

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

" Use ack instead of grep
set grepprg=ack

" ================ Custom Settings ========================
" automatically closes html tags
inoremap ><Tab> ><Esc>?<[a-z]<CR>lyiwo</<C-r>"><Esc>O
" Enables us to replace all words under the cursor
nnoremap <Leader>rpa :%s/\<<C-r><C-w>\>//g<Left><Left>
" Allows us to create new line while still in insert mode
imap <Leader>oo <Esc>o
imap <Leader><S-O> <Esc>O
" Skips one char while in insert mode and then throws us back to insert mode
imap <Leader>sk <Esc>la

" ================ CtrlP Settings ========================
nnoremap <Leader>gv :CtrlP app/views/<CR>
nnoremap <Leader>gc :CtrlP app/controllers/<CR>
nnoremap <Leader>gm :CtrlP app/models/<CR>
nnoremap <Leader>gh :CtrlP app/helpers/<CR>
nnoremap <Leader>gmr :CtrlPMRU<CR>

" ================ General Navigation Settings ===========
nmap <Leader>gg :topleft 100 :split Gemfile<CR>
nmap <Leader>gr :topleft :split config/routes.rb<CR>

" ================ Pane Settings ===========================
" maximize pane horizontally
nmap <Leader>\| <C-w>\|
" maximize pane vertically
nmap <Leader>_ <C-w>_
" increase size by 5
nmap <Leader>+ <C-w>5+
" decrease size by 5
nmap <Leader>- <C-w>5-
" all panes are in the same size mapping
nmap <Leader>= <C-w>=
" resize current pane
nmap <Leader>M <Leader>\| <Leader>_


" ===== Seeing Is Believing =====
" " Assumes you have a Ruby with SiB available in the PATH
" " Annotate every line
nmap <leader>sb :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>;
"  " Annotate marked lines
nmap <leader>sn :%.!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>;
"  " Remove annotations
nmap <leader>sc :%.!seeing_is_believing --clean<CR>;
"  " Mark the current line for annotation
nmap <leader>sm A # => <Esc>
"  " Mark the highlighted lines for annotation
vmap <leader>m :norm A # => <Esc>

" ========== Vim RSpec Settings ================
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ========== UtilsSnips Settings ===============
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/ultisnips/vim-snippets'
let g:UltiSnipsSnippetDirectories = ['vim-snippets']
