export LANG=ja_JP.UTF-8


RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color


case $OSTYPE in
  darwin*)
    export HOMEBREW_CASK_OPTS='--appdir=/Applications'
    ;;
  linux*)
esac

########################
# PATH
########################

export EDITOR=/usr/local/bin/vim
export BUNDLER_EDITOR=code


export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/opt/v8@3.15/bin:$PATH
export PATH=/usr/local/opt/openssl/bin:$PATH
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export XDG_CONFIG_HOME=$HOME/.config


# === Setup nodenv ===
eval "$(nodenv init - zsh)"
export PATH="$HOME/.nodenv/bin:$PATH"


# === Setup rbenv ===
eval "$(rbenv init - zsh)"
export PATH="$HOME/.rbenv/bin:$PATH"


# === Setup pyenv ===
eval "$(pyenv init - zsh)"
export PATH="$HOME/.pyenv/bin:$PATH"


# === Setup goenv ===
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init - zsh)"
export GOENV_DISABLE_GOPATH=1
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$GOROOT/bin:$PATH"

# === mysql@5.7 ===
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"


# === setup nvm
# if command_exists nvm; then
#   export NVM_DIR="$HOME/.nvm"
#   if [ ! -d $NVM_DIR ]; then
#     mkdir $NVM_DIR
#   fi
#   [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# fi


# Ctrl Aとかが効かなくなっていた問題の解決
bindkey -e


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
alias gbd='git branch -D'
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
alias gfm='gf && git merge origin/$(git_current_branch_name)'
alias gfmr='gf && grb origin/$(git_current_branch_name)'
alias gp='git push origin B'
alias gf='git fetch --prune'

alias grb='git rebase'
alias grbc='grb --continue'
alias grba='grb --abort'
alias grbs='grb --skip'

alias gchp='git cherry-pick'
alias gchpc='gchp --continue'
alias gchpa='gchp --abort'
alias gchps='gchp --skip'

alias hb='hub browse'

alias t='tmux'
alias tl='tmux ls'
alias ta='tmux a -t'
alias tre='tmux rename -t'
alias tk='tmux kill-session -t'

alias dk='docker'
alias dkc='docker compose'
alias dkcrn='docker compose run --rm'
alias dkcec='docker compose exec'
alias dkcrs='docker compose restart'

alias phis='percol_insert_history'

alias deleteallswaps='find . -name ".*.sw*"|xargs rm'

alias vs='code'
alias vsb='(){ code `bundle info --path $1` }'
alias vsab='(){ code -a `bundle info --path $1` }'


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

#################
# direnv
#################
eval "$(direnv hook zsh)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
