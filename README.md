# Just another dotfile collection
So it's recently become increasingly apparent that
- I've been avoiding (shell) scripting for far too long...
- My various dotfiles are, to put it nicely, a mess of copypasta and fickle preferences...
- It doesn't help that they are distributed across various systems, with a mix of OSes, work and leisure.
- Sharing them (via symlinks into dropbox et al.) hasn't worked out as well as it might have and something always
  seems to get lost.

So it seems a good way to solve ALL THE THINGS! is some kind of (semi-) automatic dotfile installer thing. Of which there are, admittedly, already many.

"How hard can it be?"

I don't really expect anyone else to use this directly. Perhaps it's interesting or at least good for a laugh.
Definitely assume it will be in flux.

## Guidelines
- The "topic" approach seen in other dotfile collections seems useful, so most things live in the `packages` dir.
- Anything file ending with `.symlink` is linked as `$HOME/.<filename>`
- If there's an `install.sh` in a subdirectory, it will be called and can do more complex things.
- Common actions are available in such scripts:
 - `dot_install_symlink src target` checks if the symlink already exists, and can skip/overwrite.
 - `dot_install_directory dir` checks if the directory exists, otherwise it gets created.
- The variable `$DOT_OS` is automatically set to either `macos` or `linux`.
- There's some pretty printing log functions (see `common.sh`)

## Installation
```
cd ~
git clone git@github.com:patrickdowling/dotfoibles.git .dotfiles
cd .dotfiles && ./install.sh --install.sh
```

## TODO General
- zsh: Key bindings
- .clang-format template
- .editorconfig
- makefile templates
- aliases
- `shellcheck`
- generate local config files automatically similarly to `.gitconfig.local`

## TODO Prerequisistes
- There's the beginnings of a prerequisistes check (`install.sh --check`)

## TODO
- Install binaries/packages/missing bits
- `brew` is already somewhat supported; there aren't as many packages as expected.
- Fonts & things
- python, pip etc. (neovim)
- Completions (e.g. docker)
- Convert init.vim to Lua
- https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
