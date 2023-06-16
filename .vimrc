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
set cursorline
highlight clear CursorLine
highlight CursorLineNR ctermfg=yellow

" Highlighting trailing whitespace in red
" https://stackoverflow.com/questions/4617059/showing-trailing-spaces-in-vim
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

imap <silent> <C-j> <Plug>(copilot-next)
imap <silent> <C-k> <Plug>(copilot-prev)
