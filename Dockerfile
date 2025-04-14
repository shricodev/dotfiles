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
  wget && \
  apt-get autoremove -y

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
COPY --chown=${USER}:${group} bin/dotfiles /home/${USER}/.local/bin/dotfiles
RUN chmod u+x /home/${USER}/.local/bin/dotfiles

RUN echo 'export PATH="$HOME/.local/bin:$PATH"' >> /home/${USER}/.bashrc && \
  bash -c "source /home/$USER/.bashrc"

# The setup is just meant to be one time and not everytime the container starts
# and all, so using 'RUN' here is the appropriate option. and not something
# like 'CMD' or 'ENTRYPOINT'.
RUN bash /home/${USER}/.local/bin/dotfiles
