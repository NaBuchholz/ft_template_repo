#!/bin/bash

# Script executado após a criação do contêiner
echo "Configurando ambiente 42..."

# Exibir versão da norminette
echo "Norminette: $(norminette --version)"

# Função para adicionar alias a um arquivo de configuração
add_aliases_to_file() {
    local config_file=$1
    
    # Verificar se o arquivo existe, se não, criar
    touch "$config_file"
    
    # Adicionar alias da norminette
    if ! grep -q "alias norm=" "$config_file"; then
        echo -e "\n# Alias para norminette" >> "$config_file"
        echo 'alias norm="norminette"' >> "$config_file"
        echo 'alias normr="norminette -R CheckForbiddenSourceHeader"' >> "$config_file"
        echo 'alias norma="norminette -R CheckAll"' >> "$config_file"
        echo 'alias normc="norminette *.c *.h"' >> "$config_file"
        echo 'alias normh="norminette -h"' >> "$config_file"
        echo 'alias normv="norminette -v"' >> "$config_file"
    fi

    # Adicionar alias para compilação
    if ! grep -q "alias gcc=" "$config_file"; then
        echo -e "\n# Alias para compilação" >> "$config_file"
        echo 'alias gcc="gcc -Wall -Wextra -Werror"' >> "$config_file"
        echo 'alias clean="rm -f *.o"' >> "$config_file"
        echo 'alias fclean="rm -f *.o *.out *.a"' >> "$config_file"
        echo 'alias cc="cc -Wall -Wextra -Werror"' >> "$config_file"
    fi

    # Adicionar alias para git
    if ! grep -q "alias gst=" "$config_file"; then
        echo -e "\n# Alias para git" >> "$config_file"
        echo 'alias gst="git status"' >> "$config_file"
        echo 'alias ga="git add"' >> "$config_file"
        echo 'alias gc="git commit -m"' >> "$config_file"
        echo 'alias gp="git push"' >> "$config_file"
        echo 'alias gl="git log --oneline --graph"' >> "$config_file"
    fi
    
    # Adicionar alias específicos para 42
    if ! grep -q "alias 42norm=" "$config_file"; then
        echo -e "\n# Alias específicos para 42" >> "$config_file"
        echo 'alias test="gcc -Wall -Wextra -Werror -g"' >> "$config_file"
        echo 'alias val="valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes"' >> "$config_file"
    fi
}

# Configurar aliases no .bashrc
echo "Configurando alias no bash..."
add_aliases_to_file ~/.bashrc

# Configurar aliases no .zshrc (se o Zsh estiver instalado)
if command -v zsh &> /dev/null; then
    echo "Configurando alias no zsh..."
    add_aliases_to_file ~/.zshrc
    
    # Instalar Oh My Zsh se não estiver instalado (opcional)
    if [ ! -d ~/.oh-my-zsh ]; then
        echo "Instalando Oh My Zsh para melhorar experiência com zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        
        # Restaurar os aliases após a instalação do Oh My Zsh (que pode substituir o .zshrc)
        add_aliases_to_file ~/.zshrc
    fi
fi

# Configurar git (se necessário)
if [ -z "$(git config --global user.email)" ]; then
    echo "Configurando git..."
    # Você pode descomentar estas linhas e adicionar suas informações
    # git config --global user.name "Seu Nome"
    # git config --global user.email "seu.email@student.42.fr"
fi

# Criar arquivo de boas-vindas personalizado
cat > ~/.42_welcome << EOL
==================================================
      _  _  ____    ____                _           
     | || ||___ \  |  _ \  _____   __  / \   _ __  
     | || |_ __) | | | | |/ _ \ \ / / / _ \ | '_ \ 
     |__   _/ __/  | |_| |  __/\ V / / ___ \| | | |
        |_||_____| |____/ \___| \_/ /_/   \_\_| |_|
                                              
            Ambiente de Desenvolvimento          
==================================================

Alias disponíveis:
  Norminette:
    norm    - norminette padrão
    normr   - ignora a verificação do header da 42
    norma   - verifica todas as regras
    normc   - verifica apenas arquivos .c e .h
    normh   - ajuda da norminette
    normv   - versão da norminette

  Compilação:
    gcc     - gcc com flags da 42 (-Wall -Wextra -Werror)
    cc      - cc com flags da 42
    clean   - remove arquivos .o
    fclean  - remove arquivos .o, .out, .a

  Git:
    gst     - git status
    ga      - git add
    gc      - git commit -m
    gp      - git push
    gl      - git log --oneline --graph

  42 Específicos:
    test  - gcc com flags de debug
    val   - valgrind com config para detecção de vazamentos

==================================================
EOL

# Adicionar exibição da mensagem de boas-vindas ao iniciar o shell
if ! grep -q "cat ~/.42_welcome" ~/.bashrc; then
    echo -e "\n# Exibir mensagem de boas-vindas" >> ~/.bashrc
    echo 'cat ~/.42_welcome' >> ~/.bashrc
fi

if command -v zsh &> /dev/null && [ -f ~/.zshrc ]; then
    if ! grep -q "cat ~/.42_welcome" ~/.zshrc; then
        echo -e "\n# Exibir mensagem de boas-vindas" >> ~/.zshrc
        echo 'cat ~/.42_welcome' >> ~/.zshrc
    fi
fi

# Verificar se é necessário recarregar as configurações
echo "Para aplicar os novos alias imediatamente, execute:"
echo "  Para bash: source ~/.bashrc"
if command -v zsh &> /dev/null; then
    echo "  Para zsh: source ~/.zshrc"
fi

echo "Ambiente 42 configurado com sucesso!"