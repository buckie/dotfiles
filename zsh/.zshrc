#!/bin/zsh
#
#

# Some Utility Functions
checkPath () {
        case ":$PATH:" in
                *":$1:"*) return 1
                        ;;
        esac
        return 0;
}

# Prepend to $PATH
prependToPath () {
        for a; do
                checkPath $a
                if [ $? -eq 0 ]; then
                        PATH=$a:$PATH
                fi
        done
        export PATH
}

# Append to $PATH
appendToPath () {
        for a; do
                checkPath $a
                if [ $? -eq 0 ]; then
                        PATH=$PATH:$a
                fi
        done
        export PATH
}

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

# Userful Aliases ###########################
alias histgrep="history | grep"
alias condaenvs="ll `find $HOME -maxdepth 3 -iregex '.*conda/envs'`"
alias workon="source activate"
alias workoff="source deactivate"
# alias qrepl="rlwrap ~/q/m32/q"
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
prependToPath "usr/local/bin:$PATH"

# add cabal (haskell) bins
prependToPath "$HOME/.cabal/bin:$PATH"

# add useful user scripts
prependToPath "$HOME/code/scripts:$PATH"

# add anaconda path
prependToPath "`find $HOME -maxdepth 3 -iregex '.*conda/bin'`:$PATH"

# add cabal-sandbox path
prependToPath "$HOME/.cabal-sandbox/bin:$PATH"

#############################################

# Platform Specific Stuff ###################
if [[ `uname` == 'Darwin' ]]; then
  # For OSX
  [[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh
fi

if [[ `uname` == 'Linux' ]]; then
  # For all *Nix
  alias pbcopy="xclip -selection clipboard"
  alias pbpaste="xclip -selection clipboard -o"

  if [[ -f "/etc/redhat-release" ]]; then
    # for CentOS & RHEL
    prependToPath "$HOME/vim-prefix/bin"
  else
    # for ubuntu ghc installs
    prependToPath "/opt/local/bin:$PATH"
  fi
fi
#############################################

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path
#############################################

# hack for getting more colours while on gnome-terminal
if [[ "$COLORTERM" == "gnome-terminal" ]]; then
  export TERM=xterm-256color
fi

# clean out the path incase some platform nonesense happend
export PATH="$(echo "$PATH" | sed 's#^:*##;s#::#:#g;s#/:#:#g')"


