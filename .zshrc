# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias gc='git commit -m'

# Example Environment Variables:
# export EDITOR="nano"

# Powerlevel10k configuration (if using it)
# The actual p10k config is usually in ~/.p10k.zsh
# You'll link that separately or source it if it's in this folder.
if [[ -f ~/.p10k.zsh ]]; then
  source ~/.p10k.zsh
fi

# Example Custom Function:
# myfunction() {
#   echo "Hello from my custom function!"
# }

alias nv='nvim .'
