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

# Install wget
brew install wget
brew install ack


# Install ruby
brew install rbenv
rbenv init
rbenv install 2.6.6
rbenv rehash
gem install bundler -v 1.17.3
rbenv rehash
rbenv global 2.6.6

# Install golang
wget https://golang.org/dl/go1.14.12.darwin-amd64.pkg
sudo installer -pkg go1.14.12.darwin-amd64.pkg -target /Volumes/Macintosh\ HD
rm go1.14.12.darwin-amd64.pkg
export GOPROXY="https://proxy.golang.org,direct"
export GONOPROXY=none
export GO111MODULE=on
export GOSUMDB=off
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# Install python
brew install pyenv
pyenv install 3.7.4
pyenv global 3.7.4

## Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# vim
brew install vim
brew install neovim --HEAD

# utilities
brew install tree htop gotop ripgrep fd
