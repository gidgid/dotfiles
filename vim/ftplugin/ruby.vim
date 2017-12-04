
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

" ========== Vim RSpec Settings ================
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" specific ctrl p plugin shortcuts
nnoremap <Leader>gv :CtrlP app/views/<CR>
nnoremap <Leader>gc :CtrlP app/controllers/<CR>
nnoremap <Leader>gm :CtrlP app/models/<CR>
nnoremap <Leader>gh :CtrlP app/helpers/<CR>
nnoremap <Leader>gmr :CtrlPMRU<CR>
nnoremap <Leader>gl :CtrlP lib/<CR>
nnoremap <Leader>gs :CtrlP spec/<CR>
nnoremap <Leader>gdb :CtrlP db/migrate<CR>
