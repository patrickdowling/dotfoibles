# Just another dotfile collection

So it's recently become increasingly apparent that
- I've been avoiding shell scripting for far too long...
- My various dotfiles are, to put it nicely, a mess...
- It doesn't help that they are distributed across various systems, with a mix of OSes.
- Sharing them via dropbox hasn't worked out as well as it seemed. That might be because things still need to be manually linked.

So it seems a good way to solve both issues is some (semi) automatic dotfile installer thing. Of which there are already many.

"How hard can it be?"

## Guidelines

- The "topic" approach seen in other dotfile collections seems useful, so everything lives in a subdirectory
- Anything file ending with `.symlink` is linked as `$HOME/.<filename>`
- If there's an `install.sh` in a subdirectory, it will be called and can do more complex things.
- Common actions are available
 - `dot_install_symlink src target` checks if the symlink already exists, and can skip/overwrite.
 - `dot_install_directory dir` checks if the directory exists, otherwise it gets created.
- The variable `$DOT_OS` is automatically set to either `macos` or `linux`.
- There's some pretty printing log functions (see `common.sh`)

## Installation

```
cd ~
git clone git@github.com:patrickdowling/dotfiles.git .dotfiles
cd .dotfiles && ./install.sh
```

## TODO Things
- .clang-format template
- makefile templates
- aliases

## TODO Prerequisistes
- curl
- Ag
- brew `the_silver_searcher`
- neovim
- clang-format
- fonts
- zoxide

### Linux
```
sudo apt install fonts-powerline
```

### OS X
```
brew
```
- Ensure correct zsh version is used (i.e. the brew version in `/usr/local/bin/zsh`)
- `sudo sh -c "echo $(which zsh) >> /etc/shells"`

