" ╭─────────────╥──────────────────╮
" │ Author:     ║ File:            │
" │ Diogo Felix ║ common.vim       │
" ╞═════════════╩══════════════════╡
" │ Rest of .dotfiles:             │
" │ gitHub.com/onlurking/dotfiles  │
" ╰────────────────────────────────╯

syntax on
filetype plugin on
colorscheme Tomorrow-Night-Eighties
hi Normal ctermbg=NONE guibg=NONE

set number
set relativenumber
set expandtab
set shiftwidth=2
set laststatus=0
set tabstop=2
set shortmess+=afilmnrxoOtT
set listchars=eol:¬,tab:»\ ,trail:~,extends:»,precedes:«
set updatetime=300
set hidden
set clipboard+=unnamedplus

if !isdirectory($HOME."/.config/nvim/undo-dir")
  call mkdir($HOME."/.config/nvim/undo-dir", "", 0700)
endif

set undodir=~/.config/nvim/undo-dir
set undofile

let mapleader=","

let g:netrw_dirhistmax = 0
