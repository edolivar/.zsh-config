# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/bin:$PATH"

# Set name of the theme to load --- if set to "random", it will load a random theme each time oh-my-zsh is loaded.
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster" # Example for a built-in theme
ZSH_THEME="powerlevel10k/powerlevel10k" # If using Powerlevel10k

# Plugins to load (oh-my-zsh comes with these pre-installed).
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-interactive-cd) # Example popular plugins

source $ZSH/oh-my-zsh.sh

# --- Your Customizations Below This Line ---

# Example Aliases:
alias vi='nvim'
alias gs='git stat'
alias ls='lsd -F'
alias la='lsd -AF'
alias ll='lsd -lAF'
alias lg='lsd -F --group-dirs=first"us'
alias gc='git commit -m'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
alias tree="lsd -AF --tree --ignore-glob='**/{node_modules,.next,.git}'"
alias cat="bat --color=always {}"
alias nv='nvim .'
alias gcm='git commit -m'
alias gs='git status'
alias gp='git push'
alias gsa='git add .'
# Example Environment Variables:
export EDITOR="nvim"

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

#CD replacement
eval "$(zoxide init zsh)"
