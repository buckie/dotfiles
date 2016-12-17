#!/bin/bash
# bash "strict mode" : http://redsymbol.net/articles/unofficial-bash-strict-mode
set -euo pipefail
IFS=$'\n\t'

echo "==> copy dotfiles"
stow --restow --target="$HOME" zsh tmux haskell git spacemacs vim

echo "==> install oh-my-zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then 
  git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" || true
fi

# FIXME: massive hack to restore zshrc
# scm_breeze should be installed manually or (better) nuked completely (since it is a dirty hack)
git checkout ./zsh/.zshrc

