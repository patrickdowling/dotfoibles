" Easy tab navigation
"nnoremap <C-Left> :tabprevious<CR>
"nnoremap <C-Right> :tabnext<CR>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Disable cursor keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"map <C-n> :NERDTreeToggle<CR>
"nnoremap <C-p> :Files<Cr>
"map <C-b> :Buffers<Cr>

nmap <leader>bb :Buffers<Cr>
nmap <leader>ff :Files<Cr>
nmap <leader>fg :GFiles<Cr>
nmap <leader>fb :NERDTreeToggle<Cr>

nnoremap <silent> <F8> :w <CR> :!gcc % -o %< && ./%< <CR>
