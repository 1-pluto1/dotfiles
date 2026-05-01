# dotfiles

My dev environment configs. Symlink-based, dead simple.

## Setup

```bash
git clone https://github.com/1-pluto1/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash sync.sh
```

API keys go to `~/.zshrc.local` (not tracked):

```bash
echo 'export APIROUTER_API_KEY="cr_xxx"' > ~/.zshrc.local
```

## What's inside

| File | For |
|---|---|
| `.zshrc` | zsh + starship + zoxide + fzf + eza aliases |
| `.tmux.conf` | tmux with vim-nav, resurrect |
| `.gitconfig` | git + delta diff |
| `.config/ghostty/` | Catppuccin auto theme, Maple Mono NF |
| `.config/nvim/` | LazyVim + tokyonight + image.nvim |
| `Brewfile` | brew bundle for one-shot install |
