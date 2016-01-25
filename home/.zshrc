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

# fix path that was broken by /usr/libexec/path_helper on OSX
if [ -x /usr/libexec/path_helper ] ; then
  OLD_PATH="$PATH"
  eval "$(PATH= /usr/libexec/path_helper)"

  export PATH="${OLD_PATH##$PATH:}:$PATH"
fi

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]] ; then
  source ~/.localrc
fi

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Include oh-my-zsh core
source $ZSH/oh-my-zsh.sh

# Any shell scripts in the functions folder become commands (complements of @holman)
autoload -U $ZSH/functions/*(:t)

# iTerm shell integration
if [ -e "$HOME/.iterm2_shell_integration.zsh" ] ; then
  [ x"$TERM_PROGRAM" = xiTerm.app ] && source "$HOME/.iterm2_shell_integration.zsh"
fi

# vi: set syntax=zsh:
