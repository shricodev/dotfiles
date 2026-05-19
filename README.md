# dotfiles & system setup

<p align="left">
    <a href="https://github.com/shricodev/dotfiles/actions/workflows/ansible-lint.yml"><img align="center" src="https://github.com/shricodev/dotfiles/actions/workflows/ansible-lint.yml/badge.svg"/></a>
    <a href="https://github.com/shricodev/dotfiles/issues"><img align="center" src="https://img.shields.io/github/issues/shricodev/dotfiles"/></a>
    <a href="https://github.com/shricodev/dotfiles/commits/main"><img align="center" src="https://img.shields.io/github/commit-activity/m/shricodev/dotfiles" alt="commit frequency"></a>
</p>

## 👀 Check Out My Blog Post on this Project! (Outdated)

> I have a blog post about this project [here](https://dev.to/shricodev/how-i-manage-my-system-and-dotfiles-with-ansible-8m1).
>
> ⚠️ **NOTE:** It's outdated as previously everything including dotfiles was setup using Ansible. Now, we have a mix of Stow + Ansible.

Best of both worlds: **Stow** for dotfiles, **Ansible** for system setup.

- **Stow** manages all configuration files (dotfiles). Adding a new tool is as
  simple as creating a directory and running `stow`.
- **Ansible** handles system-level setup: installing packages, configuring
  services, setting up development environments.

## How it works

**New machine setup** (one command):

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/shricodev/dotfiles/main/bin/dotfiles)"
```

This auto-detects your OS, installs Ansible, runs the playbook (which installs all packages and deploys dotfiles via stow).

**Day-to-day dotfiles** (no ansible needed):

```bash
# edit configs in place (already symlinked)
vim dots/nvim/.config/nvim/init.lua

# add a new tool
mkdir -p dots/wezterm/.config/wezterm
# add your config files...
stow -d dots -t ~ wezterm
```

## 📽️ Demo (Outdated)

> You can find the demo video setting up this dotfiles configuration on multiple ubuntu homelabs here: [Link](https://www.youtube.com/watch?v=wXHfggMFbS0)

## Requirements

- Git
- Supported OS: **Arch Linux**, **Ubuntu**, **Fedora**
- (Optional) [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
  for system setup (auto-installed by the bootstrap script)
- (Optional) Docker for testing in a container

### Ansible Version Notes

Compatible with Ansible 2.20+. All system facts are accessed via
`ansible_facts["distribution"]`, `ansible_facts["user_dir"]`, etc.

## Project Structure

```
.
├── dots/                      # Stow packages (dotfiles)
│   ├── nvim/                  #   ~/.config/nvim/
│   ├── tmux/                  #   ~/.config/tmux/
│   ├── fish/                  #   ~/.config/fish/
│   ├── kitty/                 #   ~/.config/kitty/
│   ├── ghostty/               #   ~/.config/ghostty/
│   ├── alacritty/             #   ~/.config/alacritty/
│   ├── lazygit/               #   ~/.config/lazygit/
│   ├── starship/              #   ~/.config/starship.toml
│   ├── bat/                   #   ~/.config/bat/
│   ├── zed/                   #   ~/.config/zed/
│   ├── git/                   #   ~/.gitconfig, ~/.gitignore_global
│   ├── gnupg/                 #   ~/.gnupg/
│   ├── scripts/               #   ~/.local/bin/
│   └── ...                    #   (i3, picom, polybar, gtk, etc.)
├── ansible/                   # System automation
│   ├── roles/                 #   Modular setup roles
│   ├── pre_tasks/             #   Pre-setup tasks
│   ├── group_vars/            #   Variable configurations
│   ├── inventory/             #   Host inventory
│   ├── configure_system.yml   #   System setup playbook
│   ├── clean_up_system.yml    #   Cleanup playbook
│   ├── main.yml               #   Master playbook
│   └── ansible.cfg            #   Ansible config
├── bin/
│   └── dotfiles               # Bootstrap script
├── stow.sh                    # Helper to stow/unstow all packages
├── Taskfile.yml               # Task runner
└── Dockerfile                 # Test environment
```

Each stow package mirrors the home directory structure. For example:

```
dots/nvim/.config/nvim/init.lua  -->  ~/.config/nvim/init.lua
dots/git/.gitconfig              -->  ~/.gitconfig
dots/scripts/.local/bin/foo      -->  ~/.local/bin/foo
```

## Usage

### Stow (dotfiles only)

```bash
# deploy all dotfiles
./stow.sh

# deploy a single package
stow -d dots -t ~ nvim

# remove symlinks
./stow.sh unstow

# re-deploy (unstow + stow)
./stow.sh restow
```

### Ansible (system setup)

```bash
# run locally (via Taskfile)
task local

# run on remote homelabs
task ubuntu_homelabs
```

Update `ansible/inventory/hosts.yml` with your hosts and
`ansible/group_vars/` with your configuration.

```yaml
---
all:
  children:
    ubuntu_homelabs:
      hosts:
        # <place_your_hosts_here>

    local:
      hosts:
        localhost:
          ansible_connection: local
```

For remote hosts, set up SSH keys and update `ansible/ansible.cfg`:

```ini
[defaults]
inventory = inventory/hosts.yml
private_key_file = <place_ssh_key_path_here>
roles_path = roles
```

### Taskfile commands

| Command                     | Description                            |
| --------------------------- | -------------------------------------- |
| `task stow`                 | Deploy all dotfiles via stow           |
| `task unstow`               | Remove all dotfile symlinks            |
| `task restow`               | Re-deploy all dotfiles                 |
| `task local`                | Run Ansible locally (your machine)     |
| `task ubuntu_homelabs`      | Run Ansible on Ubuntu homelab machines |
| `task docker_build`         | Build the dotfiles Docker image        |
| `task docker_run`           | Run the dotfiles Docker container      |
| `task docker_build_and_run` | Build and run the Docker container     |

> [!NOTE]
> To test without installing anything on your system, run `task docker_build_and_run`.

### Bootstrap script

```bash
bash dotfiles
```

This will install Ansible, clone the repo, and run the full playbook.
Logs are stored in `~/.dotfiles.log`.

## First Run

On first run, `~/.dotfiles_first_run_check` is created. The script will
recommend a reboot to apply all changes.

## License

[Apache License, Version 2.0](LICENSE)
