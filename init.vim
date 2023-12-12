colorscheme nordic

" General
set cursorline
set expandtab
set tabstop=4
set shiftwidth=4
set expandtab

" HTML
autocmd FileType html set tabstop=2
autocmd FileType html set shiftwidth=2

" Telescope
nmap <C-t> :Telescope find_files<cr>

" NvimTree
nmap <c-n> :NvimTreeOpen<cr>

" AnyJump
nmap <c-j> :AnyJump<cr>

" Java settings
autocmd FileType java set cc=120

" CoC complete
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<tab>"

" Load nvim-tree
lua require('nvim-tree').setup()
