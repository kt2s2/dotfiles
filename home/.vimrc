"---------------------------------------------------------------------------
" Sainu's .vimrc
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------

if &compatible
  set nocompatible
endif

let g:rc_dir = expand('~/.vim/rc')

function! s:source_rc(rc_file_name)
  let rc_file = expand(g:rc_dir . '/' . a:rc_file_name)
  if filereadable(rc_file)
    execute 'source' rc_file
  endif
endfunction

function! s:on_filetype() abort
  if execute('filetype') =~# 'OFF'
    silent! filetype plugin indent on
    syntax enable
    filetype detect
  endif
endfunction

augroup MyAutoCmd
  autocmd!
augroup END



"---------------------------------------------------------------------------
" Dein:
"

set runtimepath+=/Users/sainu/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein')
  call dein#load_toml('~/.vim/rc/dein.toml',      { 'lazy' : 0 })
  call dein#load_toml('~/.vim/rc/deinlazy.toml',  { 'lazy' : 1 })

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
"---------------------------------------------------------------------------



set background=dark
colorscheme hybrid
if has('vim_starting') && !empty(argv())
  call s:on_filetype()
endif

syntax enable
filetype plugin indent on


"---------------------------------------------------------------------------
" Encoding:
"

set fileformat=unix
set fileformats=unix,dos,mac

set encoding=utf-8
set fileencodings=utf-8



"---------------------------------------------------------------------------
" Text:
"

" syntax on
" set guifont=RictyNerdFontAOPL-RegularForPowerline:h14

autocmd BufNewFile,BufRead *.jsx    setfiletype javascript
autocmd BufNewFile,BufRead *.es6    setfiletype javascript
autocmd BufNewFile,BufRead *.vue    setfiletype html





"---------------------------------------------------------------------------
" Search:
"



" インクリメンタルサーチを行う
set incsearch

" 検索結果をハイライト
set hlsearch

" 大文字/小文字の区別なく検索する
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索結果を中央にくるようにする
nmap n nzz






"---------------------------------------------------------------------------
" Edit:
"



" Smart insert tab setting.
set smarttab

"tabを半角スペースで挿入する
set expandtab

"vimが自動で生成する（読み込み時など）tab幅をスペース2つ分にする
set shiftwidth=2

"インデントをスペース2つ分に設定
set tabstop=2

set shiftround

"改行時に前の行のインデントを継続する
set autoindent

"オートインデント
set smartindent

set modelines=0
set nomodeline

" ヤンクした文字は、システムのクリップボードに入れる
if (!has('nvim') || $DISPLAY != '') && has('clipboard')
  if has('unnamedplus')
     set clipboard& clipboard+=unnamedplus
  else
     set clipboard& clipboard+=unnamed
  endif
endif

"バックスペースにてインデントを削除可能にする
set backspace=indent,eol,start

" Highlight <>.
set matchpairs+=<:>

"括弧入力時の対応する括弧を表示
set showmatch

"ファイルの保存をしていなくても、別のファイルを開けるようにする
set hidden

"保存されていないファイルがあるときは終了前に保存確認
set confirm

"外部でファイルに変更がされた場合は読みなおす
set autoread

" 他のウィンドウ・アプリでの変更を反映する
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END

"長い文字列でも@でなくちゃんと表示する
set display=lastline

"バイナリファイルの非印字可能文字を16進数で表示
"set display+=uhex

set foldmethod=marker

" 行末・行頭から次の行へ移動可能に
set whichwrap+=h,l,<,>,[,],b,s

"文字のないところにカーソル移動できるようにする
set virtualedit=block

"showmatchによって対象括弧に飛ぶ時間を0.1秒に変更
set matchtime=1


" 最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif






"---------------------------------------------------------------------------
" View:
"


"0で始まる数値を、8進数として扱わないようにする
set nrformats=octal

"編集中のファイル名を表示
set title

" カラムラインを引く
set colorcolumn=80

"行番号を表示する
set number

" カーソル位置表示
set ruler

" カーソル行をハイライト
" set cursorline
" hi CursorLineNr term=bold cterm=NONE ctermfg=228 ctermbg=NONE

"ウィンドウの幅より長い行は折り返した、次の行に表示する
set wrap

"カーソルの上または下に表示する最小限の行数
set scrolloff=8

" 左右スクロール時の視界を確保
set sidescrolloff=16

" 左右スクロールは一文字づつ行う
set sidescroll=1

"可視化した空白文字の表示形式について
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"空白文字の可視化
set list

" Disable bell.
set t_vb=
set novisualbell
set noerrorbells
set belloff=all

" コマンド実行中は再描画しない
set lazyredraw

"コマンドライン補完を拡張モードにする
set wildmenu

"補完のポップアップの表示する件数を10
set pumheight=20

" 高速ターミナル接続を行う
set ttyfast

"文脈によって解釈が異なる全角文字の幅を、２に固定する
set ambiwidth=double
" 全角スペースの表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

" バックアップを作らない
set nowritebackup
set nobackup
set noswapfile
set backupdir-=.


" プロジェクト固有の設定ファイル.vimrc.localを読み込む
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END
function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction





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
" ,のデフォルトの機能は\に割当
noremap \ ,


" Visual mode keymappings:

" Indent
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

" Save file
nnoremap <Leader>w :w<CR>

" Split window
noremap ,v :<C-u>vsplit<CR><C-w>l
noremap ,w :<C-u>split<CR><C-w>j

" Emulate terminal
noremap ,t :<C-u>terminal ++close<CR>


" Insert mode keymappings:

" Delete
inoremap <silent> <C-h> <C-g>u<C-h>
inoremap <silent> <C-d> <Del>

" Show file path
" nnoremap <C-g> 1<C-g>


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








"---------------------------------------------------------------------------
" For UNIX:
"

" Use sh.  It is faster
set shell=sh




"---------------------------------------------------------------------------

set secure
