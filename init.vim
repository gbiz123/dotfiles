colorscheme nordic

" General
set cursorline
set expandtab
set tabstop=4
set shiftwidth=4
set expandtab

# Highlightedyank
git clone https://github.com/machakann/vim-highlightedyank $HOME/.local/share/nvim/site/pack/plugin/start/vim-highlightedyank

# autoclose
git clone https://github.com/m4xshen/autoclose.nvim $HOME/.local/share/nvim/site/pack/plugin/start/autoclose.nvim

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

" Load auto-close
lua require("autoclose").setup()
