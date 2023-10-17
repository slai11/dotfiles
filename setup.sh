#!/bin/bash

xcode-select --install

# Install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# vim
brew install vim
brew install neovim --HEAD

# utilities
brew install tree htop gotop ripgrep fd bat exa jq xsv rtx
