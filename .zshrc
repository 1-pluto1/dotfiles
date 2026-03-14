# 1. Powerlevel10k 瞬时提示 (提升终端启动速度)
# 如果你最终决定不用 p10k 主题，可以删除这块 if 逻辑
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 2. Oh My Zsh 路径设置
export ZSH="$HOME/.oh-my-zsh"

# 3. 主题设置
# 注意：如果你保留了上面的第 1 段代码，建议这里设为 "powerlevel10k/powerlevel10k"
# 如果坚持用 "agnoster"，请删除第 1 段代码以避免潜在的显示冲突
ZSH_THEME="powerlevel10k/powerlevel10k"

# 4. 插件配置 (只保留你需要的)
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# 加载 Oh My Zsh
source $ZSH/oh-my-zsh.sh

# 5. FZF 增强搜索 (保留你自定义的预览功能)
export FZF_CTRL_R_OPTS="
  --preview 'tldr \$(echo {} | sed \"s/^[^a-zA-Z]*\([a-zA-Z0-9-]\{1,\}\).*/\1/\") | grep -v \"^$\"'
  --height 80%
  --border"

# 6. 【关键】加载本地私有配置
# 这样你不同设备上的 Conda 或路径差异可以写在 ~/.zshrc.local 里，而不会被 Git 同步
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
