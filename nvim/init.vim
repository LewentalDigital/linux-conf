set number
set tabstop=4
set mouse=a
colorscheme darkblue

" Netrw File browser
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_browse_split=2
let g:netrw_altv=1
let g:netrw_winsize=15
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'
" Open netrw when opening nvim
"augroup InitNetrw
"  autocmd!
"  autocmd VimEnter * :silent! Vexplore
"augroup END
" Auto focus on file if nvim is opened with file argument
autocmd VimEnter * if (argc() > 0 && filereadable(argv()[0])) | wincmd l | endif
