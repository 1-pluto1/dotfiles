#!/bin/bash
# Sync dotfiles to home directory using symlinks.
# Usage: bash sync.sh
# Supports GNU stow-compatible directory structure.

set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log()  { echo -e "${GREEN}[✓]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }

# Backup and symlink a file/directory
link() {
  local src="$1"
  local dst="$2"

  if [ -L "$dst" ]; then
    # Already a symlink
    if [ "$(readlink "$dst")" = "$src" ]; then
      log "already linked: $dst"
      return
    fi
    warn "replacing symlink: $dst"
    rm "$dst"
  elif [ -e "$dst" ]; then
    warn "backing up: $dst → ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi

  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  log "linked: $dst → $src"
}

# --- Home directory dotfiles ---
for dir in zsh tmux git; do
  if [ -d "$DOTFILES/$dir" ]; then
    for file in "$DOTFILES/$dir"/.*; do
      [ -f "$file" ] || continue
      link "$file" "$HOME/$(basename "$file")"
    done
  fi
done

# --- ~/.config/ entries (ghostty, nvim) ---
for dir in ghostty nvim; do
  if [ -d "$DOTFILES/$dir/.config" ]; then
    for cfg in "$DOTFILES/$dir"/.config/*; do
      [ -e "$cfg" ] || continue
      link "$cfg" "$HOME/.config/$(basename "$cfg")"
    done
  fi
done

# --- .zshrc.local check ---
if [ ! -f "$HOME/.zshrc.local" ]; then
  warn "~/.zshrc.local not found"
  echo "  Copy the template and fill in your keys:"
  echo "  cp $DOTFILES/zsh-local/.zshrc.local.example ~/.zshrc.local"
  echo "  vim ~/.zshrc.local"
fi

echo ""
log "All done! Restart your terminal or run: source ~/.zshrc"
