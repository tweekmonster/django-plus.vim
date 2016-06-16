if !exists('b:is_django')
  finish
endif

syntax match djangoQueryObject #\.objects\.#hs=s+1,he=e-1 containedin=TOP
syntax match djangoModelsModule #\<models\.#he=e-1 containedin=TOP
syntax match djangoModelField #\k\+Field\># containedin=TOP
syntax match djangoSettingsObject "\<settings\."he=e-1 containedin=TOP

highlight default link djangoQueryObject Special
highlight default link djangoModelsModule Special
highlight default link djangoModelField Type
highlight default link djangoSettingsObject Special
