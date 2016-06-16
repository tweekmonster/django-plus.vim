if exists('b:did_django_ftplugin') || !exists('b:is_django')
  finish
endif
let b:did_django_ftplugin = 1
let b:orig_omnifunc = &l:omnifunc
setlocal omnifunc=djangoplus#complete


if exists(':UltiSnipsAddFiletypes')
  " Ensure UltiSnipsEdit opens the htmldjango.snippets file
  call UltiSnips#FileTypeChanged()

  " Add HTML snippets
  UltiSnipsAddFiletypes django
endif


if exists(':ImpSort')
  function! s:django_sort(a, b) abort
    return impsort#sort_top('^django', a:a, a:b)
  endfunction

  if get(g:, 'django_impsort_top', 1)
    let b:impsort_method_group = [function('s:django_sort')]
          \ + get(g:, 'impsort_method_group', ['length', 'alpha'])
    let b:impsort_method_module = [function('s:django_sort')]
          \ + get(g:, 'impsort_method_module', ['depth', 'length', 'alpha'])
  endif
endif


" Can't put this in a syntax script because `django` is not a python filetype.
syntax match djangoQueryObject #\.objects\.#hs=s+1,he=e-1 containedin=TOP
syntax match djangoModelsModule #\<models\.#he=e-1 containedin=TOP
syntax match djangoModelField #\k\+Field\># containedin=TOP

highlight default link djangoQueryObject Special
highlight default link djangoModelsModule Special
highlight default link djangoModelField Type
