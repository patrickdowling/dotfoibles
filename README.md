# Just another dotfile collection

The initial version of this repository was both an exercise in shell scripting and an attempt to unify my dotfiles and configs, which were a mess of copypasta and fickle preferences strewn across work/home and a mix of OS.
It has since been converted to use `ansible` for the installation (for better or worse). The actual configurations and settings are still a work-in-progress...

Yes, there are nice things like [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook) and others that already handle most or even a lot of the required functionality.
Aside from an unhealthy dose of NIH need-to-see-under-the-hood, I find that re-implementing things for which I have an actual use to be very instructive.

I don't really expect anyone else to use this directly. Perhaps it's interesting or at least good for a laugh.
Definitely assume it will be in flux and possibly destructive.

## Guidelines
- The "topic" approach seen in other dotfile collections seems useful, so most things that get symlinked into `$HOME` live in the `packages` dir.
- Anything file ending with `.symlink` is linked as `$HOME/.<filename>` (this is somewhat a remnant of the original shell scripts).
- All the actual "work" is done within ansible `roles/xxxx`. This is, admittedly, somewhat less than ideal since it means tracking things in two places.

## Installation
```
cd ~
git clone git@github.com:patrickdowling/dotfoibles.git .dotfiles
cd .dotfiles
./system/bootstrap.sh
```
(optional: setup `user.config.yml`)
```
ansible-playbook main.yml -K
```

## Package details
### devenv
My main projects directory has ended up as `~/dev`. Perhaps not the best choice but oh well :)

### docker
- This is basically a placeholder for aliases.
- The zsh completions are now installed by `roles/zsh`.
- Eventually this might just be merged with other things (or, use an existing zsh plugin).

### zsh
- aliases are defined by packages in a `packages/package/package-aliases.zsh` file.

### git
- Creates some local config files
- `$HOME/.gitconfig.local` with `user.name` and `user.email` is created if the variables are set (e.g. in `user.config.yml`)

### neovim
- `neovim` configuration has been ported to lua; `.vimrc` is in limbo (see below).

### themes
- Needs work ;)
- Installed in `.local/share/themes` (`$DOT_THEMES` environment variable)
- There's a `zsh` function `dot_themes_update` that updates the repositories (or, just use the playbook again).

## Vague To-Dos
- There's still a lot of interdependency between packages, so `zsh` startup requires themes, the directory structure has to match, etc. This might be templatized.
- So while it's theoretically possible to use tags to install a subset of things, that's not currently recommened.

### Linux
- Use homebrew? Remember to update `.zshenv.local` with `eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"`

### Features
- zsh: Key bindings
- .clang-format template
- .editorconfig
- makefile templates
- aliases
- `shellcheck`
- Generate local config files automatically similarly to `.gitconfig.local`
- Completions (e.g. docker)

## vim/nvim
- ~~Convert init.vim to Lua~~
- Lua style/formatting
- clang-format
- Basic `.vimrc` as fallback

### General/Install
- Fonts & things?
- python, pip etc.
- asdf or similar
- https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
