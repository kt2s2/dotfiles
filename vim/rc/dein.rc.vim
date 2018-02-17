"---------------------------------------------------------------------------
" Dein:
"

let s:dein_dir = '~/.cache/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:rc_dir = '~/.vim/rc'

let &runtimepath = s:dein_repo_dir .",". &runtimepath

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(g:rc_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(g:rc_dir . '/deinlazy.toml', {'lazy' : 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

colorscheme solarized
