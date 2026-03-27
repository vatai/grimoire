:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
:highlight ExtraWhitespace ctermbg=red guibg=red
:set relativenumber
:set expandtab
:set shiftwidth=2

call plug#begin()
Plug 'neomake/neomake'
call plug#end()

call neomake#configure#automake('nrwi', 100)
 
  
" function FormatBuffer()
"   if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
"     let cursor_pos = getpos('.')
"     :%!clang-format
"     call setpos('.', cursor_pos)
"   endif
" endfunction
" 
" autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.vert,*.frag :call FormatBuffer()
