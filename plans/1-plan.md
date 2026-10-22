# Plano 1 — Estrutura completa do convite sem imagens

## 1. Organização dos planos, tarefas e documentação

Na implementação, criar a pasta **`plans/`** e salvar este plano em **`plans/1-plan.md`**. Os próximos planos seguirão a numeração das respectivas tarefas: `2-plan.md`, `3-plan.md` etc.

Criar **`TASKS.md`** na raiz, com tarefas numeradas, status e links relativos curtos para os planos existentes:

```markdown
# Tarefas

1. [ ] Criar a estrutura completa sem imagens — [plano](plans/1-plan.md)
2. [ ] Incluir as imagens.
3. [ ] Implementar a confirmação de convidados.
```

- Tarefas sem plano poderão permanecer na lista, sem link.
- Não criar planos vazios para as tarefas futuras.
- Manter os números das tarefas estáveis.
- Marcar a tarefa 1 como concluída somente após implementação, validação e documentação.
- A inclusão das imagens e a confirmação de convidados serão planejadas separadamente.

Atualizar o **`README.md` existente**, preservando esse nome, com apresentação do projeto, execução local, estrutura das pastas, comportamentos responsivos, limitações e links para tarefas e plano.

Atualizar o PRD e os pontos afetados do design system para registrar esta etapa: ausência de imagens, CSS próprio, comportamento vertical em paisagem/desktop e implementação em `src/`. Distinguir requisitos desta versão das evoluções futuras.

## 2. Resultado e apresentação

Construir **`src/index.html`**, com HTML semântico, CSS e JavaScript internos, contendo as cinco seções e todas as interações do PRD aplicáveis a esta etapa.

Decisões fechadas:

- **Celular em retrato:** carrossel com cinco slides.
- **Celular em paisagem:** página vertical com as cinco seções.
- **Tablet e desktop:** página vertical centralizada, com largura máxima de **800px**.
- Sem fotografias, fundos florais ou arquivos de imagem.
- Ícones em **SVG inline**, conforme autorizado.
- CSS próprio, sem Tailwind, framework, build ou novas dependências.
- Google Fonts para **Cormorant Garamond e Parisienne**, com alternativas do sistema.
- Sem deploy; preservar a pasta `dist/` e o workflow de publicação.

Preservar a identidade visual: creme `#F6E9D9`, terracota `#B5422F`, marrom `#4A3530`, tipografia serifada, caligrafia e divisores com coração.

Redistribuir os espaços antes ocupados pelas imagens. Não adicionar espaços reservados para fotos ou florais.

| Seção | Conteúdo |
|---|---|
| **1. Apresentação** | “Nosso grande dia”, nomes, data e “Um novo capítulo da nossa história”. |
| **2. História** | Título, os dois parágrafos do PRD e a frase caligráfica final. |
| **3. Informações do evento** | Data, horário, cerimônia, recepção, endereço e acesso ao modal de localização. |
| **4. Confirmação e presentes** | Os dois blocos completos, prazo, botão de confirmação sem ação e acesso ao modal de presentes. |
| **5. Fechamento** | “O nosso para sempre começa aqui.”, assinatura e data, apresentados como texto sobre fundo creme. |

Reutilizar a copy do PRD, preservando **20/02/2027, às 16h**, **Monarca Casarão** e o endereço informado.

No desktop, manter a composição em uma coluna, com parágrafos mais estreitos que o container. As seções terão altura natural, sem obrigatoriedade de ocupar uma viewport inteira.

## 3. Responsividade e navegação

### Celular em retrato

Ativar o carrossel quando a viewport tiver **menos de 768px de largura e estiver em retrato**.

- Cinco seções e cinco indicadores.
- Botões de anterior e próximo no cabeçalho.
- Altura baseada em `100dvh`, com fallback para `100vh` e consideração das áreas seguras.
- Transição horizontal de **0,52s**, com a curva do PRD.
- Navegação por botões, indicadores, swipe e teclado.
- Swipe com limiar de **45px**, apenas quando o movimento horizontal predominar.
- Navegação circular entre primeiro e último slide.
- Conteúdo centralizado quando couber; rolagem vertical interna quando necessário, mantendo os controles acessíveis.
- Slides inativos fora da ordem de foco e da leitura assistiva.

As teclas ArrowRight/PageDown avançarão; ArrowLeft/PageUp retornarão. Esse comportamento ficará suspenso enquanto houver modal aberto.

### Paisagem, tablet e desktop

Nas demais condições:

- Exibir as cinco seções em sequência, com rolagem natural.
- Remover controles de carrossel da apresentação e da ordem de foco.
- Não aplicar transformações horizontais ou alturas fixas que escondam conteúdo.
- Preservar o comportamento normal de rolagem do teclado.
- Usar largura fluida, margens laterais e limite de **800px**.

### Rotação, redimensionamento e links diretos

Usar **as mesmas cinco seções no DOM**, sem duplicar conteúdo por formato.

- Ao sair do carrossel, posicionar a página na seção ativa.
- Ao voltar ao carrossel, selecionar a seção que estava sendo lida.
- Preservar o contexto sem recarregar a página.
- `?slide=1` até `?slide=5` selecionará o slide ou posicionará a seção no fluxo vertical.
- Parâmetros ausentes ou inválidos abrirão a primeira seção.
- A navegação não precisará modificar a URL.
- Sem JavaScript, o conteúdo continuará disponível como página vertical.

Essas regras substituem os requisitos anteriores de carrossel e card de 480px no desktop.

## 4. Interações, acessibilidade e implementação

**Localização:** modal com nome, endereço, “Fechar” e “Abrir Mapa”. Usar uma busca no Google Maps pelo endereço completo definido no PRD.

**Presentes:** modal com a mensagem prevista, “Site da Lista” e “Voltar”. Manter `https://noivos.casar.com` provisoriamente e registrar a substituição como pendência.

Ambos os modais deverão:

- Abrir e fechar sem mudar a seção atual.
- Fechar pelo botão, por Escape e pelo clique diretamente no backdrop.
- Conter o foco, impedir interação com o fundo e devolver o foco ao acionador.
- Permitir rolagem interna em telas baixas.
- Continuar utilizáveis após rotação ou redimensionamento.
- Abrir links externos em nova aba com `rel="noopener noreferrer"`.

**Confirmação de presença:** manter `href="#"` e impedir sua ação padrão. O clique não mudará URL, rolagem ou slide; não abrirá formulário nem mostrará mensagem de confirmação.

**Acessibilidade:**

- Zoom liberado e foco visível.
- Hierarquia correta de títulos e nomes acessíveis nos controles.
- Alvos de toque de pelo menos 44×44px e contraste AA.
- Respeito a `prefers-reduced-motion`.
- SVGs decorativos ocultos da leitura assistiva.
- Rótulos dos controles independentes dos ícones.

**Organização técnica:**

- Centralizar tokens e separar claramente estilos de base, seções, navegação, modais e responsividade.
- Organizar o JavaScript em navegação, troca de modo, swipe, deep link e modais.
- Incluir `lang="pt-BR"`, título, descrição, cor do tema e `noindex`.
- Não adicionar API, backend, formulários, armazenamento, cookies ou analytics.
- Não enviar dados de convidados.
- Manter layout e funcionalidades locais utilizáveis caso as fontes externas falhem.
- Não criar infraestrutura ou dependências de testes.

## 5. Etapas e critérios de aceite

### Sequência de implementação

1. Registrar o plano e criar o `TASKS.md`.
2. Montar as cinco seções, identidade visual, ícones e metadados.
3. Implementar fluxo vertical e carrossel responsivo.
4. Implementar navegação, swipe, deep links e preservação da seção.
5. Implementar modais e botão de confirmação sem ação.
6. Executar a matriz de validação e corrigir os problemas encontrados.
7. Atualizar README, PRD, design e status da tarefa.

### Matriz mínima de telas

| Cenário | Viewports em pixels CSS | Resultado esperado |
|---|---|---|
| Smartphone pequeno, retrato | 320×568 e 360×640 | Slides navegáveis e todo o conteúdo alcançável. |
| Smartphone médio/grande, retrato | 390×844 e 430×932 | Textos, botões e navegação sem cortes. |
| Smartphone, paisagem | 568×320, 667×375 e 844×390 | Página vertical completa; modais utilizáveis. |
| Tablet | 768×1024 e 1024×768 | Fluxo vertical limitado a 800px. |
| Desktop | 1280×720, 1440×900 e 1920×1080 | Página contínua centralizada, sem controles de slide. |

### Casos funcionais

- Percorrer todos os slides por botões, indicadores, swipe e teclado; conferir os dois sentidos do ciclo.
- Rolar conteúdo longo sem disparar swipe acidental.
- Girar a tela e cruzar o breakpoint preservando a seção, inclusive com modal aberto.
- Validar as cinco opções de deep link e valores inválidos como `0`, `6`, `99` e texto.
- Testar abertura, fechamento, foco e navegação por Tab/Shift+Tab nos modais.
- Confirmar que o botão de presença não produz ação.
- Conferir os destinos de mapa e presentes.
- Testar zoom de 200%, fontes indisponíveis e redução de movimento.
- Conferir ausência de erros de JavaScript, recursos locais quebrados e rolagem horizontal.
- Revisar visualmente todas as seções nas famílias de tela previstas.

Registrar as dimensões, os navegadores testados e os resultados. Informar eventuais lacunas de cobertura em Chrome, Firefox e Safari/iOS, sem apresentar emulação como teste em aparelho real.

**A tarefa 1 estará concluída quando a estrutura estiver funcional, o conteúdo integralmente acessível, os testes realizados estiverem registrados e a documentação estiver coerente.** Imagens, confirmação de convidados, link definitivo dos presentes e publicação permanecerão como etapas futuras.

## Adendo aprovado — promoção para dist

Após aprovar a implementação, o usuário autorizou copiar a versão da tarefa 1 para `dist/`. Promover `src/index.html` para `dist/index.html` sem alterar seu conteúdo, substituindo a página “Em construção”. Conferir a igualdade dos arquivos e o funcionamento a partir de `dist/`, atualizar a documentação e manter o workflow existente. Esta promoção não inclui executar deploy remoto e não cria uma nova tarefa ou plano.
