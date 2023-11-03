" You will need to install ctrlp.vim and Copilot.vim
syntax on

" indent 2 spaces
set shiftwidth=2
set expandtab

" auto indent when I hit return
set autoindent
set smartindent

" Don't remove indent from comments
set cindent cinkeys-=0#

" Line numbering
set number
highlight LineNr ctermfg=DarkGrey ctermbg=NONE cterm=NONE
" Have to set and then clear CursorLine because it contains highlighting for the numbers
" To unset temporarily for copying and whatnot :set nonu
set cursorline
highlight clear CursorLine
highlight CursorLineNR ctermfg=yellow

" Highlighting trailing whitespace in red
" https://stackoverflow.com/questions/4617059/showing-trailing-spaces-in-vim
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" More inclusive Dockerfile syntax highlighting
autocmd BufNewFile,BufRead Dockerfile* set syntax=dockerfile

" Use Ag in CtrlP
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" Use ff to open CtrlP
"let g:ctrlp_map = 'ff<Enter>'
let g:ctrlp_map = 'ff'

" To update copilot go to ~/.vim/pack/plugins/start/copilot.vim and run git pull
imap <silent> <C-j> <Plug>(copilot-next)
imap <silent> <C-k> <Plug>(copilot-prev)
