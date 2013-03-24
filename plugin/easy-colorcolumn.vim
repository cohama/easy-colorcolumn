if exists('g:loaded_easy_colorcolumn')
  finish
endif
let g:loaded_easy_colorcolumn = 1

let s:save_cpo = &cpo
set cpo&vim

nnoremap <silent> <Plug>(easy-colorcolumn-add) :<C-u>call easy_colorcolumn#add('n')<CR>
nnoremap <silent> <Plug>(easy-colorcolumn-toggle) :<C-u>call easy_colorcolumn#toggle('n')<CR>
nnoremap <silent> <Plug>(easy-colorcolumn-clear) :<C-u>call easy_colorcolumn#clear('n')<CR>

vnoremap <silent> <Plug>(easy-colorcolumn-add) :<C-u>call easy_colorcolumn#add('v')<CR>
vnoremap <silent> <Plug>(easy-colorcolumn-toggle) :<C-u>call easy_colorcolumn#toggle('v')<CR>
vnoremap <silent> <Plug>(easy-colorcolumn-clear) :<C-u>call easy_colorcolumn#clear('v')<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
