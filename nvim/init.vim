set nocompatible
set number
let g:python_highlight_all = 1
let g:colorizer_auto_color = 1
set cursorline
set clipboard+=unnamedplus

" ALE disable LSP
let g:ale_disable_lsp = 1

" Telescope
nmap <C-t> :Telescope find_files<cr>

" NerdTREE
nmap <c-n> :NERDTree<cr>

" AnyJump
nmap <c-j> :AnyJump<cr>


" Vim slime default to 0.1
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}

filetype plugin indent on

" Tab is 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab	

"colorscheme onedark
colorscheme nordic


" Python settings
autocmd FileType python nmap <c-p><c-p> :!python % <cr>
autocmd FileType python nmap <C-p><c-i> :!pip install -e . <cr>

" Java settings
autocmd FileType java set cc=120


let g:python3_host_prog = "/usr/bin/python"

" HTML Settings
autocmd FileType html packadd emmet-vim

" jinja2 snippets
autocmd FileType html let g:user_emmet_settings = {
\    "html" : {
\        "snippets" : {
\                "block" : "{% block ${1} %}\n\t\n{% endblock %}",
\                "{%" : "{% $0 %}",
\                "{{" : "{{ $0 }}",
\                "extends" : "{% extends ${1} %}",
\                "filter" : "{% filter ${1} %}\n\t\n{% endfilter}",
\                "for" : "{% for ${1} in %}\n\t\n{% endfor %}",
\                "if" : "{% if ${1} %}\n\t\n{% endif %}",
\                "elif" : "{% elif ${1} %}\n\t\n",
\                "else" : "{% else %}\n\t${1}\n",
\                "macro" : "{% macro ${1} %}\n\t\n{% endmacro %}"
\            }
\    }
\}


" TMUX Background fix
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

lua require("autoclose").setup()

lua vim.g.loaded_perl_provider = 0
lua vim.g.loaded_ruby_provider = 0
lua vim.g.loaded_node_provider = 0

" Getter/setter mapping
" https://vim.fandom.com/wiki/Generate_Java_setters_and_getters_automatically
map <C-g><C-s> mawv/ <CR>"ty/ <CR>wvwh"ny/getters<CR>$a<CR><CR><Esc>xxapublic<Esc>"tpa<Esc>"npbiget<Esc>l~ea()<CR>{<CR><Tab>return<Esc>"npa;<CR>}<Esc>=<CR><Esc>/setters<CR>$a<CR><CR><Esc>xxapublic void<Esc>"npbiset<Esc>l~ea(<Esc>"tpa <Esc>"npa)<CR>{<CR><Tab>this.<Esc>"npa=<Esc>"npa;<CR>}<Esc>=<CR>`ak

