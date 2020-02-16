" ╭─────────────╥──────────────────╮
" │ Author:     ║ File:            │
" │ Diogo Felix ║ plugins.vim      │
" ╞═════════════╩══════════════════╡
" │ Rest of .dotfiles:             │
" │ gitHub.com/onlurking/dotfiles  │
" ╰────────────────────────────────╯

" Download colorscheme if not present
if empty(glob('~/.config/nvim/colors/Tomorrow-Night-Eighties.vim'))
  silent !curl -fLo ~/.config/nvim/colors/Tomorrow-Night-Eighties.vim --create-dirs
    \ https://raw.githubusercontent.com/chriskempson/vim-tomorrow-theme/master/colors/Tomorrow-Night-Eighties.vim
  autocmd VimEnter * source $MYVIMRC
endif

" Download Vim Plug if not present
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
	" Syntax highlighting
	Plug 'sheerun/vim-polyglot'

  Plug 'takac/vim-hardtime'

  Plug 'liuchengxu/vim-which-key'

	" Motion and Objects
	Plug 'justinmk/vim-sneak'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'scrooloose/nerdcommenter'
	Plug 'tpope/vim-rsi'
	Plug 'terryma/vim-expand-region'
	Plug 'andymass/vim-matchup'

	" Snippets
	Plug 'honza/vim-snippets'
	Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}

	" Project setup
	Plug 'airblade/vim-rooter'
	Plug 'tpope/vim-vinegar'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-fugitive'
	Plug 'junegunn/gv.vim'
	Plug 'airblade/vim-gitgutter'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './ --all' }
	Plug 'junegunn/fzf.vim'
	" Plug 'ludovicchabant/vim-gutentags'

	" Writing
	Plug 'ntpeters/vim-better-whitespace'
	Plug 'junegunn/limelight.vim'
	Plug 'junegunn/goyo.vim'
	Plug 'reedes/vim-pencil'
	Plug 'dhruvasagar/vim-table-mode'

	" Notekeeping
	Plug 'alok/notational-fzf-vim'
	Plug 'vimwiki/vimwiki'

  if !IsTermux()
    Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
  endif

call plug#end()
