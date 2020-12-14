" ╭─────────────╥──────────────────╮
" │ Author:     ║ File:            │
" │ Diogo Felix ║ common.vim       │
" ╞═════════════╩══════════════════╡
" │ Rest of .dotfiles:             │
" │ gitHub.com/onlurking/dotfiles  │
" ╰────────────────────────────────╯

syntax on
set background=dark
filetype plugin on
colorscheme Tomorrow-Night-Eighties

set wrap linebreak nolist
set hlsearch " Highlight all search results
set autoindent " Auto-indent new lines
set ignorecase " Always case-insensitive
set inccommand=
set incsearch " Searches for strings incrementally
set number
set relativenumber
set expandtab
set shiftwidth=2
set laststatus=0
set tabstop=2
set shortmess+=afilmnrxoOtT
set listchars=eol:¬,tab:»\ ,trail:~,extends:»,precedes:«
set mouse=a " Enable mouse. see :help mouse for info.
set noshowmode
set pumheight=10
set showbreak=+++ " Wrap-broken line prefix
set showmatch " Highlight matching brace
set smartcase " Enable smart-case search
set smartindent " Enable smart-indent
set smarttab " Enable smart-tabs
set softtabstop=2 " Number of spaces per Tab"""
set updatetime=300
set hidden

set visualbell " Use visual bell (no beeping)
set wildmenu
set wildmode=full

set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz,*.docx,*.ppt,*.odt
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class,*.jar,*.iso
set wildignore+=*.swp,.lock,.DS_Store,._*
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=.git,.hg,.svn"

set clipboard+=unnamedplus

set backspace=indent,eol,start " Backspace behaviour
set ruler " Show row and column ruler information
set undolevels=1500 " Number of undo levels

if !isdirectory($HOME."/.config/nvim/undo-dir")
  call mkdir($HOME."/.config/nvim/undo-dir", "", 0700)
endif

set undodir=~/.config/nvim/undo-dir
set undofile

let mapleader=","

let g:netrw_dirhistmax = 0

" Enable true color
if (has("termguicolors"))
  set termguicolors
endif

" Handle vim paste
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

