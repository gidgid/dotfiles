set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call plug#begin('~/some/path/here')
Plug 'junegunn/vim-plug'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' }
Plug 'Yggdroot/indentLine', { 'for': ['python'] }
Plug 'airblade/vim-gitgutter'
Plug 'crusoexia/vim-monokai'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-slash'
Plug 'majutsushi/tagbar'
Plug 'pbogut/fzf-mru.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'sirver/ultisnips'
Plug 'tell-k/vim-autopep8', { 'for': ['python'] }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ekalinin/Dockerfile.vim', { 'for': ['dockerfile'] }

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
set complete+=kspell            " Enable autocomplete for spelling if enabled
set path+=**                    " Enables recursive dir searching inside project dir
set wildmenu                    " Displays options when using tabs
set textwidth=160               " Enables wrap line column
set shiftwidth=4
syntax on                       " Turn on syntax highlighting
set tabstop=4                   " Number of visual spaces per tab
set softtabstop=4               " Number of spaces in tab when editing
set expandtab		            " When in insert mode pressing TAB will produce the correct amount of spaces
set lazyredraw                  " redraw the screen only when its actually needed
set showmatch                   " highlight parenthesis match when cursor on parenthesis
set foldenable                  " enable folding
set foldlevelstart=10           " open most folds by default
" space open/closes folds
nnoremap <space> za

" Allow spell check toggling for the current file
nnoremap <F1> :NERDTreeToggle<CR>
nnoremap <F2> :UndotreeToggle<cr>
nnoremap <F3> :TagbarToggle<CR>
nnoremap <F7> :SyntasticToggleMode<cr>
nnoremap <F9> :setlocal spell! spelllang=en_us<CR>

" Focuses screen on the current search (slash-after plugin)
noremap <plug>(slash-after) zz
let mapleader=","

" How long it takes vim to decide if I typed a command or not
set timeout timeoutlen=500

" go to a tag if there's only one match, otherwise open a list that you can choose from
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>

" leave the previous ability possible, just a little more annoying to type
nnoremap g<c-]> <c-]>
vnoremap g<c-]> <c-]>

nnoremap <leader>] :only<bar>vsplit<CR>:execute "tag" . expand('<cword>')<CR>

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
nnoremap <leader>show :NERDTreeFind<CR>
" delete buffer when you delete the files in nerdtree
let NERDTreeAutoDeleteBuffer = 1
" open nerdtree when using vim without any arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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
"set smarttab		  " Convert all tabs into whitespaces

filetype plugin on
filetype indent on

set listchars=tab:\ \ ,trail:·
set list

set nowrap		  " Dont wrap lines
set linebreak		" Wrap lines at convient points

" Quicly remove the search highlight
nnoremap <Leader>nh :noh<CR>

set clipboard=unnamedplus

" ================ CtrlP Settings ========================
" in order to tweak these settings you can also use this link: https://github.com/kien/ctrlp.vim/issues/187 - disabled temp
" let g:ctrlp_follow_symlinks=1
" let g:ctrlp_max_files=0
" let g:ctrlp_max_depth=40
" let g:ctrlp_match_window = 'results:100,min:4,max:45'
" " use ctrl p to navigate my tags
" nnoremap <leader>. :CtrlPTag<cr>

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
" increase size vertically by 5
nmap <leader>v+ <C-w>5+
" decrease size vertically by 5
nmap <leader>v- <C-w>5-
" increase size horizontally by 5
nmap <leader>h+ :vertical resize +10<cr>
nmap <leader>hh+ :vertical resize +30<cr>
nmap <leader>hhh+ :vertical resize +50<cr>
" decrease size horizontally by 5
nmap <leader>h- :vertical resize -10<cr>
nmap <leader>hh- :vertical resize -30<cr>
nmap <leader>hhh- :vertical resize -50<cr>
" all panes are in the same size mapping
nmap <leader>= <C-w>=
" maximize current pane
nmap <leader>max <C-w>\| <C-w>_

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
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ==================== UltiSnips ==============================
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" let g:UltiSnipsSnippetDirectories=['~/.vim/plugged/ultisnips/custom-snippets']
" let g:UltiSnipsSnippetsDir=['~/.vim/plugged/ultisnips/custom-snippets']
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/ultisnips/custom_snippets']
let g:UltiSnipsSnippetsDir=$HOME.'/.vim/plugged/ultisnips/custom_snippets'

" let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" Enable youcompleteme to autocomplete from imports
let g:ycm_semantic_triggers = {'python': ['re!from\s+\S+\s+import\s']}

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


" =================== syntastic ===========================
let python_highlight_all=1
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers = ['pylint']
autocmd VimEnter * SyntasticToggleMode " disable syntastic by default
syntax on

" Allows us to easily write Git (with capital)
nnoremap <leader>g :Git<space>
" Allows us to easily write Ag (with capital)
cnoremap <leader>a Ag
" Enables us to more easily type relative commands in command mode
cnoremap <leader>p +
cnoremap <leader>m -

" FZF settings. Mainly inspired from: https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
" search for git tracked files
nnoremap <leader>f :GFiles<CR>
" search for all files
nnoremap <leader>F :Files<CR>
" search between buffers
nnoremap <leader>b :Buffers<CR>
" search through tags in the current file
nnoremap <leader>t :BTags<CR>
" search through all the tags in the project (slower)
nnoremap <leader>T :Tags<CR>
" search through lines in current buffer only
nnoremap <leader>l :BLines<CR>
" search through lines in all buffers
nnoremap <leader>L :Lines<CR>
" search through marked lines
nnoremap <leader>m :Marks<CR>
" search through vim help
nnoremap <leader>H :Helptags!<CR>
" search through all commands (user or plugins defined)
nnoremap <leader>c :Commands<CR>
" search through the : history
nnoremap <Leader>: :History:<CR>
" search through the / history
nnoremap <Leader>/ :History/<CR>
" we can define filetype syntax with fuzzy lookup
nnoremap <Leader>S :Filetypes<CR>
" Show all shortcuts defined (before creating new shortcuts)
nnoremap <Leader>M :Maps<CR>
" Allows us to use fuzzy on ultisnips snippets
nnoremap <Leader>s :Snippets<CR>
" Quickly switch windows
nnoremap <Leader>w :Windows<CR>
" Use with Ag
nnoremap <Leader>a :Ag<space>
" Navigate through all git commits
nnoremap <Leader>ca :Commits<CR>
" Navigate through git commits in buffer
nnoremap <Leader>cb :BCommits<CR>
" Search through mru files
nnoremap <Leader>r :FZFMru<CR>
" Search through sibling files
nnoremap <leader>R :Files <C-r>=expand("%:h")<CR>/<CR>
" Searches for word under cursor with FZF
nnoremap <leader>z :Ag <c-r><c-w><cr>

" the next FZF are useful to do completions with fzf
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" end of FZF stuff


nnoremap <leader>rel :set rnu!<cr>
nnoremap <leader>asjsonh 0dt{ <bar> :%s/'/"/g<cr>:%s/True/true/g<cr>:%s/False/false/g<cr>:%!python -m json.tool<cr>
nnoremap <leader>asjson :%s/'/"/g<cr>:%s/True/true/g<cr>:%s/False/false/g<cr>:%!python -m json.tool<cr>
nnoremap <leader>aspython :%s/true/True/g<cr>:%s/false/False/g<cr>:%s/null/None/g<cr>
nnoremap <leader>name :echo @%<cr>

" replaces word under cursor in visual mode
vnoremap <leader>repl :s/<c-r><c-w>//g<left><left>
" replaces word under cursor in entire file
nnoremap <leader>repl :%s/<c-r><c-w>//g<left><left>

nmap <leader>tab :tabedit %<CR>
nmap <leader>tabc :tabclose<CR>

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
   \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
