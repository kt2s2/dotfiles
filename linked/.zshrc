######## 環境設定
# PATHの設定
export PATH=/usr/local/bin:$PATH
setopt nonomatch

# Nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# rubyコメンドパス設定
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"

# Elastic Beanstalk
export PATH=$HOME/Library/Python/2.7/bin:$PATH

# php
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
# export PATH=$HOME/.phpenv/bin:$PATH
# eval "$(phpenv init - zsh)"

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

# docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/saino/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1


# Vi ライクな操作を有効にする
bindkey -v

# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

# エディタの設定
export EDITOR=/usr/local/bin/vim


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

# alias
if [ `-f ~/.aliases` ]; then
  . ~/.aliases
fi
