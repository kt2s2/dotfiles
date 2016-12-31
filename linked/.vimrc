""""""""""""""""""""""""""""""""""""""
" 表示設定
""""""""""""""""""""""""""""""""""""""

"{{{
set ambiwidth=double    "文脈によって解釈が異なる全角文字の幅を、２に固定する
set backspace=indent,eol,start "バックスペースにてインデントを削除可能にする
set cursorline          " カーソル行をハイライト
set display=lastline    "長い文字列でも@でなくちゃんと表示する
set display=uhex        "バイナリファイルの非印字可能文字を16進数で表示
set expandtab           "tabを半角スペースで挿入する
set hidden              "ファイルの保存をしていなくても、別のファイルを開けるようにする
set lazyredraw          " コマンド実行中は再描画しない
set list                "空白文字の可視化
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:% "可視化した空白文字の表示形式について
set matchtime=1         "showmatchによって対象括弧に飛ぶ時間を0.1秒に変更
set nrformats-=octal    "0で始まる数値を、8進数として扱わないようにする
set number              "行番号を表示する
set pumheight=10        "補完のポップアップの表示する件数を10
set scrolloff=5         "カーソルの上または下に表示する最小限の行数
set shiftwidth=2        "vimが自動で生成する（読み込み時など）tab幅をスペース2つ分にする
set showmatch           "括弧入力時の対応する括弧を表示
set smartindent         "オートインデント
set tabstop=2           "インデントをスペース2つ分に設定
set title               "編集中のファイル名を表示
set ttyfast             " 高速ターミナル接続を行う
set virtualedit=block   "文字のないところにカーソル移動できるようにする
set whichwrap=b,s,[,],<,>
set wildmenu            "コマンドライン補完を拡張モードにする
" set wrap                "ウィンドウの幅より長い行は折り返した、次の行に表示する

" ペーストモードの挿入モードからノーマルモードに戻る時にペーストモードを解除する
autocmd InsertLeave * set nopaste
"}}}


" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
"{{{
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
"}}}




""""""""""""""""""""""""""""""""""""""
" 色
""""""""""""""""""""""""""""""""""""""
"{{{
syntax enable

" 補完候補の色づけ for vim7
" hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
" hi PmenuSel ctermbg=blue ctermfg=black
" hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
" hi PmenuSbar ctermbg=0 ctermfg=9
" hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF
"}}}




""""""""""""""""""""""""""""""""""""""
" マッピング
""""""""""""""""""""""""""""""""""""""
"{{{
nnoremap <S-q> :!

inoremap <silent> jk <ESC>

noremap <S-h> ^
noremap <S-l> $

"カーソル前の文字削除
inoremap <silent> <C-h> <C-g>u<C-h>
"カーソル後の文字削除
inoremap <silent> <C-d> <Del>
"カーソルから行末まで削除
inoremap <silent> <C-d>0 <Esc>ly0<Insert>
"カーソルから行頭までヤンク
inoremap <silent> <C-y>1 <Esc>ly0<Insert>
"カーソルから行末までヤンク
inoremap <silent> <C-y>0 <Esc>ly$<Insert>
"}}}




""""""""""""""""""""""""""""""""""""""
" 検索設定
""""""""""""""""""""""""""""""""""""""
"{{{
set ignorecase  " 大文字/小文字の区別なく検索する
set smartcase   " 検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan    " 検索時に最後まで行ったら最初に戻る
set ignorecase  " 大文字/小文字の区別なく検索する
set smartcase   " 検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan    " 検索時に最後まで行ったら最初に戻る
set incsearch   " インクリメンタルサーチを行う
set hlsearch    " 検索結果をハイライト
" nnoremap <C-h><C-h> :nohlsearch<CR>
" 検索結果を中央にくるようにする
nmap n nzz
"}}}




""""""""""""""""""""""""""""""""""""""
" かっこ補完
""""""""""""""""""""""""""""""""""""""
"{{{
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

function! DeleteParenthesesAdjoin()
    let pos = col(".") - 1  " カーソルの位置．1からカウント
    let str = getline(".")  " カーソル行の文字列
    let parentLList = ["(", "[", "{", "\'", "\""]
    let parentRList = [")", "]", "}", "\'", "\""]
    let cnt = 0

    let output = ""

    " カーソルが行末の場合
    if pos == strlen(str)
        return "\b"
    endif
    for c in parentLList
        " カーソルの左右が同種の括弧
        if str[pos-1] == c && str[pos] == parentRList[cnt]
            call cursor(line("."), pos + 2)
            let output = "\b"
            break
        endif
        let cnt += 1
    endfor
    return output."\b"
endfunction
" BackSpaceに割り当て
" inoremap <silent> <BS> <C-R>=DeleteParenthesesAdjoin()<CR>
" Ctrl-Hに割り当て
inoremap <silent> <C-h> <C-R>=DeleteParenthesesAdjoin()<CR>
"}}}




""""""""""""""""""""""""""""""""""""""
" その他
""""""""""""""""""""""""""""""""""""""
"{{{
set backupdir=$HOME/vimbackup     " バックアップファイルのディレクトリを指定する
set nocompatible                  " vi互換をオフする
set directory=$HOME/vimbackup     " スワップファイル用のディレクトリを指定する
set mouse=a                       " マウス操作をできるようにする
set clipboard=unnamed,autoselect  " ヤンクした文字は、システムのクリップボードに入れる
set visualbell t_vb=              " エラービープ音を鳴らさない
set noerrorbells
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac


"クリップボードからノーマルモードの時に自動でペーストモードにしてインデントをしないようにする
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif
"}}}




""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
"{{{
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
"}}}
" vim:set foldmethod=marker:

