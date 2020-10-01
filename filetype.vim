augroup djangoplusfiletypedetect
  " Since templates can be anything, check any file.
  autocmd!
  autocmd BufRead,BufNewFile * call djangoplus#detect#filetype(expand('<afile>:p'))
augroup END
