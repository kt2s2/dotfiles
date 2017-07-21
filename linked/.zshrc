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
# Shell Settings#{{{
setopt auto_cd
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt auto_pushd
setopt extended_glob
setopt ignore_eof
setopt interactive_comments
setopt magic_equal_subst
setopt mark_dirs
setopt no_beep
setopt no_flow_control
setopt nonomatch
setopt print_eight_bit
setopt pushd_ignore_dups
setopt share_history
setopt nonomatch
# History# {{{
HISTFILE=${HOME}/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt share_history
# }}}
# Prompt# {{{
autoload -Uz colors
colors
setopt prompt_subst
# ForeGround: %{$fg[code]%}
# BackGround: %{$bg[code]%}
# Reset: %{$reset_color%}
# Codes: {
# 0: black,
# 1: red,
# 2: green,
# 3: yellow,
# 4: blue,
# 5: magenta,
# 6: cyan,
# 7: white
# }
exit_code='%?'

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# zstyle ':vcs_info:*' max-exports 6 # formatに入る変数の最大数
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '%b' '%c' '%u'
zstyle ':vcs_info:git:*' actionformats '%b|%a' '%c' '%u'
function vcs_echo {
    local st branch color
    STY= LANG=en_US.UTF-8 vcs_info
    st=`git status 2> /dev/null`
    if [[ -z "$st" ]]; then return; fi
    branch="$vcs_info_msg_0_"
    if   [[ -n "$vcs_info_msg_1_" ]]; then color=${fg[green]} #staged
    elif [[ -n "$vcs_info_msg_2_" ]]; then color=${fg[red]} #unstaged
    elif [[ -n `echo "$st" | grep "^Untracked"` ]]; then color=${fg[blue]} # untracked
    else color=${fg[cyan]}
    fi
    echo "[%{$color%}%{$branch%}%{$reset_color%}]"
}

precmd () { vcs_info }
PROMPT="(%(?!%{$fg[green]%}!%{$fg[red]%})$exit_code%{$reset_color%}) %% "
RPROMPT="( %{$fg[magenta]%}%~%{$reset_color%} )Oo."
# }}}
# }}}
# Load alias# {{{
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi
# }}}
