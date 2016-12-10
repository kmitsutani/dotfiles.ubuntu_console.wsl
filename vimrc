syntax enable
" encodings
set encoding=utf-8
scriptencoding utf-8
set fileencodings=ucs-boms,utf-8,iso-2022-jp,cp932,euc-jp,default,latin
set fileformats=unix,dos,mac
set ambiwidth=double
set fileencoding=utf-8
set ttimeoutlen=10

" backspace
set backspace=indent,eol,start

" indent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
au BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4
set noswapfile

" searching
set incsearch " incremental search
set ignorecase
set smartcase
set hlsearch

" toggle highlight by double touch of <ESC>
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" Cursor
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト"

" completion
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

" off indent when paste from buffer
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" key remap
map <F18> <Nop>
map <F19> <Nop>
map <S-F6> <Nop>
map <S-F7> <Nop>
noremap : ;
noremap ; :
noremap <C-c> <Nop>
imap <Nul> <Nop>
inoremap ,d <C-r>=strftime('%Y-%m-%d')<Return>
inoremap ,t <C-r>=strftime('%H:%M:%S')<Return>
inoremap ,dt <C-r>=strftime('%Y-%m-%d %H:%M:%S')<Return>
inoremap ,= =======================================

augroup python
  autocmd FileType python set tabstop=4
  autocmd FileType python setlocal completeopt-=preview
augroup END

" let s:not_bow = system('if [ -d /mnt/c/Users ]; then echo 0; else echo 1; fi')

"if s:not_bow
  source ~/.vimrc_dein
" endif

if !&compatible
  set nocompatible
endif
