ARG VARIANT="ubuntu-22.04"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install build-essential gcc gdb cmake make git \
    valgrind vim nano libcriterion-dev clang-format clang-tidy \
    lldb net-tools iputils-ping \
    && apt-get autoremove -y && apt-get clean -y

# Configurar norminette (se necessário para a 42)
RUN apt-get -y install python3 python3-pip \
    && pip3 install --break-system-packages --upgrade pip \
    && pip3 install --break-system-packages norminette==3.3.51

# Criar uma pasta para o projeto
RUN mkdir -p /workspaces/project

# Configurar o usuário vscode
USER vscode
WORKDIR /workspaces/project

# Configurar o .bashrc para mostrar configurações úteis
RUN echo "echo '42 Dev Container ativado com sucesso!'" >> ~/.bashrc \
    && echo "echo 'Norminette: $(norminette --version)'" >> ~/.bashrc