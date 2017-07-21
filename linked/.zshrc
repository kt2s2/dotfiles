# Environmental Variables# {{{
export LANG=ja_JP.UTF-8
export EDITOR=/usr/local/bin/vim
export PATH=/usr/local/bin:$PATH
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/.pyenv/bin:$PATH
export PATH=$HOME/Library/Python/2.7/bin:$PATH
if [ -x "`which go`" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME/code/go-local
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi
eval "$(rbenv init - zsh)"
eval "$(pyenv init - zsh)"
# }}}
# Options#{{{
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
setopt nonomatch
setopt prompt_subst
setopt print_eight_bit
setopt pushd_ignore_dups
setopt share_history
setopt nonomatch
# }}}
# Load alias# {{{
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi
# }}}
# Prompt# {{{
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
PROMPT='%(?.%B%F{green}.%B%F{blue})%(?! ! )%f%b'
RPROMPT='`rprompt-git-current-branch`%F{cyan}%~$f %F{white}[%*]%f'
# }}}
