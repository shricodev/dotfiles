FROM ubuntu:24.04

LABEL org.opencontainers.image.authors="Shrijal Acharya <shrijal.acharya@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/shricodev/dotfiles"
LABEL org.opencontainers.image.description="Test environment for my dotfiles configuration"
LABEL org.opencontainers.image.title="Dotfiles Test Environment"

ARG USER=shricodev
ARG group=shricodev
ARG uid=1001

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update -y && \
  apt-get upgrade -y

RUN apt-get install -y \
  sudo \
  curl \
  git-core \
  gnupg \
  locales \
  tzdata \
  wget \
  software-properties-common && \
  apt-get autoremove -y

# Install Ansible
RUN add-apt-repository --yes --update ppa:ansible/ansible && \
  apt-get install -y ansible

RUN adduser --quiet --disabled-password \
  --shell $(which bash) --home /home/${USER} \
  --uid ${uid} --gecos "Dotfiles tester" ${USER}

RUN mkdir -p /etc/sudoers.d && \
  touch /etc/sudoers.d/${USER} && \
  echo "%${group} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${USER} && \
  groupadd docker && \
  usermod -aG docker ${USER}

RUN chown -R ${USER}:${group} /home/${USER}
USER ${USER}

RUN mkdir -p /home/${USER}/.local/bin

RUN echo 'export PATH="$HOME/.local/bin:$PATH"' >> /home/${USER}/.bashrc

# Clone the dotfiles repo from GitHub
RUN git clone --branch main https://github.com/shricodev/dotfiles.git /home/${USER}/.dotfiles

# Run ansible playbook directly. Not using --ask-become-pass since the sudoers
# config already grants NOPASSWD access and Docker builds are non-interactive.
WORKDIR /home/${USER}/.dotfiles/ansible
RUN ansible-playbook main.yml --limit local
