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


" === Quick run ===
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'osyo-manga/shabadou.vim'


" === Check syntax ===
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pmsorhaindo/syntastic-local-eslint.vim'



" === Twitter ===
NeoBundle 'open-browser.vim'
NeoBundle 'basyura/TweetVim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'basyura/bitly.vim'


" === Easy to mark up ===
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'Townk/vim-autoclose'



" === Easy to search files from dir or buffer ===
NeoBundle "ctrlpvim/ctrlp.vim"


" === Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neoyank.vim'


" === Easy to comment out codes ===
NeoBundle 'tomtom/tcomment_vim'



" === Triming unnecessary whitespaces at the end of the line ===
NeoBundle 'bronson/vim-trailing-whitespace'



" === Show tree of directory ===
NeoBundle 'scrooloose/nerdtree'



" === Power up completion ===
" NeoBundle 'marcus/rsense'
" NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'



" === Show dictionary in vim ===
NeoBundle 'thinca/vim-ref'



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



" === Show status line in vim ===
NeoBundle 'itchyny/lightline.vim'



" === auto paste mode in vim ===
NeoBundle 'ConradIrwin/vim-bracketed-paste'


" =========================
" Language supports plugins
" =========================


" == Clang supports ==
NeoBundle 'kana/vim-operator-user'
NeoBundle 'rhysd/vim-clang-format'


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



" === HTML supports ===
NeoBundle 'othree/html5.vim', {
      \ 'autoloat':{
      \   'filetypes':['html']
      \ }}



" === Slim supports ===
NeoBundle 'slim-template/vim-slim', {
      \ 'autoload':{
      \   'filetypes':['slim']
      \ }}



" === Haml supports ===
NeoBundle 'tpope/vim-haml', {
      \ 'autoload':{
      \   'filetypes':['haml']
      \ }}



" === Scss supports ===
NeoBundle 'cakebaker/scss-syntax.vim', {
      \ 'autoload':{
      \   'filetypes':['scss']
      \ }}



" === Yaml supports ===
NeoBundle 'yaml.vim', {
      \ 'autoload':{
      \   'filetypes':['yml']
      \ }}



" === Javascript supports ===
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'


" === typescript / angular2 ===
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'Quramy/tsuquyomi'


" === Json supports ===
NeoBundle 'elzr/vim-json'



" === Coffeescript supports ===
NeoBundle 'kchmck/vim-coffee-script', {
      \ 'autoload':{
      \   'filetypes':['coffee']
      \ }}



" === Markdown supports ===
NeoBundle 'kannokanno/previm'



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

" ctrlpvim
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" neosnippet
"{{{
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has('conceal')
 set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/snippets/'
"}}}


" === vim-quickrun ===
"{{{
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config._={
      \       'runner' : 'vimproc',
      \       'runner/vimproc/updatetime' : 10,
      \       'outputter/buffer/close_on_empty' : 1,
      \       'hook/shabadoubi_touch_henshin/enable' : 1,
      \       'hook/shabadoubi_touch_henshin/wait' : 20,
      \ }
set splitbelow
"}}}


" === Unit.vim ===
"{{{
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_source_history_yank_enable = 1
nmap <Space> [unite]
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]t :<C-u>Unite<Space>tab<CR>
nnoremap <silent> [unite]o :<C-u>Unite<Space>outline<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer file_mru<CR>
nnoremap <silent> [unite]d :<C-u>Unite<Space>directory_mru<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"}}}


" === syntastic ===
"{{{
" ref. https://github.com/scrooloose/syntastic#settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs = 1 " show sign in the line having errors
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_html_tidy_exec = 'tidy5'
" -- for PHP syntastic  -----------------------
let g:syntastic_mode_map = {
  \ 'mode': 'active',
  \ 'active_filetypes': ['php']
  \}
let g:syntastic_auto_loc_list = 1
let g:syntastic_php_checkers = ['phpcs']
let g:syntastic_php_phpcs_args='--standard=psr2'
"}}}


" === open-browser.vim ===
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" === TweetVim ===
let g:tweetvim_display_icon = 1
let g:tweetvim_display_source = 1
let g:tweetvim_include_rts    = 1
let g:tweetvim_display_time   = 1
" タイムライン選択用の Unite を起動する
nnoremap <silent> tvt :Unite tweetvim<CR>
" 発言用バッファを表示する
nnoremap <silent> tvs :<C-u>TweetVimSay<CR>
" スクリーン名のキャッシュを利用して、neocomplcache で補完する
if !exists('g:neocomplcache_dictionary_filetype_lists')
  let g:neocomplcache_dictionary_filetype_lists = {}
endif
let neco_dic = g:neocomplcache_dictionary_filetype_lists
let neco_dic.tweetvim_say = $HOME . '/.tweetvim/screen_name'


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
"{{{
" You can get the information about the windows with first argument as a dictionary.
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



" === vimshell ===
"{{{
let g:vimshell = 'mvim'
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '
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
" if !argc()
"   autocmd vimenter * NERDTree|normal gg3j
" endif
nnoremap <S-n>l gt
nnoremap <S-n>h gT
"}}}




" === grep検索 ===
"{{{
" @example
" :vim {pattern} %
" :vim {pattern} **
" :vim {pattern} app/views/**
" :vim {pattern} app/views/users/*
" :vim {pattern} app/views/**/*.erb
" :vim {pattern} app/views/**/_*.erb

" 検索後自動でquickfix windowを開く
autocmd QuickFixCmdPost *grep* cwindow
nnoremap <C-k> :cprevious<CR>
nnoremap <C-j> :cnext<CR>
"}}}




" === C ===
"{{{
autocmd FileType c ClangFormatAutoEnable
" ref: http://algo13.net/clang/clang-format-style-oputions.html
" ref: http://yasuharu519.hatenablog.com/entry/2015/12/13/210825
let g:clang_format#style_options = {
      \ "Language": "Cpp",
      \ "BasedOnStyle": "LLVM",
      \ "ContinuationIndentWidth": 2,
      \ "ConstructorInitializerIndentWidth": 2,
      \ }
       "AlignConsecutiveAssignments": "false",
       "AlignConsecutiveDeclarations": "false",
       "AlignTrailingComments": "true",
       "AllowShortBlocksOnASingleLine": "false",
       "AllowShortCaseLabelsOnASingleLine": "false",
       "AllowShortIfStatementsOnASingleLine": "true",
       "BinPackParameters": "false",
       "BinPackArguments": "false",
       "BreakBeforeBinaryOperators": "None",
       "DerivePointerAlignment": "false",
       "IndentWidth": 2,
       "IndentCaseLabels": "true",
       "KeepEmptyLinesAtTheStartOfBlocks": "true",
       "PointerAlignment": "Right",
       "SpacesBeforeTrailingComments": 1,

"}}}



" === html5.vim ===
"{{{
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0
"}}}





" === lightline ===
"{{{
set laststatus=2
"}}}



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



" === vim-jsx ===
let g:jsx_ext_required = 0



" === vim-json ===
let g:vim_json_syntax_conceal = 0



" === vim-trailing-whitespace ===
"{{{
" Execute :FixWhitespace command before writing file to buffer
autocmd BufWritePre * :FixWhitespace
"}}}



""""""""""""""""""""""""""""""""""""""
" Register filetype or syntax
""""""""""""""""""""""""""""""""""""""
"{{{
au BufNewFile,BufRead *.html setf html
au BufNewFile,BufRead *.ejs setf html
au BufNewFile,BufRead *.erb setf eruby.html
au BufNewFile,BufRead *.haml setf haml
au BufNewFile,BufRead *.slim setf slim
au BufNewFile,BufRead *.scss setf scss
au BufNewFile,BufRead *.js setf javascript
au BufNewFile,BufRead *.jsx setf javascript
au BufNewFile,BufRead *.json setf json
au BufNewFile,BufRead *.coffee setf coffee
au BufNewFile,BufRead *.ts setf typescript
au BufNewFile,BufRead *.md setf markdown
au BufNewFile,BufRead *.yml setf yaml
au BufNewFile,BufRead *.php setf php
au BufNewFile,BufRead *.sh setf sh
"}}}





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
" convert tab to 2 spaces with saving
" autocmd BufWritePre * :%s/\t/  /ge
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
" Hybrid
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
" let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.

" colorscheme spacegray

set background=dark
set cursorline
hi clear CursorLine

"コードの色分け
syntax enable

" 色の変更
hi Comment ctermfg=0
hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
hi PmenuSel ctermbg=blue ctermfg=black
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
hi PmenuSbar ctermbg=0 ctermfg=9
hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF
"}}}




""""""""""""""""""""""""""""""""""""""
" マッピング
""""""""""""""""""""""""""""""""""""""
"{{{
let mapleader = "\<Space>"

inoremap <silent> jk <ESC>
nnoremap <Leader>w :w<CR>
noremap <S-h> ^
noremap <S-l> $
"カーソル前の文字削除
inoremap <silent> <C-h> <C-g>u<C-h>
"カーソル後の文字削除
inoremap <silent> <C-d> <Del>
map ,v :<C-u>vsplit<CR>
map ,w :<C-u>split<CR>

" === vimshell ===
nnoremap ,vv  :<C-u>VimShellPop<CR>

" === ctags ===
map <Leader>rt :!ctags -R .<CR><CR>
map tt <C-]>
map tn <C-w>]
map tg g<C-]>
map <C-p> :tprevious<CR>
map <C-n> :tnext<CR>

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
" Ctrl-Hに割り当て
inoremap <silent> <C-h> <C-R>=DeleteParenthesesAdjoin()<CR>
"}}}




""""""""""""""""""""""""""""""""""""""
" その他
""""""""""""""""""""""""""""""""""""""
"{{{
set backupdir=$HOME/.vim/backup     " バックアップファイルのディレクトリを指定する
set nocompatible                  " vi互換をオフする
set directory=$HOME/.vim/backup     " スワップファイル用のディレクトリを指定する
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



function! s:SearchKeywordInStackOverFlow(...)
  let keyword = a:1
  let results = 10
  if a:0 >= 1
    10new
    let i = 0
    while i < results
      call append(0, "arg: " . keyword)
      let i += 1
    endwhile
  else
    echo "No keywords."
  end
endfunction
command! -nargs=? SearchInStackOverFlow call s:SearchKeywordInStackOverFlow(<f-args>)
