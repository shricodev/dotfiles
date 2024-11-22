# dotfiles

NOTE: These are specific to my requirements. Mainly for my usage, but feel free to grab the configs and modify it as per your needs.

### Clone this repository:

```
git clone git@github.com:shricodev/dotfiles.git ~/.dotfiles
```

### Using GNU Stow (recommended)

Install GNU Stow (if not already installed)

```bash
apt install stow
```

Install all the dotfiles config:
There are though some folders which are not to be stowed such as windows/ that contains the `settings.json` file for the Windows Terminal.

```bash
cd ~/.dotfiles && stow */ # Stow all the directories
```

May get some warning messages like the following one:

```bash
cd ~/dotfiles
```

```bash
stow git
WARNING! stowing git would cause conflicts:

- existing target is neither a link nor a directory: .gitconfig
  All operations aborted.
```

Or

```bash
WARNING! stowing git would cause conflicts:

- existing target is not owned by stow: .gitconfig
  All operations aborted.
```

This means that the file .gitconfig (or any other file name that appear in the warning) exists before the symlinking. We need to manually change its name so GNU Stow can create the symlink. My recommendation is to rename it:

```bash
mv ~/.gitconfig ~/.gitconfig.old
```
