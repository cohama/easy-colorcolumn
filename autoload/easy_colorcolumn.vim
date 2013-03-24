function! s:init_variables()
  if !exists('b:easy_colorcolumn_columns')
    let b:easy_colorcolumn_columns = []
  endif
endfunction

function! s:set_colorcolumn()
  let &l:colorcolumn = join(b:easy_colorcolumn_columns, ',')
endfunction

function! easy_colorcolumn#add(mode)
  call <SID>init_variables()

  let current_col = col('.')
  " add when current col is NOT included in the list
  if count(b:easy_colorcolumn_columns, current_col) == 0
    call add(b:easy_colorcolumn_columns, current_col)
  endif

  call <SID>set_colorcolumn()
endfunction


function! easy_colorcolumn#toggle(mode)
  call <SID>init_variables()

  let current_col = col('.')
  let i = index(b:easy_colorcolumn_columns, current_col)

  " if current col is included in the list
  if i >= 0
    call remove(b:easy_colorcolumn_columns, i)
  else
    call add(b:easy_colorcolumn_columns, current_col)
  endif

  call <SID>set_colorcolumn()
endfunction


function! easy_colorcolumn#clear(mode)
  let b:easy_colorcolumn_columns = []
  call <SID>set_colorcolumn()
endfunction
