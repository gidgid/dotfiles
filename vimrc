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

" ================ Custom Settings ========================
" automatically closes html tags
inoremap ><Tab> ><Esc>?<[a-z]<CR>lyiwo</<C-r>"><Esc>O
" Enables us to replace all words under the cursor in the current file
nnoremap <Leader>rpf :%s/\<<C-r><C-w>\>//g<Left><Left>
" Enables us to replace all words under the cursor in all visible windows
nnoremap <Leader>rpa :windo %s/\<<C-r><C-w>\>//ge<Left><Left>
nnoremap <Leader>fix :<Up>
nnoremap <Leader>sch :vsp db/schema.rb<CR>
nnoremap <Leader>deb $x
nnoremap <Leader>ref :edit!<cr>


" Allows us to create new line while still in insert mode
inoremap <Leader>o <Esc>o
inoremap <Leader><S-O> <Esc>O
" Skips one char while in insert mode and then throws us back to insert mode
inoremap <Leader>j <Esc>la
inoremap <Leader>a <Esc>A
nnoremap <Leader>nh :noh<CR>
nnoremap <Leader>finde /\<<C-r><C-w>\><cr>
inoremap <Leader>end <esc>:w<cr>

" =============== Wrapping Settings =======================
nnoremap <Leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <Leader>f" viW<esc>a"<esc>hBi"<esc>lEl

nnoremap <Leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <Leader>f' viW<esc>a'<esc>hBi'<esc>lEl

nnoremap <Leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <Leader>f( viW<esc>a)<esc>hBi(<esc>lEl
nnoremap <Leader>[ viw<esc>a]<esc>hbi[<esc>lel
nnoremap <Leader>f[ viW<esc>a]<esc>hBi[<esc>lEl
nnoremap <Leader>{ viw<esc>a}<esc>hbi{<esc>lel
nnoremap <Leader>f{ viW<esc>a}<esc>hBi{<esc>lEl

" surrounds text with single quotes instead of double quotes
nnoremap <Leader>ct' F"r'lf"r'
" surrounds text with double quotes instead of single quotes
nnoremap <Leader>ct" F'r"lf'r"


" ================ CtrlP Settings ========================
" in order to tweak these settings you can also use this link: https://github.com/kien/ctrlp.vim/issues/187
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_match_window = 'results:100,min:4,max:45'
nnoremap <Leader>gv :CtrlP app/views/<CR>
nnoremap <Leader>gc :CtrlP app/controllers/<CR>
nnoremap <Leader>gm :CtrlP app/models/<CR>
nnoremap <Leader>gh :CtrlP app/helpers/<CR>
nnoremap <Leader>gmr :CtrlPMRU<CR>
nnoremap <Leader>gl :CtrlP lib/<CR>
nnoremap <Leader>gs :CtrlP spec/<CR>
nnoremap <Leader>gdb :CtrlP db/migrate<CR>

" ================ General Navigation Settings ===========
nnoremap <Leader>gg :topleft 100 :split Gemfile<CR>
nnoremap <Leader>gr :topleft :split config/routes.rb<CR>
nnoremap <Leader>erc :vsplit $MYVIMRC<CR>
nnoremap <Leader>exp :Sexplore<CR>

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
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k


" ========== Vim RSpec Settings ================
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ========== UtilsSnips Settings ===============
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/ultisnips/vim-snippets'
let g:UltiSnipsSnippetDirectories = ['vim-snippets']

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" searches for the word under the cursor
nnoremap <Leader>fu :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" this mapping invokes Ag to allow us to actually search
nnoremap <Leader>fag :Ag<SPACE>

" allow basic mouse scroll
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

nnoremap <leader>d "_d

" make vimdiff display diffs vertically
set diffopt+=vertical

" ========= Ruby specific settings ================
" shows all methods in file
nnoremap <Leader>sam :silent lvim def %<cr>:lopen<cr>
nnoremap <Leader>fuif :silent lvim <c-r><c-w> %<cr>:lopen<cr>
" easily creates a block in ruby
inoremap <Leader>bl \|\|<esc>ha

" wraps an argument with a let
nnoremap <Leader>let A }<esc>Ilet(:<esc>Ea) {<esc>lx
" extracts a variable at the beginning of the line at the first non blank char
nnoremap <Leader># _i#<space><esc>j

iabbrev pcm private_class_method
iabbrev pr private
iabbrev befea before(:each)

nnoremap <Leader>rrb :! rubocop %<cr>
nnoremap <Leader>self biself.<esc>

nmap <F8> :TagbarToggle<CR>

nnoremap <leader>v /\u<cr>:noh<cr>
