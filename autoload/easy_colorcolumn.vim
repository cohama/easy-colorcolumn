function! s:init_variables()
  if !exists('b:easy_colorcolumn_columns')
    let b:easy_colorcolumn_columns = []
  endif
endfunction

function! s:set_colorcolumn()
  let &l:colorcolumn = join(b:easy_colorcolumn_columns, ',')
endfunction

function! s:add_colorcolumn(col)
  " add when current col is NOT included in the list
  if count(b:easy_colorcolumn_columns, a:col) == 0
    call add(b:easy_colorcolumn_columns, a:col)
  endif
endfunction

function! s:toggle_colorcolumn(col)
  let i = index(b:easy_colorcolumn_columns, a:col)
  " if current col is included in the list
  if i >= 0
    call remove(b:easy_colorcolumn_columns, i)
  else
    call add(b:easy_colorcolumn_columns, a:col)
  endif
endfunction

function! s:get_visual_range()
  let vstart = col("'<")
  let vend = col("'>")

  if vstart < vend
    return range(vstart, vend)
  else
    return range(vend, vstart)
  endif
endfunction

function! s:get_one_range()
  return [col('.')]
endfunction

function! easy_colorcolumn#add(mode)
  call s:init_variables()

  let col = (a:mode ==? 'v') ? s:get_visual_range() : s:get_one_range()
  for c in col
    call s:add_colorcolumn(c)
  endfor

  call s:set_colorcolumn()
endfunction

function! easy_colorcolumn#toggle(mode)
  call s:init_variables()

  let col = (a:mode ==? 'v') ? s:get_visual_range() : s:get_one_range()
  for c in col
    call s:toggle_colorcolumn(c)
  endfor

  call s:set_colorcolumn()
endfunction

function! easy_colorcolumn#clear(mode)
  let b:easy_colorcolumn_columns = []
  call s:set_colorcolumn()
endfunction
