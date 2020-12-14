" ╭─────────────╥──────────────────╮
" │ Author:     ║ File:            │
" │ Diogo Felix ║ plugin_conf.vim  │
" ╞═════════════╩══════════════════╡
" │ Rest of .dotfiles:             │
" │ gitHub.com/onlurking/dotfiles  │
" ╰────────────────────────────────╯

" Notational Velocity (alok/notational-fzf-vim)
let g:nv_search_paths = ['~/.notes', '~/.wiki', '~/.cheat']
let g:nv_default_extension = '.md'

" Vimwiki (vimwiki/vimwiki)
let g:vimwiki_list = [
	\ { 'path': '~/.wiki/', 'syntax': 'markdown', 'ext': '.md' },
	\ { 'path': '~/.notes/', 'syntax': 'markdown', 'ext': '.md' },
\ ]

let g:vimwiki_key_mappings = {
  \ 'headers': 0,
\ }

" markdown-composer
let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1

" Automatically generate Diary Links
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
  autocmd!
  autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end

" LeaderF
let g:Lf_ShortcutF = "<leader>ff"

let g:Lf_RgConfig = [
  \ "--hidden",
  \ "--follow",
\ ]

noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>fw :<C-U><C-R>=printf("Leaderf rg --follow --glob=!.git/* --wd-mode=Ac %s", "")<CR><CR>

" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

" vim-rooter Change to file's directory
let g:rooter_change_directory_for_non_project_files = 'current'

" Enable label mode in sneak (justinmk/vim-sneak)
let g:sneak#label = 1

" CoC configuration
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'

let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-highlight',
	\	'coc-html',
	\ 'coc-emmet',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-project',
	\ 'coc-pairs',
	\ 'coc-prettier',
	\ 'coc-tabnine',
	\ 'coc-pyls',
	\ 'coc-snippets',
	\ 'coc-svg',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
\ ]

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Goyo configuration
"
" Remove artifacts for Neovim on true colors transparent background.
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif

  hi! VertSplit gui=NONE guifg=bg guibg=NONE
  hi! StatusLine gui=NONE guifg=bg guibg=NONE
  hi! StatusLineNC gui=NONE guifg=bg guibg=NONE
  hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
  set wrap
	Limelight0.3
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif

  hi! VertSplit gui=NONE guifg=bg guibg=NONE
  hi! StatusLine gui=NONE guifg=bg guibg=NONE
  hi! StatusLineNC gui=NONE guifg=bg guibg=NONE
  hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
  set wrap
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,vimwiki call pencil#init({'wrap': 'hard', 'autoformat': 0, 'textwidth': 88})
augroup END

" Fix vetur syntax highlight
autocmd FileType vue syntax sync fromstart

nnoremap <silent> <leader> :WhichKey ','<CR>

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

