" Vim RSpec Settings
map <leader>t :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>a :call RunAllSpecs()<CR>


" navigating around
" shows all methods in file
nnoremap <leader>sam :silent lvim def %<cr>:lopen<cr>
nnoremap <leader>fuif :silent lvim <c-r><c-w> %<cr>:lopen<cr>

" basic templates
" easily creates a block in ruby
inoremap <leader>bl \|\|<esc>ha
iabbrev pcm private_class_method
iabbrev pr private
iabbrev befea before(:each)

" some inspection utils
nnoremap <leader>rrb :! rubocop %<cr>

nnoremap <leader>gg :topleft 100 :split Gemfile<CR>
nnoremap <leader>gr :topleft :split config/routes.rb<CR>

" ctrl p specific navigations
nnoremap <leader>gv :CtrlP app/views/<CR>
nnoremap <leader>gc :CtrlP app/controllers/<CR>
nnoremap <leader>gm :CtrlP app/models/<CR>
nnoremap <leader>gh :CtrlP app/helpers/<CR>
nnoremap <leader>gmr :CtrlPMRU<CR>
nnoremap <leader>gl :CtrlP lib/<CR>
nnoremap <leader>gs :CtrlP spec/<CR>
nnoremap <leader>gdb :CtrlP db/migrate<CR>

autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>
