" ========== Vim RSpec Settings ================
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


" ========= navigating around ================
" shows all methods in file
nnoremap <Leader>sam :silent lvim def %<cr>:lopen<cr>
nnoremap <Leader>fuif :silent lvim <c-r><c-w> %<cr>:lopen<cr>

" ========= basic templates ===================
" easily creates a block in ruby
inoremap <Leader>bl \|\|<esc>ha
iabbrev pcm private_class_method
iabbrev pr private
iabbrev befea before(:each)

" ========= some inspection utils
nnoremap <Leader>rrb :! rubocop %<cr>


autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>
