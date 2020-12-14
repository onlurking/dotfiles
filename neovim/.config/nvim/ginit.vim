colorscheme Tomorrow-Night-Eighties

if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Monospace Regular 9')
  call rpcnotify(1, 'Gui', 'FontFeatures', 'PURS, cv17')
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
endif

if exists('g:fvim_loaded')
    " good old 'set guifont' compatibility
    set guifont=Fira\ Code\ Medium:h11
    " Ctrl-ScrollWheel for zooming in/out
    nnoremap <silent> <C-+> :set guifont=+<CR>
    nnoremap <silent> <C--> :set guifont=-<CR>
endif
