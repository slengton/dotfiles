# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Don't add to history if command preceeded with a space
HISTCONTROL="ignorespace"

# specify plugins to load
plugins=(git fasd history tmux)

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# setup preferred editor
export VISUAL=nvim
export EDITOR="$VISUAL"
alias vim="nvim"
alias vi="nvim"

fpath=(/usr/local/share/zsh-completions $fpath)

# zsh syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# talisman
export TALISMAN_HOME=/Users/stefanlengton/.talisman/bin
alias talisman=/Users/stefanlengton/.talisman/bin/talisman_darwin_amd64

# aliases
alias dc="docker-compose"

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
