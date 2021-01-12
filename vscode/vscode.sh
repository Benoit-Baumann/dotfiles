#!/usr/bin/env bash

# Configuration files
find ~/dotfiles/vscode -name '*.json' -maxdepth 1 -print0 | xargs -0 -I file ln -fs file ~/Library/Application\ Support/VSCodium/User/
ln -fs ~/dotfiles/vscode/snippets/ ~/Library/Application\ Support/VSCodium/User

# Packages
packages=(
  atipugin.rails-partial
  bmewburn.vscode-intelephense-client
  bradlc.vscode-tailwindcss
  bung87.rails
  bung87.vscode-gemfile
  castwide.solargraph
  christian-kohler.npm-intellisense
  CoenraadS.bracket-pair-colorizer
  connorshea.vscode-ruby-test-adapter
  cssho.vscode-svgviewer
  dbaeumer.vscode-eslint
  DotJoshJohnson.xml
  eamodio.gitlens
  formulahendry.auto-close-tag
  formulahendry.auto-rename-tag
  haaaad.ansible
  hbenl.vscode-test-explorer
  HookyQR.beautify
  Hridoy.rails-snippets
  karunamurti.haml
  mechatroner.rainbow-csv
  mhmadhamster.postcss-language
  miguel-savignano.ruby-symbols
  mikestead.dotenv
  misogi.ruby-rubocop
  ms-azuretools.vscode-docker
  ms-vsliveshare.vsliveshare
  neilbrayfield.php-docblocker
  noku.rails-run-spec-vscode
  octref.vetur
  PKief.material-icon-theme
  pnp.polacode
  possan.nbsp-vscode
  rebornix.ruby
  redhat.vscode-yaml
  ritwickdey.LiveServer
  sdras.vue-vscode-snippets
  Shan.code-settings-sync
  shanehofstetter.rails-i18n
  shanoor.vscode-nginx
  sianglim.slim
  sporto.rails-go-to-spec
  syler.sass-indented
  timonwong.shellcheck
  TomasHubelbauer.vscode-markdown-table-format
  tomoki1207.pdf
  Tyriar.sort-lines
  usernamehw.indent-one-space
  wingrunr21.vscode-ruby
  wmaurer.change-case
  wwm.better-align
  yzhang.markdown-all-in-one
  zhuangtongfa.material-theme
  Zignd.html-css-class-completion
)

for package in "${packages[@]}"
do
  code --install-extension "$package"
done
