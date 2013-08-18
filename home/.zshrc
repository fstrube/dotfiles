echo "[$(date)] DEBUG: in ~/.zshrc"
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git)

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]
then
  echo "[$(date)] DEBUG: loading ~/.localrc"
  source ~/.localrc
fi

# Include oh-my-zsh core
echo "[$(date)] DEBUG: loading ~/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Any shell scripts in the functions folder become commands (complements of @holman)
echo "[$(date)] DEBUG: loading ~/.oh-my-zsh/functions"
autoload -U $ZSH/functions/*(:t)
