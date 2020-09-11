# dotfiles

![](https://github.com/guillaumebriday/dotfiles/workflows/Lint/badge.svg)

## How to use it ?

Clone the project in your home directory :

```bash
$ cd ~
$ xcode-select --install
$ git clone https://github.com/Benoit-Baumann/dotfiles.git && cd dotfiles
$ find ~/dotfiles -name '*.sh' | xargs -I file chmod u+x file # Make sure you can execute the scripts
```

**Before running any commands, you must edit files according to your needs.**

For exemple, open the `brew/Brewfile` and remove applications you don't want to install from the list.

At the end of the installation, restart your computer.

## Installation

### Brew

Packages and applications are installed with [https://brew.sh/](https://brew.sh/).

```bash
$ brew/brew.sh
```

### Git

```bash
$ git/git.sh
```

### Vim

```bash
$ vim/vim.sh
```

### SSH

```bash
$ ssh/ssh.sh
```

### ZSH

```bash
$ zsh/zsh.sh
```

Then complete the [n](https://github.com/tj/n#installation) installation for `sudo` privileges.

### ASDF

Ruby is manage with [ASDF](https://asdf-vm.com/#/).

```bash
$ ruby/rvm.sh
```

### iTerm2

Close iTerm2 before running this command:

```bash
$ ssh/iTerm2.sh
```

### VS Code

Edit the file `/Applications/VSCodium.app/Contents/Resources/app/product.json` and replace the key `extensionsGallery` with:

```json
"extensionsGallery": {
  "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
  "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
  "itemUrl": "https://marketplace.visualstudio.com/items"
}
```


```bash
$ vscode/vscode.sh
```
