#!/bin/bash
# install dependencies, rbenv, runs rake
#
# Version: 0.2-beta
# Author: Franklin Strube <franklin.strube@gmail.com>
#
# Changelog:
#
# Version 0.2-beta
# * Added dependency for zlib development (gems)
# * Fixed errors with rbenv paths
#
# Version 0.1-beta
# * Initial version
# * Install dependencies, rbenv, ruby, gems, execute rake

DEFAULT_RUBY_VERSION='1.9.3-p551'

echo "#############################################################################"
echo "# Installing required packages"
echo "#############################################################################"

if which brew > /dev/null ; then
	brew install curl ctags git
elif which apt-get > /dev/null ; then
	sudo apt-get install curl exuberant-ctags git git-gui zlib1g-dev \
	                     libreadline-dev libssl-dev vim
# TODO support redhat-based
elif which yum > /dev/null ; then
	echo "Only Debian-based and OSX are supported!"
	exit 1
else
	echo "Unsupported environment. Must be have apt-get or homebrew installed."
fi
echo " "

echo "#############################################################################"
echo "# Installing rbenv"
echo "#############################################################################"

# Is rbenv already installed?
if which rbenv > /dev/null ; then
	echo "rbenv is already installed"
	which rbenv > /dev/null || export PATH="$HOME/.rbenv/bin:$PATH"
	echo "rbenv path is `which rbenv`"
else
	echo "installing rbenv..."
	if which brew > /dev/null ; then
		brew install rbenv
	else
		git clone git://github.com/sstephenson/rbenv.git ~/.rbenv

		echo "installing ruby-build plugin"
		git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
		pushd ~/.rbenv/plugins/ruby-build
		sudo ./install.sh
		popd
	fi
fi

# Enable rbenv for the remainder of this script
eval "$(rbenv init -)" # returned some sort of error?
echo " "

echo "#############################################################################"
echo "# Installing ruby"
echo "#############################################################################"
# Check for a current Ruby version
RUBY_VERSION=`rbenv version-name`
if [ -z "$RUBY_VERSION" ] || [ "$RUBY_VERSION" = "system" ] ; then
	echo "Default ruby version is $DEFAULT_RUBY_VERSION"

	# Install the default if one is missing
	if [ ! -d ~/.rbenv/versions/$DEFAULT_RUBY_VERSION ] ; then
		rbenv install $DEFAULT_RUBY_VERSION
	fi

	rbenv global $DEFAULT_RUBY_VERSION
else
	echo "Current Version: $RUBY_VERSION"
fi

# Fix shims
which gem > /dev/null 2>&1 || eval "$(rbenv init -)"
echo " "

echo "#############################################################################"
echo "# Installing gems"
echo "#############################################################################"
gem install homesick
gem install rake

echo " "

echo "#############################################################################"
echo "# Rake!"
echo "#############################################################################"

# Finally, run rake to hook everything into the home folder
cd $(dirname $0) && rake
