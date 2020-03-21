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

