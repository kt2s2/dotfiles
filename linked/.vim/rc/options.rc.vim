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
