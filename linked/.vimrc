" プラグイン "{{{

set nocompatible
if has('vim_starting')
  "初回起動時飲みruntimepathにneobundleのパスを指定する
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
" Plugin List "{{{
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'Townk/vim-autoclose'
NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'simeji/winresizer'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'thinca/vim-ref'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundleLazy 'gorodinskiy/vim-coloresque', {
      \ 'autoload':{
      \   'filetypes':['css', 'html', 'less', 'sass', 'scss', 'stylus']
      \ }}
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'ConradIrwin/vim-bracketed-paste'
NeoBundle 'kana/vim-operator-user'
" NeoBundle 'Shougo/context_filetype.vim'
" NeoBundle 'osyo-manga/vim-precious'
NeoBundleLazy 'rhysd/vim-clang-format', {
      \ 'autoload':{
      \   'filetypes':['c']
      \ }}
NeoBundle 'fatih/vim-go'
NeoBundleLazy 'vim-ruby/vim-ruby', {
      \ 'autoload':{
      \   'filetypes':['ruby']
      \ }}
NeoBundle 'taichouchou2/vim-rails'
NeoBundle 'romanvbabenko/rails.vim'
NeoBundleLazy 'othree/html5.vim', {
      \ 'autoloat':{
      \   'filetypes':['html']
      \ }}
NeoBundleLazy 'slim-template/vim-slim', {
      \ 'autoload':{
      \   'filetypes':['slim']
      \ }}
NeoBundleLazy 'tpope/vim-haml', {
      \ 'autoload':{
      \   'filetypes':['haml']
      \ }}
NeoBundleLazy 'cakebaker/scss-syntax.vim', {
      \ 'autoload':{
      \   'filetypes':['scss']
      \ }}
NeoBundleLazy 'yaml.vim', {
      \ 'autoload':{
      \   'filetypes':['yaml']
      \ }}
NeoBundleLazy 'pangloss/vim-javascript', {
      \ 'autoload':{
      \   'filetypes':['javascript']
      \ }}
NeoBundleLazy 'mxw/vim-jsx', {
      \ 'autoload':{
      \   'filetypes':['javascript']
      \ }}
NeoBundleLazy 'leafgarland/typescript-vim', {
      \ 'autoload':{
      \   'filetypes':['typescript']
      \ }}
NeoBundle 'Quramy/tsuquyomi'
NeoBundleLazy 'elzr/vim-json', {
      \ 'autoload':{
      \   'filetypes':['json']
      \ }}
NeoBundleLazy 'kchmck/vim-coffee-script', {
      \ 'autoload':{
      \   'filetypes':['coffee']
      \ }}
NeoBundle 'kannokanno/previm'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'cohama/agit.vim'
NeoBundle 'rhysd/committia.vim'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'gregsexton/gitv.git'
call neobundle#end()
"}}}
NeoBundleCheck

" プラグイン毎の設定 "{{{
" CtrlP "{{{
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files -co --exclude-standard']
"}}}
" NeoSnippet "{{{
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
" vim-quickrun "{{{
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
" unite.vim "{{{
call unite#custom_source('file_rec', 'ignore_pattern', 'vendor/\|tmp/\|log/\|node_modules/')
call unite#custom_source('file_rec/async', 'ignore_pattern', 'vendor/\|tmp/\|log/\|node_modules/')
" The prefix key.
nnoremap  [unite] <Nop>
nnoremap  [unite-rails] <Nop>
nmap ,u [unite]
nmap ,ur [unite-rails]
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> [unite]j :<C-u>UniteWithBufferDir autojump<CR>
nnoremap <silent> [unite]t :<C-u>Unite -buffer-name=files buffer file_mru file_rec/async file/new  <CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru <CR>
nnoremap <silent> [unite]g :<C-u>Unite grep<CR>
nnoremap <silent> [unite-rails]a :<C-u>Unite file_rec/async:app/<CR>
nnoremap <silent> [unite-rails]fa :<C-u>Unite file file/new -input=app/ <CR>
nnoremap <silent> [unite-rails]c :<C-u>Unite file_rec/async:app/controllers/<CR>
nnoremap <silent> [unite-rails]fc :<C-u>Unite file file/new -input=app/controllers/ <CR>
nnoremap <silent> [unite-rails]m :<C-u>Unite file_rec/async:app/models/ <CR>
nnoremap <silent> [unite-rails]fm :<C-u>Unite file file/new -input=app/models/ <CR>
nnoremap <silent> [unite-rails]v :<C-u>Unite file_rec/async:app/views/ <CR>
nnoremap <silent> [unite-rails]fv :<C-u>Unite file file/new -input=app/views/ <CR>
nnoremap <silent> [unite-rails]s :<C-u>Unite file_rec/async:app/assets/stylesheets/ <CR>
nnoremap <silent> [unite-rails]fs :<C-u>Unite file file/new -input=app/assets/stylesheets/ <CR>
nnoremap <silent> [unite-rails]j :<C-u>Unite file_rec/async:app/assets/javascripts/ <CR>
nnoremap <silent> [unite-rails]fj :<C-u>Unite file file/new -input=app/assets/javascripts/ <CR>
nnoremap <silent> [unite-rails]o :<C-u>Unite file_rec/async:config/ <CR>
nnoremap <silent> [unite-rails]fo :<C-u>Unite file file/new -input=config/ <CR>
nnoremap <silent> [unite-rails]p :<C-u>Unite file_rec/async:app/javascript/packs/ <CR>
nnoremap <silent> [unite-rails]fp :<C-u>Unite file file/new -input=app/javascript/packs/ <CR>
nnoremap <silent> [unite-rails]l :<C-u>Unite file_rec/async:lib/ <CR>
nnoremap <silent> [unite-rails]fl :<C-u>Unite file file/new -input=lib/ <CR>
nnoremap <silent> [unite-rails]r :<C-u>Unite file_rec/async:spec/ <CR>
nnoremap <silent> [unite-rails]fr :<C-u>Unite file file/new -input=spec/ <CR>
let g:unite_source_file_mru_limit = 100
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
let g:unite_enable_start_insert=1
"}}}
" open-browser.vim "{{{
let g:netrw_nogx=1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
"}}}
" TweetVim "{{{
" let g:tweetvim_display_icon=1
" let g:tweetvim_display_source=1
" let g:tweetvim_include_rts=1
" let g:tweetvim_display_time=1
" nnoremap <silent> tvt :Unite tweetvim<CR>
" nnoremap <silent> tvs :<C-u>TweetVimSay<CR>
" if !exists('g:neocomplcache_dictionary_filetype_lists')
"   let g:neocomplcache_dictionary_filetype_lists={}
" endif
" let neco_dic=g:neocomplcache_dictionary_filetype_lists
" let neco_dic.tweetvim_say=$HOME . '/.tweetvim/screen_name'
"}}}
" emmet "{{{
let g:user_emmet_mode='iv'
let g:user_emmet_leader_key='<C-Y>'
let g:use_emmet_complete_tag=1
let g:user_emmet_settings={
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
  autocmd FileType * let g:user_emmet_settings.indentation='               '[:&tabstop]
augroup END
"}}}
" committia "{{{
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
let g:committia_min_window_width=100  " これ以下の幅では左右分割しない
let g:committia_hooks={}
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
" neocomplete "{{{
let g:acp_enableAtStartup=0
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#sources#syntax#min_keyword_length=3
let g:neocomplete#lock_buffer_name_pattern='\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries={
    \ 'default' : '',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns={}
endif
let g:neocomplete#keyword_patterns['default']='\h\w*'
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns={}
endif
let g:neocomplete#sources#omni#input_patterns.perl='\h\w*->\h\w*\|\h\w*::'
"}}}
" nerdtree "{{{
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let g:NERDTreeShowBookmarks=1
let g:NERDTreeDirArrows=1
nnoremap <S-n>l gt
nnoremap <S-n>h gT
" if !argc()
"   autocmd vimenter * NERDTree|normal gg3j
" endif
"}}}
" winresizer{{{
let g:winresizer_start_key = '<Leader><C-T>'
"}}}
" Clang "{{{
autocmd FileType c ClangFormatAutoEnable
let g:clang_format#style_options={
      \ "Language": "Cpp",
      \ "BasedOnStyle": "LLVM",
      \ "ContinuationIndentWidth": 2,
      \ "ConstructorInitializerIndentWidth": 2,
      \ }
"}}}
" html5.vim "{{{
let g:html5_event_handler_attributes_complete=0
let g:html5_rdfa_attributes_complete=0
let g:html5_microdata_attributes_complete=0
let g:html5_aria_attributes_complete=0
"}}}
" vim-autoclose "{{{
let g:auto_save=1
let g:auto_save_in_insert_mode=0
"}}}
" vim-gitgutter "{{{
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>
"}}}
" vim-jsx "{{{
let g:jsx_ext_required=0
"}}}
" vim-json "{{{
let g:vim_json_syntax_conceal=0
"}}}
" vim-trailing-whitespace "{{{
autocmd BufWritePre * :FixWhitespace
"}}}
" itchyny/lightline.vim "{{{
set laststatus=2
let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction"}}}

"}}}

"}}}

filetype plugin indent on

" 基本設定
set nocompatible                  " vi互換をオフする
set mouse=a                       " マウス操作をできるようにする
set clipboard=unnamed,autoselect  " ヤンクした文字は、システムのクリップボードに入れる
set visualbell t_vb=             " エラービープ音を鳴らさない
set noerrorbells
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

set ambiwidth=double    "文脈によって解釈が異なる全角文字の幅を、２に固定する
set backspace=indent,eol,start "バックスペースにてインデントを削除可能にする
set display=lastline    "長い文字列でも@でなくちゃんと表示する
set display=uhex        "バイナリファイルの非印字可能文字を16進数で表示
set expandtab           "tabを半角スペースで挿入する
set foldmethod=marker
set hidden              "ファイルの保存をしていなくても、別のファイルを開けるようにする
set lazyredraw          " コマンド実行中は再描画しない
set list                "空白文字の可視化
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:% "可視化した空白文字の表示形式について
set matchtime=1         "showmatchによって対象括弧に飛ぶ時間を0.1秒に変更
set nrformats=octal    "0で始まる数値を、8進数として扱わないようにする
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
set wrap                "ウィンドウの幅より長い行は折り返した、次の行に表示する

" 検索設定
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

" Register filetype by file extension
au BufNewFile,BufRead *.html setf html
au BufNewFile,BufRead *.ejs setf html
au BufNewFile,BufRead *.erb setf eruby
au BufNewFile,BufRead *.haml setf haml
au BufNewFile,BufRead *.slim setf slim
au BufNewFile,BufRead *.scss setf scss
au BufNewFile,BufRead *.js setf javascript
au BufNewFile,BufRead *.jsx setf javascript
au BufNewFile,BufRead *.vue setlocal filetype=vue.html.javascript.scss
au BufNewFile,BufRead *.json setf json
au BufNewFile,BufRead *.coffee setf coffee
au BufNewFile,BufRead *.ts setf typescript
au BufNewFile,BufRead *.md setf markdown
au BufNewFile,BufRead *.yml setf yml.yaml
au BufNewFile,BufRead *.php setf php
au BufNewFile,BufRead *.c setf c
au BufNewFile,BufRead *.sh setf sh

" Color Scheme
syntax on
set background=dark
colorscheme solarized
set guifont=RictyNerdFontAOPL-RegularForPowerline:h14

" キーマッピング
let mapleader="\<Space>"
map ,v :<C-u>vsplit<CR>
map ,w :<C-u>split<CR>
inoremap <silent> <C-h> <C-g>u<C-h>
inoremap <silent> <C-d> <Del>
nnoremap <Leader>w :w<CR>
noremap <S-h> ^
noremap <S-l> $

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

"応用カスタマイズ
" 最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
