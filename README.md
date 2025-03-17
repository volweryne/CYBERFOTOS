# CyberFotos

Aplicação para gerenciamento de fotos e vídeos com detecção de rostos e categorização automática.

## Instalação no CasaOS

### Pré-requisitos

- CasaOS instalado no seu servidor Linux
- Docker e Docker Compose instalados (geralmente já vêm com o CasaOS)

### Método 1: Usando a Interface do CasaOS

1. Acesse o painel de controle do CasaOS no navegador (geralmente http://seu-ip-do-servidor:port)
2. Vá para a seção "Apps" ou "App Store"
3. Clique em "Custom App" ou "Docker Compose"
4. Cole o conteúdo do arquivo `docker-compose.yml` deste projeto
5. Clique em "Deploy" ou "Install"

### Método 2: Usando o Script de Instalação Automatizado

1. Conecte-se ao seu servidor via SSH:
   ```bash
   ssh usuario@seu-ip-do-servidor
   ```

2. Crie um diretório para o projeto:
   ```bash
   mkdir -p /path/to/cyberfotos
   cd /path/to/cyberfotos
   ```

3. Clone este repositório ou copie os arquivos para o diretório:
   ```bash
   git clone https://seu-repositorio/cyberfotos.git .
   ```
   
   Ou copie manualmente os arquivos para o servidor.

4. Torne o script de instalação executável:
   ```bash
   chmod +x install.sh
   ```

5. Execute o script de instalação:
   ```bash
   ./install.sh
   ```

6. A aplicação estará disponível em:
   ```
   http://seu-ip-do-servidor:8080
   ```

### Método 3: Usando Docker Compose Manualmente

1. Conecte-se ao seu servidor via SSH
2. Crie um diretório para o projeto e navegue até ele
3. Copie os arquivos do projeto para o diretório
4. Execute o Docker Compose:
   ```bash
   docker-compose up -d
   ```

## Scripts Utilitários

Este projeto inclui vários scripts para facilitar a administração:

### install.sh

Script de instalação automatizada que configura o ambiente e inicia a aplicação.

```bash
chmod +x install.sh
./install.sh
```

### status.sh

Verifica o status atual da aplicação, mostrando informações como uso de recursos e logs recentes.

```bash
chmod +x status.sh
./status.sh
```

### update.sh

Atualiza a aplicação para a versão mais recente, com opção de backup automático.

```bash
chmod +x update.sh
./update.sh
```

## Configuração de Persistência de Dados

Os dados da aplicação são armazenados no volume Docker `cyberfotos_data`. Para garantir que seus dados sejam preservados, você pode mapear este volume para um diretório específico no seu servidor.

Edite o arquivo `docker-compose.yml`:

```yaml
volumes:
  cyberfotos_data:
    driver: local
    driver_opts:
      type: none
      device: /caminho/para/seu/armazenamento
      o: bind
```

## Atualizações

Para atualizar a aplicação:

1. Use o script de atualização automatizado:
   ```bash
   ./update.sh
   ```

Ou manualmente:

1. Pare o contêiner:
   ```bash
   docker-compose down
   ```

2. Atualize os arquivos do projeto (se necessário)

3. Reconstrua e inicie o contêiner:
   ```bash
   docker-compose up -d --build
   ```

## Solução de Problemas

### Verificar logs

```bash
docker-compose logs -f cyberfotos
```

### Reiniciar o contêiner

```bash
docker-compose restart cyberfotos
```

### Problemas de permissão

Se encontrar problemas de permissão com os volumes:

```bash
sudo chown -R 1000:1000 /caminho/para/seu/armazenamento
```

## Recursos

- Detecção automática de rostos
- Categorização de imagens
- Suporte a vídeos
- Interface moderna com tema cyberpunk 