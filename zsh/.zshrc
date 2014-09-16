# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias v="$EDITOR"

# RC/Config files ###########################
alias zshrc="$EDITOR $HOME/.zshrc"
alias tmuxconf="$EDITOR $HOME/.tmux.conf"
alias vimrc="$EDITOR $HOME/.vimrc"
alias vplugs="$EDITOR $HOME/.vimrc.plugs"
#############################################

# ORG stuff #################################
export ORGPATH="$HOME/org"

alias org="cd $ORGPATH && vim ."

export TODO_TXT_PATH="$ORGPATH/todo/todo.txt"
export DONE_TXT_PATH="$ORGPATH/todo/done.txt"
alias te="$EDITOR $TODO_TXT_PATH"
#############################################

# restore some shortcuts in vi-mode
bindkey '^R' history-incremental-search-backward

#### THE PATH #################################################################
# golang stuff
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# add cabal (haskell) bins
export PATH=$HOME/.cabal/bin:$PATH

# add useful user scripts
export PATH=$PATH:$HOME/code/scripts
###############################################################################

# initialize scm breeze
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# hack for getting more colours while on gnome-terminal
if [[ "$COLORTERM" == "gnome-terminal" ]]; then
  export TERM=xterm-256color
fi

