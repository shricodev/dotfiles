# 🛠️ dotfiles & system setup with Ansible

<p align="left">
    <a href="https://github.com/shricodev/dotfiles/actions/workflows/ansible-lint.yml"><img align="center" src="https://github.com/shricodev/dotfiles/actions/workflows/ansible-lint.yml/badge.svg"/></a>
    <a href="https://github.com/shricodev/dotfiles/issues"><img align="center" src="https://img.shields.io/github/issues/shricodev/dotfiles"/></a>
    <a href="https://github.com/shricodev/dotfiles/commits/main"><img align="center" src="https://img.shields.io/github/commit-activity/m/shricodev/dotfiles" alt="commit frequency"></a>
</p>

## 👀 Check Out My Blog Post on this Project!

> I have a blog post about this project [here](https://dev.to/shricodev/how-i-manage-my-system-and-dotfiles-with-ansible-8m1).

## ✨ Why Ansible?

Managing dotfiles and setting up a new system should be **fast**, **reliable**,
and **reproducible** — without needing to manually install a bunch of things
every time.

Ansible provides a **declarative**, **idempotent**, and **powerful** way to
automate:

- Installing system packages
- Configuring user environments
- Managing dotfiles
- Setting up development environments across **local machines**, **servers**,
  and even **containers**.

No more "setting up" — **just run the playbook and go!**

> [!NOTE]
> Previously, I had stow way of managing my dotfiles, you can find it in the other
> branch here: [Link](https://github.com/shricodev/dotfiles/tree/old-stow)

## 📽️ Demo

> You can find the demo video setting up this dotfiles configuration on multiple ubuntu homelabs here: [Link](https://www.youtube.com/watch?v=wXHfggMFbS0)

## 📦 Requirements

- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed
- Git
- Supported Operating Systems (for now):
  - Arch Linux
  - Ubuntu (maybe also for Debian, but some packages names might be different)
- (Optional) Docker, if you want to test this in a container

## Ansible Version Notes

This repository is compatible with Ansible 2.20+ and avoids deprecated
auto-injected facts. All system facts must be accessed via:

- ansible_facts["distribution"]
- ansible_facts["user_dir"]
- ansible_facts["distribution_release"]

## ⚡ Setup

> [!NOTE]
> Make sure that you have `~/.local/bin` in your `$PATH` variable as that is
> where the Ansible will symlink all the `bin` scripts.

Run the setup script:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/shricodev/dotfiles/main/bin/dotfiles)"
```

> [!NOTE]
> This `bin/dotfiles` script will **auto-detect your OS**, **install Ansible**,
> **setup SSH keys**, and **run the main playbook** locally with the following.
> command: `ansible-playbook main.yml --limit local --ask-become-pass`

## 🚀 Usage

You can use the dotfiles script to setup everything **locally**.

The `dotfiles` script is supposed to only run locally, but if you want to configure
dotfiles on a remote machine, go for the [Taskfile](https://taskfile.dev/) tasks instead.

Make sure you update the `inventory/hosts.yml` file with your hosts if you plan
to use it to setup multiple systems and not just localhost.

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

Also, make sure that you update the `group_vars/local.yml`,
`group_vars/all.yml` and `ubuntu_homelabs.yml` (optional if you only plan to
run it locally) file to your liking.

### Using Taskfile tasks

First, make sure that you have `task` installed.

| Command                     | Description                                  |
| --------------------------- | -------------------------------------------- |
| `task docker_build`         | Build the dotfiles Docker image              |
| `task docker_run`           | Run the dotfiles Docker container            |
| `task docker_build_and_run` | Build and run the dotfiles Docker container  |
| `task local`                | Run Ansible locally (your machine)           |
| `task ubuntu_homelabs`      | Run Ansible to setup Ubuntu homelab machines |

> [!NOTE]
> 🏁 PRO TIP: If you want to test the working without installing anything on your system,
> you can run the project in a docker container.

```bash
task docker_build_and_run
```

> [!NOTE]
> For running this to setup remote hosts, make sure you setup an SSH key to login
> to each of the individual remote hosts you plan to manage and place the name in the
> `ansible.cfg` file.

```ini
[defaults]
inventory = inventory/hosts.yml
private_key_file = <place_ssh_key_path_here>
roles_path = roles
retry_files_enabled = false

# Not the very best practice but this project just deals with local changes and
# mainly just the config changes, so shouldn't really matter.
host_key_checking = false
```

### Using the `dotfiles` script

You can use the `dotfiles` command **anywhere**:

```bash
bash dotfiles
```

> [!NOTE]
> Logs are stored in the `~/.dotfiles.log` file. Use it to debug any issues.

This will:

- Verify Ansible is installed
- Clone (or update) the dotfiles repository
- Install/update any `ansible-galaxy` dependencies
- Run the Ansible playbook with your configuration

## 🔥 First Run

After the first setup, a small file is created at `~/.dotfiles_first_run_check`
to detect that you ran it once.

On first run:

- SSH key for Ansible is automatically generated
- Dotfiles are cloned into `~/dotfiles`
- Playbooks configure your system

## 📜 Project Structure

```
.
├── bin/                    # Helper scripts (like 'dotfiles')
├── pre_tasks/              # Pre-setup tasks before full playbook runs
├── roles/                  # Ansible roles for modular setup
├── group_vars/             # Group-specific variable configurations
├── inventory/              # Host inventory definitions
├── collections/            # Ansible Galaxy collections
├── configure_dotfiles.yml  # Main playbook for dotfiles setup
├── configure_system.yml    # Main playbook for system setup
├── clean_up_system.yml     # Main playbook for system cleanup
├── ansible.cfg             # Ansible config file
├── Dockerfile              # Dockerfile
├── main.yml                # Master playbook entry point
└── Taskfile.yml            # Task runner file
```

## 📬 Contributing

Pull requests are welcome! Feel free to open issues for feature suggestions or
bug reports.

## 📜 License

This project is licensed under the [Apache License, Version 2.0](LICENSE).

# 🙌 Thanks for stopping by!

Happy hacking! 🎉
