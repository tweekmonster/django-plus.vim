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
