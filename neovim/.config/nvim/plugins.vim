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
 if !executable("curl")
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
	" Syntax highlighting
	Plug 'sheerun/vim-polyglot'
  Plug 'liuchengxu/vim-which-key'

	Plug 'yggdroot/leaderf'

  Plug 'mhinz/vim-startify'

	" Viewer for Symbols and Ctags
	Plug 'liuchengxu/vista.vim'

  Plug 'markonm/traces.vim'

	" Rainbow Parentheses Improved
	Plug 'luochen1990/rainbow'

	" Auto resize
	Plug 'camspiers/animate.vim'
	Plug 'camspiers/lens.vim'

	" Linting support
	Plug 'w0rp/ale'

	" Motion and Objects
	Plug 'justinmk/vim-sneak'
	Plug 'unblevable/quick-scope'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'tomtom/tcomment_vim' "Easy comment blocks with <Leader>cc.
	Plug 'tpope/vim-rsi'
	Plug 'terryma/vim-expand-region'
	Plug 'andymass/vim-matchup'

	" Snippets
	Plug 'honza/vim-snippets'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Project setup
	Plug 'airblade/vim-rooter'
	Plug 'tpope/vim-vinegar'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-fugitive' "Better Git support.
	Plug 'junegunn/gv.vim' "Git commit browser.
	Plug 'airblade/vim-gitgutter' "Display git diff gutter.
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './ --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'sjl/gundo.vim' "Intelligent undo tree.

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
