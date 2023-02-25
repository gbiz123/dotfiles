set nocompatible
set number
let g:python_highlight_all = 1
let g:colorizer_auto_color = 1
set clipboard+=unnamedplus

" ALE disable LSP
let g:ale_disable_lsp = 1

" Compile + run java
autocmd FileType java nmap <c-j> :!javac %; java %:r <cr>

" Telescope
nmap <C-t> :Telescope find_files<cr>

" Slime/IPythonCell
let g:slime_target = "tmux"
nmap <c-c><c-x> :%SlimeSend<cr>
nmap <c-c><c-s> :IPythonCellRun<cr>

" Vim slime default to 0.1
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}

" Vim slime use with R radian
function! _EscapeText_r(text)
  call system("cat > ~/.slime_r", a:text)
  return ["source('~/.slime_r', echo = TRUE, max.deparse.length = 4095)\r"]
endfunction

filetype plugin indent on

" Tab is 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab	
set nohlsearch

" Python settings
colorscheme onedark
autocmd FileType python colorscheme NeoSolarized
autocmd FileType python AirlineToggle

let g:python3_host_prog = "/usr/bin/python"

" HTML Settings
autocmd FileType html packadd emmet-vim

" jinja2 snippets
let g:user_emmet_settings = {
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
