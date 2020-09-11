#!/usr/bin/env bash

# Configuration files
ln -fs ~/dotfiles/asdf/.default-gems ~/
ln -fs ~/dotfiles/asdf/.asdfrc ~/

# Check for rvm
if ! hash asdf 2>/dev/null; then
  echo "Installing asdf..."
  brew install asdf
fi

# Configure .zshrc
echo ". $(brew --prefix asdf)/asdf.sh" >> ~/.zshrc


# Installing and setting latest version of Ruby
asdf install ruby latest
asdf global ruby "$(asdf latest ruby)"
