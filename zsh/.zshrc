#!/bin/zsh

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="robbyrussell"

export COMPLETION_WAITING_DOTS="true"

export EDITOR='vim'
alias v='$EDITOR'

# RC/Config files ###########################
alias zshrc='$EDITOR $HOME/.zshrc'
alias tmuxconf='$EDITOR $HOME/.tmux.conf'
alias vimrc='$EDITOR $HOME/.vimrc'
#############################################

# Platform Specific Stuff ###################

if [[ `uname` != 'Darwin' ]]; then
  alias pbcopy="xclip -selection clipboard"
  alias pbpaste="xclip -selection clipboard -o"

  # for ubuntu ghc installs
  export PATH="/opt/local/bin:$PATH"
fi
#############################################

# Userful Aliases ###########################
alias histgrep="history | grep"
alias condaenvs="ll ~/anaconda/envs"
alias workon="source activate"
alias workoff="source deactivate"
alias qrepl="rlwrap ~/q/m32/q"
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
#############################################

# Haskell Aliases ###########################
alias ghc-sandbox="ghc -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
alias ghci-sandbox="ghci -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
alias runhaskell-sandbox="runhaskell -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
#############################################

# plugins can be found in ~/.oh-my-zsh/plugins/
plugins=(autojump pacman rbenv lein vi-mode colored-man)

source "$ZSH/oh-my-zsh.sh"

# restore some shortcuts in vi-mode
bindkey '^R' history-incremental-search-backward

#### THE PATH ###############################
export PATH=/usr/local/bin:$PATH

# add cabal (haskell) bins
export PATH=$HOME/.cabal/bin:$PATH

# add useful user scripts
export PATH=$HOME/code/scripts:$PATH

# add anaconda path
export PATH="`find $HOME -maxdepth 3 -iregex '.*conda/bin'`:$PATH"

# add cabal-sandbox path
export PATH="$HOME/.cabal-sandbox/bin:$PATH"

#[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path
#############################################

# hack for getting more colours while on gnome-terminal
if [[ "$COLORTERM" == "gnome-terminal" ]]; then
  export TERM=xterm-256color
fi

