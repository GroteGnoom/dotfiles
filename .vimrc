"with only gruvbox everything gets messed up"
colo industry
colo gruvbox
syntax on
set tags=./tags;
"laststatus 2 always shows the status line"
set laststatus=2
set expandtab
set shiftwidth=4
set smartindent
set number
"Show trailing whitepace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

autocmd FileType make setlocal noexpandtab
hi normal ctermbg=black

"to read file when updated externally"
set autoread
