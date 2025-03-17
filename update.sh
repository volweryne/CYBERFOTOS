#!/bin/bash

# Script de atualização do CyberFotos para CasaOS
# Autor: CyberFotos Team

# Cores para saída no terminal
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Atualização do CyberFotos para CasaOS ===${NC}"
echo ""

# Verificar se o Docker está instalado
if ! command -v docker &> /dev/null; then
    echo -e "${RED}Docker não encontrado. Por favor, instale o Docker primeiro.${NC}"
    exit 1
fi

# Verificar se o Docker Compose está instalado
if ! command -v docker-compose &> /dev/null; then
    echo -e "${YELLOW}Docker Compose não encontrado. Tentando usar o plugin do Docker...${NC}"
    if ! docker compose version &> /dev/null; then
        echo -e "${RED}Docker Compose não encontrado. Por favor, instale o Docker Compose primeiro.${NC}"
        exit 1
    else
        DOCKER_COMPOSE="docker compose"
    fi
else
    DOCKER_COMPOSE="docker-compose"
fi

echo -e "${GREEN}Docker e Docker Compose encontrados.${NC}"

# Verificar se o contêiner existe
if ! docker ps -a --filter "name=cyberfotos" --format "{{.Names}}" | grep -q "cyberfotos"; then
    echo -e "${RED}O contêiner CyberFotos não foi encontrado. Execute o script de instalação primeiro.${NC}"
    exit 1
fi

# Fazer backup dos dados (opcional)
echo -e "${YELLOW}Deseja fazer backup dos dados antes de atualizar? (s/n)${NC}"
read -r BACKUP_CHOICE

if [[ $BACKUP_CHOICE == "s" || $BACKUP_CHOICE == "S" ]]; then
    BACKUP_DIR="/opt/casaos/cyberfotos/backups/$(date +%Y%m%d_%H%M%S)"
    echo -e "${YELLOW}Criando backup em ${BACKUP_DIR}...${NC}"
    mkdir -p $BACKUP_DIR
    
    # Copiar dados para o backup
    cp -r /opt/casaos/cyberfotos/data/* $BACKUP_DIR/
    
    echo -e "${GREEN}Backup criado com sucesso.${NC}"
fi

# Parar o contêiner atual
echo -e "${YELLOW}Parando o contêiner atual...${NC}"
$DOCKER_COMPOSE down

# Atualizar o código (se estiver usando git)
if [ -d ".git" ]; then
    echo -e "${YELLOW}Atualizando o código-fonte...${NC}"
    git pull
fi

# Reconstruir e iniciar os contêineres
echo -e "${GREEN}Reconstruindo e iniciando os contêineres...${NC}"
$DOCKER_COMPOSE up -d --build

# Verificar se a aplicação está rodando
if [ $? -eq 0 ]; then
    echo -e "${GREEN}CyberFotos foi atualizado com sucesso!${NC}"
    echo -e "${GREEN}Acesse a aplicação em: http://seu-ip-do-servidor:8080${NC}"
else
    echo -e "${RED}Ocorreu um erro durante a atualização. Verifique os logs para mais detalhes.${NC}"
    echo -e "${YELLOW}Execute: $DOCKER_COMPOSE logs -f cyberfotos${NC}"
    
    # Se houver backup, oferecer restauração
    if [[ $BACKUP_CHOICE == "s" || $BACKUP_CHOICE == "S" ]]; then
        echo -e "${YELLOW}Deseja restaurar o backup? (s/n)${NC}"
        read -r RESTORE_CHOICE
        
        if [[ $RESTORE_CHOICE == "s" || $RESTORE_CHOICE == "S" ]]; then
            echo -e "${YELLOW}Restaurando backup...${NC}"
            rm -rf /opt/casaos/cyberfotos/data/*
            cp -r $BACKUP_DIR/* /opt/casaos/cyberfotos/data/
            
            # Tentar iniciar novamente
            $DOCKER_COMPOSE up -d
            
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}Backup restaurado e aplicação iniciada com sucesso!${NC}"
            else
                echo -e "${RED}Falha ao iniciar a aplicação após restaurar o backup.${NC}"
            fi
        fi
    fi
fi

echo ""
echo -e "${GREEN}=== Atualização concluída ===${NC}" 