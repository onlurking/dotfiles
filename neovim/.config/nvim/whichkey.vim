call which_key#register(',', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey ','<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual ','<CR>

let g:which_key_map =  {}

let g:which_key_map.w = {
      \ 'name' : 'Wiki',
      \ 'w' : ['<Plug>VimwikiIndex', 'Wiki'],
      \ 'n' : ['NV', 'Notes'],
      \ 's' : ['<Plug>VimwikiUISelect', 'Select Wiki'],
      \ 'i' : ['Diary', 'Diary'],
      \ ',' : {
        \ 'name': 'Diary Options',
        \ 'i': 'which_key_ignore',
        \ 'm': 'which_key_ignore',
        \ 'w': ['<Plug>VimwikiMakeDiaryNote', 'Today'],
        \ 't': ['<Plug>VimwikiMakeTomorrowDiaryNote', 'Tomorrow'],
        \ 'y': ['<Plug>VimwikiMakeYesterdayDiaryNote', 'Yesterday'],
      \ },
      \ 't' : 'which_key_ignore',
      \ }

