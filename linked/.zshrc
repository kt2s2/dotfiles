export LANG=ja_JP.UTF-8
export HOMEBREW_CASK_OPTS='--appdir=/Applications'
export EDITOR=/usr/local/bin/vim



export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/opt/openssl/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"
export PATH=$HOME/.pyenv/bin:$PATH
eval "$(pyenv init - zsh)"



setopt ignore_eof
setopt interactive_comments
setopt no_beep
setopt no_flow_control
setopt nonomatch
setopt pushd_ignore_dups
setopt nolistbeep

REPORTTIME=3

autoload -U compinit && compinit
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
setopt auto_param_slash
setopt mark_dirs
setopt list_types
setopt auto_menu
setopt auto_param_keys
setopt magic_equal_subst
setopt complete_in_word
setopt always_last_prompt
setopt print_eight_bit
setopt extended_glob
setopt globdots
setopt brace_ccl
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# zsh-completions
[ -d $HOME/.zsh/zsh-completions/src ] && fpath=($HOME/.zsh/zsh-completions/src $fpath)


setopt auto_cd
function chpwd() { ls }

# autoload predict-on
# predict-on

##################
# ^Rをpecoでhistory検索
##################
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
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

##################
# プロンプト
##################
autoload -Uz colors
autoload -Uz vcs_info
setopt prompt_subst
zstyle ":vcs_info:*" enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:git:*' formats "(%F{magenta}%b%f%F{green}%c%u%f)"
zstyle ':vcs_info:git:*' actionformats "[%b|%a]"
precmd(){ vcs_info }
exit_code='%?'
PROMPT='(%(?!%{$fg[green]%}!%{$fg[red]%})${exit_code}%{$reset_color%}) %% '
RPROMPT='%K${memotxt}%k ${vcs_info_msg_0_} ( %{$fg[magenta]%}%~%{$reset_color%} )Oo.'

##################
# autojump
##################
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
eval "$(direnv hook zsh)"
