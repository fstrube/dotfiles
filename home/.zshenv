# fixes some bug in ubuntu
export DEBIAN_PREVENT_KEYBOARD_CHANGES=yes

# initialize a $MANPATH variable
export MANPATH=${MANPATH:-}

# force /usr/local/bin and /usr/local/sbin in PATH
[[ "$PATH" != */usr/local/sbin* ]] && export PATH="/usr/local/sbin:$PATH"
[[ "$PATH" != */usr/local/bin* ]] && export PATH="/usr/local/bin:$PATH"

# node npm binaries
if [ -d /usr/local/share/npm/bin ] ; then
  [[ "$PATH" != */usr/local/share/npm/bin* ]] && export PATH="/usr/local/share/npm/bin:$PATH"
fi

### Added by the Heroku Toolbelt
if [ -d /usr/local/heroku/bin ]; then
  [[ "$PATH" != */usr/local/heroku/bin* ]] && export PATH="/usr/local/heroku/bin:$PATH"
fi

### Add composer to PATH
if [ -d $HOME/.composer/vendor/bin ]; then
  [[ "$PATH" != *"$HOME/.composer/vendor/bin"* ]] && export PATH="$HOME/.composer/vendor/bin:$PATH"
fi

# rbenv initialization
if which rbenv > /dev/null 2>&1 ; then
  eval "$(rbenv init -)"
fi

# Sublime Text on OSX
SUBLIME_PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin"
if [ -d "$SUBLIME_PATH" ] ; then
  [[ "$PATH" != *"$SUBLIME_PATH"* ]] && export PATH="$SUBLIME_PATH:$PATH"
fi

# Add users's ~/bin folder to the highest level of the $PATH
if [ -d "$HOME/bin" ] ; then
  [[ "$PATH" != *"$HOME/bin"* ]] && export PATH="$HOME/bin:$PATH"
fi
