set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call plug#begin('~/some/path/here')
Plug 'junegunn/vim-plug'

Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nvie/vim-flake8', { 'for': ['python'] }
Plug 'rking/ag.vim'
Plug 'tpope/vim-surround'
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

set nocompatible              " be iMproved, required

colorscheme monokai

" ========================= global config ============================
set relativenumber
set number                      " show the absolute line number as well
set history=1000                " store lots of :cmdline history
set showcmd                     " show partial command while they're being typed
set visualbell                  " Please don't make sounds when trying to delete something with backspace
set autoread                    " Reload files changed outside of vim
set cursorline                  " Put a line showing the line you're currently at
set background=dark             " Black, obviously
set backspace=indent,eol,start  " Go up a line when deleting
set guifont=Roboto_Mono:h22
set complete+=kspell            "enable autocomplete for spelling if enabled
set path+=**                    " Enables recursive dir searching inside project dir
set wildmenu                    " Displays options when using tabs
syntax on                       " Turn on syntax highlighting

" Allow spell check toggling for the current file
map <F6> :setlocal spell! spelllang=en_us<CR>

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

" use magenta to indicate a limit violation
highlight ColorColumn ctermbg=magenta 
" only display the violation line if there was an actual violation
call matchadd('ColorColumn', '\%81v.', 100)

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
set smartcase	  " Unless we use a captial

" ======================= Indentation ==================================
set autoindent		
set smartindent		" Figures out when it should use indentation and when it should not 
set smarttab		  " Convert all tabs into whitespaces
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab		  " When in insert mode pressing TAB will produce the correct amount of spaces

filetype plugin on
filetype indent on

set listchars=tab:\ \ ,trail:·
set list

set nowrap		  " Dont wrap lines
set linebreak		" Wrap lines at convient points

" Skips one char while in insert mode and then throws us back to insert mode
inoremap <Leader>a <Esc>A
" Quicly remove the search highlight
nnoremap <Leader>nh :noh<CR>

" ================ CtrlP Settings ========================
" in order to tweak these settings you can also use this link: https://github.com/kien/ctrlp.vim/issues/187
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_match_window = 'results:100,min:4,max:45'

" ================ General Navigation Settings ===========
nnoremap <leader>erc :vsplit $MYVIMRC<CR>
" Quickly open an horizontal pane with the current dir
nnoremap <leader>hexp :Sexplore<CR>
" Quickly open a vertical pane with the current dir
nnoremap <leader>vexp :Vexplore<CR>

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

" ===============  Moving between splits ==================
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" allow basic mouse scroll
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" ==================== YouCompleteMe Plugin ===============
" auto complete window goes away when you're done with it
let g:ycm_autoclose_preview_window_after_completion=1
" shortcut for go to definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ==================== UltiSnips ==============================
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Allows us to see the possible snippets
" let g:UltiSnipsListSnippets="<c-o>"

" make vimdiff display diffs vertically
set diffopt+=vertical

" =================== ctags ===============================
nmap <leader>tag :!ctags -R .<cr>

" =================== syntastic ===========================
let python_highlight_all=1
syntax on

" Allows us to easily write Git (with capital)
cnoremap <leader>g Git
" Allows us to easily write Ag (with capital)
cnoremap <leader>a Ag

" opens fzf with lines search accross all open buffers
nnoremap <leader>bufl :Lines<CR>
" opens fzf with lines search accross current buffer
nnoremap <leader>lines :BLines<CR>
" opens fzf with buffers search
nnoremap <leader>buffers :Buffers<CR>
" opens fzf with commits search for all buffers
nnoremap <leader>commitsa :Commits<CR>
" opens fzf with commits search for just this buffer
nnoremap <leader>commits :BCommits<CR>
" opens fzf with all the mappings
nnoremap <leader>maps :Maps<CR>

