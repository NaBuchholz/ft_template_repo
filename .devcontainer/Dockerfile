FROM ubuntu:22.04

# Evitar prompts interativos durante a instalação
ARG DEBIAN_FRONTEND=noninteractive

# Instalar dependências básicas
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    gdb \
    cmake \
    make \
    git \
    curl \
    wget \
    valgrind \
    vim \
    nano \
    python3 \
    python3-pip \
    netcat \
    iputils-ping \
    locales \
    clang \
    clang-format \
    clang-tidy \
    lldb \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Instalar norminette
RUN pip3 install norminette==3.3.51

# Instalar ZSH 
RUN apt-get update && apt-get install -y zsh && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Configurar zsh como shell padrão
RUN chsh -s /bin/zsh

# Definir o usuário padrão
USER $USERNAME
WORKDIR /workspaces/project