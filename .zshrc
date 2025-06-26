# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:$HOME/.pnpm-global/bin"

# Set name of the theme to load --- if set to "random", it will load a random theme each time oh-my-zsh is loaded.
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster" # Example for a built-in theme
ZSH_THEME="powerlevel10k/powerlevel10k" # If using Powerlevel10k

# Plugins to load (oh-my-zsh comes with these pre-installed).
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-interactive-cd) # Example popular plugins

source $ZSH/oh-my-zsh.sh

# --- Your Customizations Below This Line ---

# Termial/Editor AlIAS 
alias vi='nvim'
alias nv='nvim .'
alias ivs='code $(fzf -m --preview="bat --color=always {}")'
alias cat="bat --color=always {}"
alias cd='z'
alias cdi='zi'
alias c='clear'
alias vs='code .'
#LIST CMD ALIAS
alias ls='lsd -F'
alias la='lsd -AF'
alias ll='lsd -lAF'
alias lg='lsd -F --group-dirs=first'
alias tree="lsd -AF --tree --ignore-glob='**/{node_modules,.next,.git}'"
#GIT ALIAS
alias gs='git status'
alias gcm='git commit -m'
alias gs='git status'
alias gp='git push'
alias gpp='git pull'
alias gsa='git add .'
#FZF
alias view='fzf'
#PNPM ALIAS
# alias pdev="pnpm dev"
alias pinst='pnpm i'
alias pstudio='pnpm db:studio'
alias padd='pnpm add'
alias prun='pnpm run dev'

pdev() {
    local opened=false
    pnpm run dev 2>&1 | while IFS= read -r line; do
        echo "$line"
        if [[ "$opened" == false && "$line" == *"Local:"* && "$line" == *"localhost"* ]]; then
            # Extract URL using parameter expansion
            local url=$(echo "$line" | grep -o 'http://localhost:[0-9]*')
            if [[ -n "$url" ]]; then
                echo "Opening $url"
                open "$url"
                opened=true
            fi
        fi
    done
}

#EDITOR
export EDITOR="code --wait"

# Powerlevel10k configuration (if using it)
# The actual p10k config is usually in ~/.p10k.zsh
# You'll link that separately or source it if it's in this folder.

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source <(fzf --zsh)

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory
setopt histignoredups
setopt incappendhistory

# fzf command history search with only 5 visible lines at a time
fh() {
  BUFFER=$(history -n 1 | fzf --height=6 --layout=reverse --info=inline --tac)
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N fh
bindkey '^R' fh

#FZF THEME
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#d0d0d0,fg+:#d0d0d0,bg:#000000,bg+:#262626
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00
  --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
  --color=border:#262626,label:#aeaeae,query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt=">"
  --marker=">" --pointer="*" --separator="_" --scrollbar="│"
  --layout="reverse" --info="right"
  --preview="bat --color=always --line-range=:500 {}"' # <--- This is the key line
eval "$(zoxide init zsh)"

