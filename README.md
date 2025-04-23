<p align="left"><h1 align="center">Ambiente de Desenvolvimento 42</h1></p>
<p align="center">
	<img src="https://img.shields.io/badge/licença-MIT-0b96a2?style=flat&logo=opensourceinitiative&logoColor=white" alt="licença">
	<img src="https://img.shields.io/badge/linguagem-Docker-0b96a2?style=flat&logo=docker&logoColor=white" alt="linguagem-principal">
	<img src="https://img.shields.io/badge/linguagem-Shell-0b96a2?style=flat&logo=gnu-bash&logoColor=white" alt="contagem-linguagens">
	<img src="https://img.shields.io/badge/Norminette-v3.3.51-0b96a2?style=flat&logo=42&logoColor=white" alt="versão-norminette">
</p>

## 🔗 Índice

- [📍 Visão Geral](#-visão-geral)
- [✨ Funcionalidades](#-funcionalidades)
- [📁 Estrutura do Projeto](#-estrutura-do-projeto)
- [🚀 Começando](#-começando)
  - [☑️ Pré-requisitos](#-pré-requisitos)
  - [⚙️ Instalação](#-instalação)
  - [🤖 Uso](#-uso)
- [⚙️ Configuração do Container de Desenvolvimento](#-configuração-do-container-de-desenvolvimento)
- [🛠️ Ferramentas e Extensões](#-ferramentas-e-extensões)
- [🧰 Scripts Utilitários](#-scripts-utilitários)
- [🎗 Licença](#-licença)

## 📍 Visão Geral

Este repositório fornece um ambiente de desenvolvimento pronto para uso para projetos da Escola 42. Ele utiliza Docker e o recurso devcontainer do VS Code para criar um ambiente consistente e pré-configurado que segue os padrões de codificação da 42, incluindo validação com Norminette. Esta configuração permite que você se concentre na codificação em vez da configuração do ambiente, com todas as ferramentas e aliases necessários pré-instalados.

## ✨ Funcionalidades

- **Ambiente Docker Completo**: Ubuntu 22.04 com todas as ferramentas de desenvolvimento necessárias
- **Integração com Norminette**: Norminette 3.3.51 pré-instalada com aliases convenientes
- **Configuração do VS Code**: Pré-configurado com extensões essenciais para projetos da 42
- **GitHub Actions**: Validação automática com Norminette em push e pull requests
- **Aliases Convenientes**: Atalhos para comandos comuns (norminette, gcc, git)
- **Oh My Zsh**: Experiência de terminal aprimorada com configuração personalizada
- **Suporte ao Cabeçalho 42**: Extensão para adicionar o cabeçalho da 42 aos seus arquivos
- **Ferramentas de Depuração**: Inclui GDB, Valgrind e LLDB para depuração completa

## 📁 Estrutura do Projeto

```sh
.
├── .devcontainer/              # Configuração do container de desenvolvimento
│   ├── Dockerfile              # Definição da imagem Docker
│   ├── devcontainer.json       # Configurações do devcontainer do VS Code
│   └── post-create.sh          # Script de configuração pós-criação
├── .github/
│   └── workflows/              # Configuração do GitHub Actions
│       └── main.yml            # Workflow de validação com Norminette
├── .gitignore                  # Padrões de ignorar do Git para projetos em C
├── LICENSE                     # Licença MIT
├── README.md                   # Documentação do projeto
└── main.c                      # Arquivo C de exemplo
```

## 🚀 Começando

### ☑️ Pré-requisitos

- [Docker](https://www.docker.com/products/docker-desktop/) instalado em seu sistema
- [Visual Studio Code](https://code.visualstudio.com/) com a extensão [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- Git

### ⚙️ Instalação

1. Clone este repositório:
```sh
git clone https://github.com/SEU-USUARIO/ambiente-dev-42
```

2. Abra o repositório no VS Code:
```sh
code ambiente-dev-42
```

3. Quando solicitado, clique em "Reabrir no Container" ou use a paleta de comandos (F1) e selecione "Remote-Containers: Reopen in Container"

4. Aguarde a construção e inicialização do container (isso pode levar alguns minutos na primeira vez)

### 🤖 Uso

Uma vez que o container esteja em execução, você pode:

- Usar o terminal dentro do VS Code para compilar e executar seu código
- Editar arquivos com a formatação 42 aplicada automaticamente
- Executar a Norminette com o alias `norm` para verificar seu código
- Usar todos os aliases configurados para tarefas de desenvolvimento
- Depurar seu código usando o depurador integrado

## ⚙️ Configuração do Container de Desenvolvimento

O container de desenvolvimento é configurado em `.devcontainer/devcontainer.json` e inclui:

- Ferramentas e bibliotecas de desenvolvimento C/C++
- Norminette 3.3.51 para validação de estilo de código
- Oh My Zsh para uma experiência de terminal aprimorada
- Extensões do VS Code para projetos da Escola 42
- Configurações personalizadas para os padrões de codificação da 42

## 🛠️ Ferramentas e Extensões

Este ambiente vem com as seguintes extensões do VS Code:

- **42 Header**: Adiciona o cabeçalho da 42 aos seus arquivos
- **42 C Format**: Formata seu código de acordo com a norma da 42
- **42 Norminette 3**: Integra o verificador Norminette
- **42 FT Count Line**: Conta o número de linhas em seu projeto
- **C/C++ Tools**: Suporte completo às linguagens C/C++
- **GitLens**: Integração aprimorada com Git
- **Better Comments**: Destaque aprimorado de comentários
- **LLDB**: Suporte a depurador
- **Markdown All in One**: Suporte à edição de Markdown
- **Code Spell Checker**: Verificação ortográfica para comentários e strings

## 🧰 Scripts Utilitários

O ambiente vem com aliases úteis (disponíveis tanto no bash quanto no zsh):

### Norminette
- `norm`: Executar norminette
- `normr`: Executar norminette ignorando o cabeçalho de origem proibido
- `norma`: Executar norminette com todas as verificações
- `normc`: Verificar apenas arquivos .c e .h
- `normh`: Mostrar ajuda da norminette
- `normv`: Mostrar versão da norminette

### Compilação
- `gcc`: Executar gcc com flags da 42 (-Wall -Wextra -Werror)
- `cc`: Executar cc com flags da 42
- `clean`: Remover arquivos .o
- `fclean`: Remover arquivos .o, .out e .a

### Git
- `gst`: Executar git status
- `ga`: Executar git add
- `gc`: Executar git commit -m
- `gp`: Executar git push
- `gl`: Executar git log com gráfico

### Específicos da 42
- `test`: Compilar com flags de depuração
- `val`: Executar valgrind com detecção de vazamento de memória

## 🎗 Licença

Este projeto está licenciado sob a Licença MIT - consulte o arquivo [LICENSE](LICENSE) para obter detalhes.

<p align="center">Feito com 💜 por Nyx</p>