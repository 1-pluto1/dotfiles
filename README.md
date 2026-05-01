# dotfiles

My development environment configuration. Managed with a simple symlink script, compatible with [GNU stow](https://www.gnu.org/software/stow/).

## What's included

| Tool | Config | Purpose |
|---|---|---|
| **Ghostty** | `ghostty/.config/ghostty/` | Terminal emulator with Catppuccin auto light/dark theme |
| **Neovim** | `nvim/.config/nvim/` | LazyVim with tokyonight colorscheme, image.nvim, render-markdown, oil, dap |
| **tmux** | `tmux/.tmux.conf` | Terminal multiplexer with vim-style navigation, resurrect/continuum |
| **zsh** | `zsh/.zshrc` | Shell config with starship prompt, zoxide, fzf, eza aliases |
| **git** | `git/.gitconfig` | Git config with delta diff viewer |
| **brew** | `Brewfile` | All Homebrew packages for one-command install |

## Setup on a new machine

```bash
# 1. Install Xcode CLI tools
xcode-select --install

# 2. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 3. Clone this repo
git clone https://github.com/1-pluto1/dotfiles.git ~/Documents/mycode/dotfiles
cd ~/Documents/mycode/dotfiles

# 4. Install all brew packages
brew bundle --file Brewfile

# 5. Symlink config files
bash sync.sh

# 6. Set up API keys (copy from example, fill in your keys)
cp zsh-local/.zshrc.local.example ~/.zshrc.local
vim ~/.zshrc.local

# 7. Restart terminal
```

## Manual stow usage

If you prefer GNU stow for selective linking:

```bash
brew install stow
cd ~/dotfiles
stow zsh        # Only symlink zsh config
stow nvim       # Only symlink neovim config
stow --adopt .  # Adopt all (backs up existing files)
```

## Structure

Each directory mirrors the home directory layout:

```
zsh/.zshrc          → ~/.zshrc
tmux/.tmux.conf     → ~/.tmux.conf
git/.gitconfig      → ~/.gitconfig
ghostty/.config/ghostty/config  → ~/.config/ghostty/config
nvim/.config/nvim/              → ~/.config/nvim/
```
