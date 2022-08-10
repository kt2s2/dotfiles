# === homebrew ===
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# === rbenv ===
brew install rbenv
RUBY_VERSION=`rbenv install -L | awk '/^2\.7\./' | tail -1`
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
rbenv rehash

# === pyenv ===
brew install pyenv

# === nodenv ===
brew install nodenv

# Install node of the latest version
NODE_VERSION=`nodenv install -l | awk '/^18\./' | tail -1`
nodenv install $NODE_VERSION
nodenv global $NODE_VERSION

# === direnv ===
brew install direnv

# === peco ===
brew install peco

# === tmux ===
brew install tmux
brew install reattach-to-user-namespace

# === zsh ===
brew install zsh
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
echo 'source "${ZDOTDIR:-$HOME}/.myzshrc.zsh"' >> "${ZDOTDIR:-$HOME}/.zshrc"
