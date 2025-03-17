#!/bin/bash

# Script para verificar o status do CyberFotos
# Autor: CyberFotos Team

# Cores para saída no terminal
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Status do CyberFotos ===${NC}"
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

# Verificar se o contêiner está rodando
CONTAINER_STATUS=$(docker ps -a --filter "name=cyberfotos" --format "{{.Status}}")

if [[ $CONTAINER_STATUS == *"Up"* ]]; then
    echo -e "${GREEN}Status: RODANDO${NC}"
    
    # Obter informações do contêiner
    CONTAINER_ID=$(docker ps -a --filter "name=cyberfotos" --format "{{.ID}}")
    CONTAINER_PORTS=$(docker port $CONTAINER_ID)
    CONTAINER_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER_ID)
    
    echo -e "${GREEN}ID do Contêiner: ${NC}$CONTAINER_ID"
    echo -e "${GREEN}IP do Contêiner: ${NC}$CONTAINER_IP"
    echo -e "${GREEN}Portas Mapeadas: ${NC}"
    echo "$CONTAINER_PORTS"
    
    # Verificar uso de recursos
    echo -e "\n${GREEN}Uso de Recursos:${NC}"
    docker stats $CONTAINER_ID --no-stream
    
    # Mostrar logs recentes
    echo -e "\n${GREEN}Logs Recentes:${NC}"
    docker logs $CONTAINER_ID --tail 10
    
    echo -e "\n${YELLOW}Para ver mais logs, execute:${NC}"
    echo -e "$DOCKER_COMPOSE logs -f cyberfotos"
elif [[ $CONTAINER_STATUS == *"Exited"* ]]; then
    echo -e "${RED}Status: PARADO${NC}"
    echo -e "${YELLOW}Para iniciar o contêiner, execute:${NC}"
    echo -e "$DOCKER_COMPOSE start cyberfotos"
    
    # Mostrar logs recentes para diagnóstico
    CONTAINER_ID=$(docker ps -a --filter "name=cyberfotos" --format "{{.ID}}")
    echo -e "\n${GREEN}Últimos Logs (para diagnóstico):${NC}"
    docker logs $CONTAINER_ID --tail 20
else
    echo -e "${RED}Status: NÃO ENCONTRADO${NC}"
    echo -e "${YELLOW}O contêiner CyberFotos não foi encontrado.${NC}"
    echo -e "${YELLOW}Para instalar, execute:${NC}"
    echo -e "./install.sh"
fi

echo ""
echo -e "${GREEN}=== Fim do Status ===${NC}" 