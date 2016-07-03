######## 環境設定
# PATHの設定
export PATH=/usr/local/bin:$PATH
setopt nonomatch

# Nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# rubyコメンドパス設定
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"

# pythonコマンドパス設定
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init - zsh)"

# go
if [ -x "`which go`" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME/code/go-local
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# Vi ライクな操作を有効にする
bindkey -v

# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors



####### プロンプト
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats '[%F{green}%b%f]'
zstyle ':vcs_info:*' actionformats '[%F{green}%b%f(%F{red}%a%f)]'
precmd() { vcs_info }
function rprompt-git-current-branch {
  local name st color

  if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
      return
  fi
  #name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  name=`git symbolic-ref HEAD 2>/dev/null | sed -E 's!refs/heads/!!'`

  if [[ -z $name ]]; then
      return
  fi

  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
      color=${fg[green]}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
      color=${fg[yellow]}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
      color=${fg_bold[red]}
  else
      color=${fg[red]}
  fi

  echo "%{$color%}$name%{$reset_color%} "
}
PROMPT='%(?.%B%F{green}.%B%F{blue})%(?!U^ｪ^U ﾜﾝ < !UTｪTU ｸｩﾝ < )%f%b'
RPROMPT='`rprompt-git-current-branch`%F{cyan}%~$f %F{white}[%*]%f'


####### コマンド入力補完
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# lsコマンド
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias ls="ls -GF"
alias gls="gls --color"
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'



####### オプション
setopt auto_cd
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt auto_pushd
setopt extended_glob
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt ignore_eof
setopt interactive_comments
setopt magic_equal_subst
setopt mark_dirs
setopt no_beep
setopt no_flow_control
setopt prompt_subst
setopt print_eight_bit
setopt pushd_ignore_dups
setopt share_history

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt HIST_IGNORE_SPACE
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt APPEND_HISTORY

####### エイリアス

alias -g G='| grep'
alias -g L='| less'
alias -g X='| xargs'

alias be='bundle exec'
alias rake='bundle exec rake'
alias rails='bundle exec rails'
alias rspec='bundle exec rspec'
alias be='bundle exec'
alias bi='bundle install --path vendor/bundle --jobs=4'
alias rdc='rake db:create'
alias rdm='rake db:migrate'
alias rdd='rake db:drop'
alias rds='rake db:seed'
alias rdr='rake db:reset'
alias rdmr='rake db:migrate:reset'
alias rr='spring rake routes'
alias rs='rails s'
alias rs4='rails s -p 4000'
alias rs5='rails s -p 5000'
alias rc='rails c'


# カレントブランチ名を表示
function git_current_branch_name()
{
  git branch | grep '^\*' | sed 's/^\* *//'
}
alias -g B='"$(git_current_branch_name)"'


alias gi='git init'
alias gd='git diff'
alias gst='git status -b'
alias gb='git branch'
alias gbd='git branch -d'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcm='git checkout master'
alias glg='git log --graph --name-status'
alias gsta='git stash'
alias gstal='git stash list'
alias rgsta='git stash apply'
alias gr='git reset HEAD'
alias grhch='git reset --hard HEAD^'
alias grhih='git reset --hard HEAD'
alias grsch='git reset --soft HEAD^'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gcmsg='git commit -m'
alias gcam='git commit --amend'
alias gl='git pull origin B'
alias gp='git push origin B'
alias gpom='git push origin master'
alias gphm='git push heroku master'
alias glom='git pull origin master'
fpath=(~/.zsh/completion $fpath)

autoload -U compinit
compinit -u

alias t='tmux'
alias tl='tmux ls'
alias ta='tmux a -t'
alias tr='tmux rename -t'
alias tk='tmux kill-session -t'

alias rm='rmtrash'

alias phis='percol_insert_history'

####### percol
#
# {{{
# cd 履歴を記録
typeset -U chpwd_functions
CD_HISTORY_FILE=${HOME}/.cd_history_file # cd 履歴の記録先ファイル
function chpwd_record_history() {
    echo $PWD >> ${CD_HISTORY_FILE}
}
chpwd_functions=($chpwd_functions chpwd_record_history)

# percol を使って cd 履歴の中からディレクトリを選択
# 過去の訪問回数が多いほど選択候補の上に来る
function percol_get_destination_from_history() {
    sort ${CD_HISTORY_FILE} | uniq -c | sort -r | \
        sed -e 's/^[ ]*[0-9]*[ ]*//' | \
        sed -e s"/^${HOME//\//\\/}/~/" | \
        percol | xargs echo
}

# percol を使って cd 履歴の中からディレクトリを選択し cd するウィジェット
function percol_cd_history() {
    local destination=$(percol_get_destination_from_history)
    [ -n $destination ] && cd ${destination/#\~/${HOME}}
    zle reset-prompt
}
zle -N percol_cd_history

# percol を使って cd 履歴の中からディレクトリを選択し，現在のカーソル位置に挿入するウィジェット
function percol_insert_history() {
    local destination=$(percol_get_destination_from_history)
    if [ $? -eq 0 ]; then
        local new_left="${LBUFFER} ${destination} "
        BUFFER=${new_left}${RBUFFER}
        CURSOR=${#new_left}
    fi
    zle reset-prompt
}
zle -N percol_insert_history
# }}}

# C-x ; でディレクトリに cd
# C-x i でディレクトリを挿入
bindkey '^x;' percol_cd_history
bindkey '^xi' percol_insert_history
