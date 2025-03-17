## 📝 Sumário

- [Sobre](#sobre)
- [Características Principais](#características-principais)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Instalação](#instalação)
- [Como Usar](#como-usar)
- [Funcionalidades Detalhadas](#funcionalidades-detalhadas)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Contribuição](#contribuição)
- [Licença](#licença)

## 📖 Sobre

O **CyberFotos** é um sistema avançado de gerenciamento e visualização de imagens inspirado em aplicativos populares como Google Fotos. Desenvolvido com foco em experiência do usuário e recursos modernos, o sistema oferece ferramentas poderosas para organização, classificação e compartilhamento de imagens.

O diferencial do CyberFotos está em seu sistema de reconhecimento facial integrado, que permite a identificação automática de pessoas em suas fotos, agrupando-as de forma inteligente. Além disso, o sistema oferece detecção de duplicatas, ferramentas de visualização avançada e recursos de compartilhamento.

## ✨ Características Principais

### Reconhecimento Facial Avançado
- **Identificação automática**: Detecta rostos em fotos automaticamente
- **Agrupamento inteligente**: Organiza fotos da mesma pessoa em pastas
- **Sugestões de agrupamento**: Sugere combinações de possíveis pastas da mesma pessoa
- **Feedback adaptativo**: Aprende com suas decisões para melhorar a precisão

### Visualização de Imagens
- **Visualizador em tela cheia**: Interface moderna para visualização de fotos
- **Controles de zoom**: Ampliação de detalhes com arrastar e zoom
- **Navegação intuitiva**: Transição suave entre imagens, atalhos de teclado 
- **Menu de contexto**: Acesso rápido a funções via clique direito

### Gerenciamento de Arquivos
- **Detecção de duplicatas**: Encontra automaticamente fotos duplicadas
- **Organização em pastas**: Sistema flexível de pastas para organização
- **Categorização automática**: Classifica imagens por conteúdo
- **Metadados avançados**: Extração e visualização de informações das imagens

### Compartilhamento e Download
- **Download único ou múltiplo**: Baixe imagens individualmente ou em lote
- **Compactação ZIP**: Crie arquivos ZIP com múltiplas fotos
- **Compartilhamento WhatsApp**: Envio direto para contatos e grupos
- **Seleção múltipla**: Interface intuitiva para selecionar várias imagens

## 🔧 Tecnologias Utilizadas

- **Frontend:**
  - React
  - TypeScript
  - TailwindCSS
  - Framer Motion (animações)
  - Lucide Icons
  
- **Backend:**
  - Node.js
  - Express
  - TensorFlow.js (reconhecimento facial)
  - Face-api.js
  
- **Ferramentas:**
  - JSZip (compactação de arquivos)
  - FileSaver (download de arquivos)
  - Vite (build e desenvolvimento)
  - TSX (TypeScript com JSX)

## 📥 Instalação

### Pré-requisitos
- Node.js (v16+)
- npm ou yarn
- Git

### Passo a passo

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/cyberfotos.git
cd cyberfotos
```

2. Instale as dependências:
```bash
npm install
# ou
yarn install
```

3. Instale as dependências adicionais para reconhecimento facial:
```bash
npm install jszip file-saver @types/file-saver
```

4. Inicie o servidor local:
```bash
npm run server
```

5. Em outro terminal, inicie a aplicação frontend:
```bash
npm run dev
```

6. Acesse a aplicação no navegador:
```
http://localhost:3000
```

## 🚀 Como Usar

### Primeira Execução

1. Ao iniciar o CyberFotos pela primeira vez, você verá a tela principal com opções para importar imagens.
2. Clique em "Importar Fotos" para adicionar imagens ao sistema.
3. O sistema processará automaticamente suas imagens, identificando rostos e gerando metadados.
4. Aguarde o processamento ser concluído (pode demorar alguns minutos dependendo da quantidade de imagens).

### Organização de Fotos

1. Acesse o "Gerenciador de Rostos" para ver as pessoas detectadas em suas fotos.
2. Você pode:
   - Renomear pastas de pessoas
   - Confirmar sugestões de agrupamento
   - Reatribuir rostos para pessoas diferentes
   - Criar novas pastas manualmente

### Visualização de Imagens

1. Clique em qualquer imagem para abrir o visualizador em tela cheia.
2. Use as setas do teclado ou botões na tela para navegar entre imagens.
3. Recursos disponíveis:
   - Zoom com botões +/- ou com duplo clique
   - Arrastar a imagem ampliada para ver detalhes
   - Botão direito para acessar o menu de contexto
   - Tecla 'M' para ativar seleção múltipla
   - Tecla 'D' para download rápido

### Download e Compartilhamento

1. Para download único:
   - Clique no botão de download na barra superior
   - Ou use o botão direito e selecione "Baixar"

2. Para download múltiplo:
   - Ative o modo de seleção múltipla (botão ✓ ou tecla M)
   - Selecione as imagens desejadas
   - Clique no botão ZIP ou no botão de download regular

3. Para compartilhar no WhatsApp:
   - Use o botão de compartilhamento na barra superior
   - Ou selecione esta opção no menu de contexto (botão direito)

## 🔍 Funcionalidades Detalhadas

### Reconhecimento Facial

O sistema utiliza algoritmos avançados de reconhecimento facial para detectar e identificar pessoas em suas fotos. O processo inclui:

1. **Detecção**: Identificação de todos os rostos presentes nas imagens
2. **Extração**: Análise de características faciais únicas
3. **Comparação**: Agrupamento baseado em similaridade
4. **Aprendizado**: Refinamento contínuo baseado nas suas interações

A tecnologia permite reconhecer a mesma pessoa em diferentes ângulos, iluminações e idades, com alta precisão.

### Detecção de Duplicatas

O CyberFotos inclui um sistema inteligente para encontrar e gerenciar imagens duplicadas:

1. **Análise de similaridade**: Compara conteúdo visual das imagens
2. **Comparação inteligente**: Identifica versões diferentes da mesma foto
3. **Sugestão automática**: Recomenda qual versão manter (geralmente a de maior qualidade)
4. **Remoção segura**: Permite revisar e confirmar antes de excluir duplicatas

### Visualizador Avançado

O visualizador de imagens inclui recursos profissionais:

1. **Interface imersiva**: Modo de tela cheia com fundo escuro para destacar as imagens
2. **Zoom de alta qualidade**: Ampliação sem perda de qualidade
3. **Navegação multimodo**: Teclado, mouse e gestos (em dispositivos touch)
4. **Seleção múltipla**: Interface intuitiva para gerenciar várias imagens
5. **Atalhos de teclado**: Controles rápidos para usuários avançados

### Sistema de Download

Oferece opções flexíveis para salvar suas imagens:

1. **Download único**: Salva rapidamente uma imagem específica
2. **Compactação ZIP**: Cria um arquivo compactado com múltiplas imagens
3. **Download sequencial**: Alternativa para baixar várias imagens individualmente
4. **Nomes inteligentes**: Preserva nomes originais dos arquivos quando disponíveis
5. **Indicador de progresso**: Feedback visual durante downloads grandes

## 🏗️ Estrutura do Projeto

```
cyberfotos/
├── public/               # Arquivos públicos estáticos
├── src/                  # Código fonte do projeto
│   ├── components/       # Componentes React reutilizáveis
│   │   ├── FaceManager.tsx     # Gerenciador de rostos detectados
│   │   ├── ImageViewer.tsx     # Visualizador avançado de imagens
│   │   └── ...
│   ├── services/         # Serviços e lógica de negócios
│   │   ├── imageProcessing.ts  # Processamento de imagens e faces
│   │   └── ...
│   ├── store/            # Gerenciamento de estado global
│   │   ├── imageStore.ts       # Estado das imagens e pastas
│   │   └── ...
│   ├── server/           # Código do servidor Node.js
│   │   ├── server.ts           # Servidor Express para API
│   │   └── ...
│   └── ...
├── package.json          # Dependências e scripts do projeto
└── README.md             # Documentação do projeto
```

## 👥 Contribuição

Contribuições são bem-vindas! Se você deseja melhorar o CyberFotos, siga estes passos:

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Faça commit de suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Faça push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo LICENSE para detalhes.

---

<div align="center">
  <p>Desenvolvido com ❤️ por [volweryne]</p>
  <p>⭐ Deixe uma estrela se este projeto foi útil para você! ⭐</p>
</div>
