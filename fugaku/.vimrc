:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
:highlight ExtraWhitespace ctermbg=red guibg=red
:set relativenumber
:set expandtab
:set shiftwidth=2

call plug#begin()
Plug 'neomake/neomake'
call plug#end()

call neomake#configure#automake('nrwi', 100)

