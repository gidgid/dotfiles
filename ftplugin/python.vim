set omnifunc=syntaxcomplete#Complete
" Makes ctags index all 3rd party libs and our project as well
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Autopep8
"autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
"let g:autopep8_max_line_length=79
"let g:autopep8_disable_show_diff=1               " be default autopep8 opens a diff window which we dont want
"let g:autopep8_on_save = 1                       " run autopep8 on file save
"autocmd FileType python set equalprg=autopep8\ - " using = autopep8 a section

let g:ale_linters = {
            \ 'python': ['flake8', 'pylint', 'mypy'],
            \ }

let g:ale_fixers = {
            \ 'python': ['autopep8', 'yapf'],
            \ }

nmap ,p :w<CR>:!python3 %<CR>
imap ,p <ESC>:w<CR>:!python3 %<CR>
nmap ,pt :w<CR>:!pytest %<CR>

let g:black_linelength = 79
nnoremap <leader>bl :Black<CR>
