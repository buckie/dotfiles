#!/bin/bash
# bash "strict mode" : http://redsymbol.net/articles/unofficial-bash-strict-mode
set -euo pipefail
IFS=$'\n\t'

echo "==> copy dotfiles"
stow --restow --target="$HOME" vim zsh tmux haskell git

echo "==> install oh-my-zsh"
git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" || true

echo "==> install vim-plug and plugins"
rm -rf ~/.vim/plugged/
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -u "$HOME/.vimrc.plugs" +PlugInstall +qall!

# FIXME: massive hack to restore zshrc
# scm_breeze should be installed manually or (better) nuked completely (since it is a dirty hack)
git checkout ./zsh/.zshrc

