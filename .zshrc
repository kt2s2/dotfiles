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



########################
# autoload
########################
autoload -Uz colors
autoload -Uz vcs_info
autoload -U compinit
compinit -u


#########################
# エイリアス
#########################
alias -g G='| grep'
alias -g L='| less'
alias -g X='| xargs'
alias -g J='| jq .'
alias -g P='| peco'

alias ls="ls -GF"
alias gls="gls --color"
alias la='ls -la'
alias grep='grep --color --exclude-dir={node_modules,vendor,.git} -in'

function find_cd() {
  cd "$(find . -type d P)"
}
alias fc='find_cd'

alias sp='spring'
alias bsp='bin/spring'
alias be='bundle exec'
alias bi='bundle install --path vendor/bundle --jobs=4'
alias rake='rake'
alias rr='rake routes'
alias rdc='rake db:create'
alias rdm='rake db:migrate'
alias rdmt='rake db:migrate RAILS_ENV=test'
alias rdd='rake db:drop'
alias rds='rake db:seed'
alias rdr='rake db:reset'
alias rdmr='rake db:migrate:reset'
alias rails='rails'
alias rs='rails s'
alias rc='rails c'
alias rspec='rspec'

# カレントブランチ名を表示
function git_current_branch_name() { git rev-parse --abbrev-ref HEAD }
alias -g B='"$(git_current_branch_name)"'

alias g='git'
alias gi='git init'
alias gd='git diff'
alias gst='git status -b'
alias gb='git branch'
alias gbd='git branch -d'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcm='git checkout master'
alias glg='git log --pretty=format:"%C(yellow)%H%Creset %C(green reverse) %an %Creset [%cd] %C(blue)%ar%Creset %s %C(red)%d%Creset" --date=format:"%Y/%m/%d %H:%M:%S" --graph'
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
alias gfm='git pull origin B'
alias gfmr='git pull --rebase origin B'
alias gp='git push origin B'
alias gpom='git push origin master'
alias gphm='git push heroku master'
alias glom='git pull origin master'
alias gf='git fetch --prune'

alias t='tmux'
alias tl='tmux ls'
alias ta='tmux a -t'
alias tre='tmux rename -t'
alias tk='tmux kill-session -t'

alias dk='docker'
alias dkc='docker-compose'

alias phis='percol_insert_history'

alias deleteallswaps='find . -name ".*.sw*"|xargs rm'



fpath=(~/.zsh/completion $fpath)

setopt ignore_eof
setopt interactive_comments
setopt no_beep
setopt no_flow_control
setopt nonomatch
setopt pushd_ignore_dups
setopt nolistbeep

REPORTTIME=3

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
