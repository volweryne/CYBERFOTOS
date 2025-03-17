#!/bin/bash

# Script de instalação do CyberFotos para CasaOS
# Autor: CyberFotos Team

# Cores para saída no terminal
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Instalação do CyberFotos para CasaOS ===${NC}"
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

# Criar diretório de dados
DATA_DIR="/opt/casaos/cyberfotos/data"
echo -e "${YELLOW}Criando diretório de dados em ${DATA_DIR}...${NC}"
mkdir -p $DATA_DIR

# Atualizar o docker-compose.yml para usar o diretório de dados
echo -e "${YELLOW}Atualizando configuração do docker-compose.yml...${NC}"
sed -i "s|cyberfotos_data:/app/data|${DATA_DIR}:/app/data|g" docker-compose.yml

# Construir e iniciar os contêineres
echo -e "${GREEN}Construindo e iniciando os contêineres...${NC}"
$DOCKER_COMPOSE up -d --build

# Verificar se a aplicação está rodando
if [ $? -eq 0 ]; then
    echo -e "${GREEN}CyberFotos foi instalado com sucesso!${NC}"
    echo -e "${GREEN}Acesse a aplicação em: http://seu-ip-do-servidor:8080${NC}"
else
    echo -e "${RED}Ocorreu um erro durante a instalação. Verifique os logs para mais detalhes.${NC}"
    echo -e "${YELLOW}Execute: $DOCKER_COMPOSE logs -f cyberfotos${NC}"
fi

echo ""
echo -e "${GREEN}=== Instalação concluída ===${NC}" 