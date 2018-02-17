"---------------------------------------------------------------------------
" Text:
"



" syntax on
set guifont=RictyNerdFontAOPL-RegularForPowerline:h14

autocmd BufNewFile,BufRead *.html   setfiletype html
autocmd BufNewFile,BufRead *.ejs    setfiletype html
autocmd BufNewFile,BufRead *.erb    setfiletype eruby
autocmd BufNewFile,BufRead *.haml   setfiletype haml
autocmd BufNewFile,BufRead *.slim   setfiletype slim
autocmd BufNewFile,BufRead *.scss   setfiletype scss
autocmd BufNewFile,BufRead *.js     setfiletype javascript
autocmd BufNewFile,BufRead *.jsx    setfiletype javascript
autocmd BufNewFile,BufRead *.es6    setfiletype javascript
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
autocmd BufNewFile,BufRead *.json   setfiletype json
autocmd BufNewFile,BufRead *.coffee setfiletype coffee
autocmd BufNewFile,BufRead *.ts     setfiletype typescript
autocmd BufNewFile,BufRead *.md     setfiletype markdown
autocmd BufNewFile,BufRead *.yml    setfiletype yml.yaml
autocmd BufNewFile,BufRead *.php    setfiletype php
autocmd BufNewFile,BufRead *.c      setfiletype c
autocmd BufNewFile,BufRead *.sh     setfiletype sh

