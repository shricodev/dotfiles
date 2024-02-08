## dotfiles

> NOTE: These are specific to my requirements. Mainly for my usage, but feel free to grab the configs and modify it as per your needs.

### Clone this repository:

```
git clone git@github.com:shricodev/dotfiles.git ~/.dotfiles
```

### Using GNU Stow (recommended)

Install GNU Stow (if not already installed)

```
apt install stow
```

Install all the dotfiles config:

```
cd ~/.dotfiles && \
 stow nvim && \
 stow bash && \
 stow fish && \
 stow stow && \
 stow git && \
 stow ssh && \
 stow tmux
```

May get some warning messages like the following one:

```
cd ~/dotfiles
```

```
stow git
WARNING! stowing git would cause conflicts:

- existing target is neither a link nor a directory: .gitconfig
  All operations aborted.

```

Or

```
WARNING! stowing git would cause conflicts:

- existing target is not owned by stow: .gitconfig
  All operations aborted.
```

This means that the file .gitconfig (or any other file name that appear in the warning) exists before the symlinking. We need to manually change its name so GNU Stow can create the symlink. My recommendation is to rename it:

```
mv ~/.gitconfig ~/.gitconfig.old
```
