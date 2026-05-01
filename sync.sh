#!/bin/bash
# Symlink dotfiles to home directory.
# Usage: cd ~/dotfiles && bash sync.sh

set -e
DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$1" dst="$2"
  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    mv "$dst" "${dst}.bak"
    echo "[bak] $dst → ${dst}.bak"
  fi
  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "[ok]  $dst"
}

link "$DOTFILES/.zshrc"     "$HOME/.zshrc"
link "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
link "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
link "$DOTFILES/.config/ghostty" "$HOME/.config/ghostty"
link "$DOTFILES/.config/nvim"    "$HOME/.config/nvim"

echo ""
echo "Done! Restart terminal or: source ~/.zshrc"
echo "API keys: create ~/.zshrc.local if not exists"
