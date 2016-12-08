""""""""""""""""""""""""""""""""""""""
" NeoBundle
""""""""""""""""""""""""""""""""""""""

set nocompatible
if has('vim_starting')
  "初回起動時飲みruntimepathにneobundleのパスを指定する
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" === Init Neobundle ===
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'



" === Asynchronous processing to eliminate that vim stopped by performing
" time-consuming process ===
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }



" === Open shell in vim ===
" using) :VimShell
NeoBundle 'Shougo/vimshell.vim'



" === Easy to mark up ===
NeoBundle 'mattn/emmet-vim'



" === Easy to search files from dir or buffer ===
NeoBundle "ctrlpvim/ctrlp.vim"



" === Easy to comment out codes ===
NeoBundle 'tomtom/tcomment_vim'



" === Triming unnecessary whitespaces at the end of the line ===
NeoBundle 'bronson/vim-trailing-whitespace'



" === Show tree of directory ===
NeoBundle 'scrooloose/nerdtree'



" === Power up completion ===
NeoBundle 'marcus/rsense'
NeoBundle 'Shougo/neocomplete.vim'
" NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-endwise'



" === Show dictionary in vim ===
NeoBundle 'thinca/vim-ref'



" === Close parentthese automatically ===
NeoBundle 'Townk/vim-autoclose'



" === Color schemes ===
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'abra/vim-obsidian'
NeoBundle 'flazz/vim-colorschemes'



" === Coloring color code ===
NeoBundle 'gorodinskiy/vim-coloresque', {
      \ 'autoload':{
      \   'filetypes':['css', 'html', 'less', 'sass', 'scss', 'stylus']
      \ }}



" =========================
" Language supports plugins
" =========================



" === Golang supports ===
NeoBundle 'fatih/vim-go'



" === Ruby supports ===
NeoBundleLazy 'vim-ruby/vim-ruby', {
      \ 'autoload':{
      \   'filetypes':['ruby']
      \ }}



" === Rails supports ===
NeoBundle 'taichouchou2/vim-rails'
NeoBundle 'romanvbabenko/rails.vim'



" === Slim supports ===
NeoBundle 'slim-template/vim-slim', {
      \ 'autoload':{
      \   'filetypes':['slim']
      \ }}



" === Haml supports ===
NeoBundle 'tpope/vim-haml', {
      \ 'autoload':{
      \   'filetypes':['haml', 'html']
      \ }}




" === Yaml supports ===
NeoBundle 'yaml.vim', {
      \ 'autoload':{
      \   'filetypes':['yml']
      \ }}



" === Git supports ===
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'cohama/agit.vim'
NeoBundle 'rhysd/committia.vim'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'gregsexton/gitv.git'



call neobundle#end()


"ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

" === Install NeoBundle plugins not yet installed when vim is started ===
NeoBundleCheck


""""""""""""""""""""""""""""""""""""""
" プラグインごとの設定
""""""""""""""""""""""""""""""""""""""

" ctrlp.vimの使い方
" ctrl+p 起動
" ctrl+t 新しいタブで開く
" f5 ファイルの再読み込み



" === emmet ===
"{{{
let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-Y>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
      \ 'lang' : 'ja',
      \ 'html' : {
      \   'filters' : 'html',
      \ },
      \ 'css' : {
      \   'filters' : 'fc',
      \ },
      \ 'php' : {
      \   'extends' : 'html',
      \   'filters' : 'html',
      \ },
      \}
augroup EmmitVim
  autocmd!
  autocmd FileType * let g:user_emmet_settings.indentation = '               '[:&tabstop]
augroup END
"}}}



" === committia ===
" You can get the information about the windows with first argument as a dictionary."{{{
"
"   KEY              VALUE                      AVAILABILITY
"-----------------------------------------------------------------------------------
"   vcs            : vcs type (e.g. 'git')   -> all hooks
"   edit_winnr     : winnr of edit window    -> ditto
"   edit_bufnr     : bufnr of edit window    -> ditto
"   diff_winnr     : winnr of diff window    -> ditto
"   diff_bufnr     : bufnr of diff window    -> ditto
"   status_winnr   : winnr of status window  -> all hooks except for 'diff_open' hook
"   status_bufnr   : bufnr of status window  -> ditto
let g:committia_min_window_width = 100  " これ以下の幅では左右分割しない
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell

    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    end

    " Scroll the diff window from insert mode
    " Map <C-n> and <C-p>
    imap <buffer><C-j> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-k> <Plug>(committia-scroll-diff-up-half)

endfunction
"}}}



" === neocomplete ===
"{{{
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}}}



" === neocomplete-rsense ===
"{{{
" let g:rsenseUseOmniFunc = 1
" " .や::を入力したときにオムニ補完が有効になるようにする
" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"
" " 環境変数RSENSE_HOMEに'/usr/local/bin/rsense'を指定しても動く
" let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'
"}}}



" === nerdtree ===
"{{{
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" show bookmark from the beginning
let g:NERDTreeShowBookmarks=1

" ファイル指定で開かれた場合はNERDTreeは表示しない
if !argc()
  autocmd vimenter * NERDTree|normal gg3j
endif
"}}}



" === grep検索 ===
" {{{
" 検索後自動でquickfix windowを開く
autocmd QuickFixCmdPost *grep* cwindow
nnoremap P :cprevious<CR>
nnoremap N :cnext<CR>
nnoremap F :<C-u>cfirst<CR>
nnoremap L :<C-u>clast<CR>"}}}



" === vim-autoclose ===
"{{{
let g:auto_save = 1                     " デフォルトで有効にする
let g:auto_save_in_insert_mode = 0      " インサートモード時は保存しない
"}}}



" === vim-gitgutter ===
"{{{
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>
"}}}



" === vim-trailing-whitespace ===
"{{{
" Execute :FixWhitespace command before writing file to buffer
autocmd BufWritePre * :FixWhitespace
"}}}




""""""""""""""""""""""""""""""""""""""
" Register filetype
""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.haml setf haml




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




"http://io-fia.blogspot.jp/2012/11/vimvimrc.html
""""""""""""""""""""""""""""""
" 入力補完を自動化
""""""""""""""""""""""""""""""
"{{{
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfor
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
colorscheme hybrid
set background=dark

"コードの色分け
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

inoremap <silent> jj <ESC>

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
