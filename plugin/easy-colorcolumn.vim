if exists('g:loaded_easy_colorcolumn')
  finish
endif
let g:loaded_easy_colorcolumn = 1

let s:save_cpo = &cpo
set cpo&vim

noremap <Plug>(easy-colorcolumn-) " closing#close_doublequote()

let &cpo = s:save_cpo
unlet s:save_cpo
