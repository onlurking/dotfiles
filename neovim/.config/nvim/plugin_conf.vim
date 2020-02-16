" ╭─────────────╥──────────────────╮
" │ Author:     ║ File:            │
" │ Diogo Felix ║ plugin_conf.vim  │
" ╞═════════════╩══════════════════╡
" │ Rest of .dotfiles:             │
" │ gitHub.com/onlurking/dotfiles  │
" ╰────────────────────────────────╯

" Notational Velocity (alok/notational-fzf-vim)
let g:nv_search_paths = ['~/.notes', '~/.wiki']
let g:nv_default_extension = '.md'

" Vimwiki (vimwiki/vimwiki)
let g:vimwiki_list = [{'path': '~/.wiki/', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/.notes/', 'syntax': 'markdown', 'ext': '.md'} ]

" Automatically generate Diary Links
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
  autocmd!
  autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end

" Enable label mode in sneak (justinmk/vim-sneak)
let g:sneak#label = 1

" CoC configuration
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'

let g:coc_global_extensions = [
	\ 'coc-json', 'coc-yaml', 'coc-lists', 'coc-svg',
	\ 'coc-pyls', 'coc-vetur', 'coc-vimlsp',
	\ 'coc-tsserver', 'coc-html', 'coc-css', 'coc-pairs', 'coc-prettier',
	\ 'coc-highlight', 'coc-snippets', 'coc-emmet'
\ ]

" Enable hardtime
let g:hardtime_default_on = 1

" Goyo configuration
function! GoyoBefore()
  Limelight
endfunction

function! GoyoAfter()
  Limelight!
  hi Normal ctermbg=NONE guibg=NONE
endfunction

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]

let g:goyo_width = 120

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'NONE'
let g:limelight_conceal_guifg = 'NONE'
let g:limelight_default_coefficient = 0.3
autocmd InsertLeave * :Limelight!

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,vimwiki call pencil#init({'wrap': 'hard', 'autoformat': 0, 'textwidth': 88})
augroup END

" Fix vetur syntax highlight
autocmd FileType vue syntax sync fromstart


let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)


" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <silent> <leader> :WhichKey ','<CR>
