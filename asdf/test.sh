#!/usr/bin/env bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

echo $DIR


# echo "# Source ASDF\n. \$(brew --prefix asdf)/asdf.sh" >> ~/.zshrc

if ! grep -q "FPATH=\$(brew --prefix)/share/zsh/site-functions:\$FPATH" ~/.zshrc ; then
  echo 'not found'
  # sed -i '1s/^/ \n/' ~/.zshrc
fi

TEST=$(cat<<'EOF'
if type brew &>/dev/null; then
  FPATH=\$(brew --prefix)/share/zsh/site-functions:\$FPATH
  autoload -Uz compinit
  compinit
fi
EOF
)

echo $TEST

find . -name '.ruby-version' | xargs cat | sort | uniq
