" ╭─────────────╥──────────────────╮
" │ Author:     ║ File:            │
" │ Diogo Felix ║ functions.vim    │
" ╞═════════════╩══════════════════╡
" │ Rest of .dotfiles:             │
" │ gitHub.com/onlurking/dotfiles  │
" ╰────────────────────────────────╯

" Check if we in termux
function! IsTermux()
	return match($PATH, "termux") >= 0
endfunction

" Build vim-markdown-composer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction
