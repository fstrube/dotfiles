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
  source ~/.localrc
fi

# Include oh-my-zsh core
source $ZSH/oh-my-zsh.sh

# Any shell scripts in the functions folder become commands (complements of @holman)
autoload -U $ZSH/functions/*(:t)

# rbenv initialization
if [ -d $HOME/.rbenv/shims ]; then
	eval "$(rbenv init -)"
fi

### Added by the Heroku Toolbelt
if [ -d /usr/local/heroku/bin ]; then
	export PATH="/usr/local/heroku/bin:$PATH"
fi

### Add frak to PATH
if [ -d $HOME/Dropbox/Code/frak/bin ]; then
	export PATH="$HOME/Dropbox/Code/frak/bin:$PATH"
fi

### Add composer to PATH
if [ -d $HOME/.composer/vendor/bin ]; then
	export PATH="$HOME/.composer/vendor/bin:$PATH"
fi


test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
