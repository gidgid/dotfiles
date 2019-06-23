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
Plug 'iamcco/mathjax-support-for-mkdp', { 'for': ['markdown'] }
Plug 'tell-k/vim-autopep8', { 'for': ['python'] }
Plug 'iamcco/markdown-preview.vim', { 'for': ['markdown'] }
Plug 'Yggdroot/indentLine', { 'for': ['python'] }
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'

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

" Allow spell check toggling for the current file
map <F6> :setlocal spell! spelllang=en_us<CR>

let mapleader=","

" How long it takes vim to decide if I typed a command or not
set timeout timeoutlen=500

" CTags configurations
" ======================================================================
" Vim will search the tags file in parent directories as well
set tags+=./tags;,./TAGS;,tags,TAGS,./.git/tags
" Check .git/tags for ctags file.
fun! FindTagsFileInGitDir(file)
  let path = fnamemodify(a:file, ':p:h')
  while path != '/'
    let fname = path . '/.git/tags'
    if filereadable(fname)
      silent! exec 'set tags+=' . fname
    endif
    let path = fnamemodify(path, ':h')
  endwhile
endfun

augroup CtagsGroup
  autocmd!
  autocmd BufRead * call FindTagsFileInGitDir(expand("<afile>"))
augroup END


nnoremap <F5>  :sp tags<CR>:%s/^\([^	:]*:\)\=\([^	]*\).*/syntax keyword Tag \2/<CR>:wq! tags.vim<CR>/^<CR><F12>

" go to a tag if there's only one match, otherwise open a list that you can choose from
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>

" leave the previous ability possible, just a little more annoying to type
nnoremap g<c-]> <c-]>
vnoremap g<c-]> <c-]>

" See all tags in the current file
nmap <F8> :TagbarToggle<CR>

map <F4> :NERDTreeToggle<CR>

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
set expandtab		  " When in insert mode pressing TAB will produce the correct amount of spaces

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
" in order to tweak these settings you can also use this link: https://github.com/kien/ctrlp.vim/issues/187
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_match_window = 'results:100,min:4,max:45'
" use ctrl p to navigate my tags
nnoremap <leader>. :CtrlPTag<cr>

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
" decrease size horizontally by 5
nmap <leader>h- :vertical resize -10<cr>
" all panes are in the same size mapping
nmap <leader>= <C-w>=
" maximize current pane
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
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

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
cnoremap <leader>g Git
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
nnoremap <leader>C :Commands<CR>
" search through the : history
nmap <Leader>: :History:<CR>
" search through the / history
nmap <Leader>/ :History/<CR>
" we can define filetype syntax with fuzzy lookup
nmap <Leader>s :Filetypes<CR>
" Show all shortcuts defined (before creating new shortcuts)
nmap <Leader>M :Maps<CR>
" Allows us to use fuzzy on ultisnips snippets
nmap <Leader>s :Snippets<CR>
" Quickly switch windows
nmap <Leader>w :Windows<CR>

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
nnoremap <F3> :%s/\s\+$//e<cr>
