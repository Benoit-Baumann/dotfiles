export ZSH=~/.oh-my-zsh
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="code -w"
export DISABLE_SPRING=true
export GATSBY_TELEMETRY_DISABLED=1
export PGHOST="127.0.0.1"
export PGPORT="5432"
export PGUSER="postgres"

ZSH_THEME="robbyrussell"
DEFAULT_USER="$USER"

# Useful plugins
plugins=(git rails bundler osx docker)

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Configure Homebrew completions (required for asdf)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi

# Source Oh-my-ZSH
source $ZSH/oh-my-zsh.sh

# Global aliases
alias zshconfig="st ~/.zshrc"
alias dtf="st ~/dotfiles"
alias meteo='curl -s "wttr.in/lyon?lang=fr"'
alias cat="ccat"
alias mkdir="mkdir -p"
alias f="open"
alias hostfile="sudo vim /etc/hosts"
alias please='sudo $(fc -ln -1)'
alias ip="curl ipinfo.io/ip"
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias -g G=' | grep '
alias cpssh='pbcopy < ~/.ssh/id_rsa.pub'

# SublimeText
alias st='subl'

# Git aliases
alias gau="git add -u"
alias gst="clear && git status"
alias gs="gst"
alias gsu="clear && git status -u"
alias nah="git reset --hard HEAD && git clean -fd"
alias undo="git reset HEAD\^"
alias wip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'
alias go="git open"
alias tigd="tig master..HEAD --first-parent --no-merges"
alias gdc="git diff --cached"
alias gdns="git diff --name-status"
alias gdm="git diff --color-moved"

# Docker aliases
alias dps="docker ps"
alias dc="docker-compose"
alias dcup="docker-compose up -d"
alias dcups="docker-compose up -d && bundle exec rails s"
alias dcd="docker-compose down"
alias yt="docker run --rm -u $(id -u):$(id -g) -v $PWD:/data vimagick/youtube-dl"
dbash() { docker exec -it "$1" /bin/bash; }

# Yarn
alias yh="yarn hot"
alias yw="yarn watch"
alias yui="yarn upgrade-interactive --latest"

# Rails aliases
alias zs="zeus start"
alias rc="bundle exec rails c"
alias rs="bundle exec rails s"
alias boe="bundle outdated --only-explicit"
alias mrubocop="git diff --name-only | xargs rubocop"
alias rake="noglob rake"
alias dbdev="bin/rails db:environment:set RAILS_ENV=development"
# kill runing rails server
alias krs="kill -9 $(lsof -wni tcp:3000 | grep ruby | awk 'NR == 1 {print $2}')"
alias rrg='bundle exec rake routes | grep'

# Mailcatcher
alias mc="mailcatcher && open http://127.0.0.1:1080/"

# Overmind
alias oc="overmind connect"
alias ocs="overmind connect server"
alias br="bin/run"

# Asdf
alias ai="asdf install"

# Source zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Source zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source ASDF
. $(brew --prefix asdf)/asdf.sh

autoload -U add-zsh-hook

load-n() {
  node_version=".node-version"

  if [ -f "$node_version" ]; then
    current_node_version=$(node -v)
    nvmrc_node_version=$(cat "${node_version}")

    if [ "$current_node_version" != "v${nvmrc_node_version}" ]; then
      n "$nvmrc_node_version"
    fi
  fi
}

add-zsh-hook chpwd load-n
load-n
