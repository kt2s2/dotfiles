"---------------------------------------------------------------------------
" Mappings:
"


" :map   :noremap  :unmap     ノーマル、ビジュアル、選択、オペレータ待機
" :nmap  :nnoremap :nunmap    ノーマル
" :vmap  :vnoremap :vunmap    ビジュアル、選択
" :smap  :snoremap :sunmap    選択
" :xmap  :xnoremap :xunmap    ビジュアル
" :omap  :onoremap :ounmap    オペレータ待機
" :map!  :noremap! :unmap!    挿入、コマンドライン
" :imap  :inoremap :iunmap    挿入
" :lmap  :lnoremap :lunmap    挿入、コマンドライン、Lang-Arg
" :cmap  :cnoremap :cunmap    コマンドライン


let mapleader="\<Space>"


" Visual mode keymappings:

" Indent
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

" Save file
nnoremap <Leader>w :w<CR>

" Moving
noremap <S-h> ^
noremap <S-l> $

" Split window
noremap ,v :<C-u>vsplit<CR>
noremap ,w :<C-u>split<CR>

" Emulate terminal
noremap ,t :<C-u>terminal ++close<CR>


" Insert mode keymappings:

" Delete
inoremap <silent> <C-h> <C-g>u<C-h>
inoremap <silent> <C-d> <Del>


" Command-line mode keymappings:
" <C-a>, A: move to head.
cnoremap <C-a>          <Home>
" <C-b>: previous char.
cnoremap <C-b>          <Left>
" <C-d>: delete char.
cnoremap <C-d>          <Del>
" <C-e>, E: move to end.
cnoremap <C-e>          <End>
" <C-f>: next char.
cnoremap <C-f>          <Right>
" <C-n>: next history.
cnoremap <C-n>          <Down>
" <C-p>: previous history.
cnoremap <C-p>          <Up>
" <C-y>: paste.
cnoremap <C-y>          <C-r>*
" <C-g>: Exit.
cnoremap <C-g>          <C-c>
