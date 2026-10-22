# Tatiana & Tiago

Convite digital de casamento para **20 de fevereiro de 2027, às 16h**, no **Monarca Casarão**, em Belo Horizonte – MG.

A versão 2 aprovada reúne o convite completo, **fundos florais transparentes e a fotografia do casal no encerramento**, em HTML com CSS e JavaScript internos. A identidade usa creme e terracota, Cormorant Garamond, Parisienne e ícones SVG inline. A fotografia encerra a tarefa 2, dedicada às imagens; a tarefa 3 continua sendo a confirmação de convidados.

## Abrir localmente

Abra [`src/index.html`](src/index.html) diretamente no navegador. Não é necessário instalar dependências ou executar build. As fontes do Google são opcionais: sem conexão, o navegador usa fontes do sistema e preserva o layout e as interações.

Para servir por HTTP, na raiz do repositório:

```bash
python3 -m http.server 8000 --bind 127.0.0.1
```

Acesse [o convite local](http://127.0.0.1:8000/src/). Para abrir uma seção específica, acrescente `?slide=1` até `?slide=5` à URL.

## Como funciona

- **Retrato, abaixo de 768px:** carrossel de cinco slides; botões, indicadores, swipe horizontal, setas e PageUp/PageDown. Os cinco slides cabem sem rolagem desde 320×480 pixels CSS, em uso normal. A composição se ajusta à altura, com corpo entre 14px e 18px; modais, zoom e texto ampliado mantêm rolagem acessível quando necessária.
- **Paisagem ou largura a partir de 768px:** cinco seções em uma página vertical, centralizada em até 800px.
- No slide do evento em retrato, as flores crescem gradualmente acima de 668px de altura, até 180px nos dois cantos em 440×956. O encerramento usa foto retrato no carrossel e paisagem nos demais formatos, com a frase no céu, assinatura clara e flores apenas na base. No desktop tem aproximadamente 800×720px.
- Girar ou redimensionar a tela preserva a seção em leitura.
- Localização e presentes abrem modais com fechamento por botão, Escape ou fundo; o foco retorna ao acionador.
- Sem JavaScript, os textos continuam disponíveis em fluxo vertical; navegação interativa e modais exigem JavaScript.

## Estrutura

```text
src/index.html          Fonte da v2 final, com florais e fotografia
src/assets/florals/     14 peças WebP com alpha preservadas
src/assets/photos/      Quatro WebP: retrato 480/768 e paisagem 800/1200
plans/1-plan.md          Plano aprovado da tarefa 1
plans/1-validation.md    Validação da etapa sem imagens
plans/2-plan.md          Plano consolidado de toda a tarefa 2 e suas revisões
plans/2-validation.md    Validação dos florais e da etapa fotográfica
plans/evidence/2-photo/  Capturas, medidas e prova de preservação
plans/2-assets.md        Origens, tratamento e prompts dos assets
TASKS.md                Tarefas numeradas e links para seus planos
PRD.md                  Requisitos da etapa atual e evoluções futuras
DESIGN.md               Identidade e componentes implementados
slides/                 Mockups para referência futura
slides-bg/              Originais dos fundos florais, preservados
photo-original/         Fotografia original preservada
dist/index.html         V2 aprovada, cópia fiel de src/index.html
dist/assets/florals/    Cópias dos 14 florais para publicação
dist/assets/photos/     Cópias das quatro fotografias otimizadas
.github/workflows/      Workflow existente de publicação
```

Consulte as [tarefas](TASKS.md), o [plano 2 consolidado](plans/2-plan.md), a [validação atual](plans/2-validation.md), os [assets](plans/2-assets.md), o [PRD](PRD.md) e o [design](DESIGN.md). O plano 2 reúne a implementação inicial e todos os ajustes aprovados; o [plano 1](plans/1-plan.md) preserva o histórico da primeira etapa.

## Limites desta etapa

- O botão **Confirmar presença** é um placeholder sem ação. Não existe confirmação, cadastro ou registro de convidados.
- O link de presentes `https://noivos.casar.com` é **provisório**; sua substituição permanece pendente para a entrega funcional do convite.
- São 14 florais WebP com alpha preservados (1,33 MB) e quatro exportações da foto (341.816 bytes no conjunto). A foto maior de cada formato pesa cerca de 108 KB no retrato e 113 KB na paisagem. O navegador seleciona uma variante por enquadramento; não baixa os quatro arquivos na abertura.
- O retrato deriva diretamente da foto original. Na paisagem, a expansão é sintética fora do enquadramento; os pixels originais do casal foram restaurados na região protegida antes de redimensionar e comprimir. Sem retoque facial ou deformação da fotografia original. Detalhes e prompts no inventário. As peças florais superiores do encerramento permanecem como histórico, sem uso no layout atual.
- Os originais JPEG são preservados; `5-exemplo-recorte.jpeg` não é usado, pois seu quadriculado não é transparência real.
- Não há backend, persistência, cookies, analytics ou coleta de dados de convidados. Google Fonts faz requisições externas de fontes; mapa e presentes abrem por ação do usuário.
- O convite usa `noindex`; isso não constitui controle de acesso.

## Validação

A entrega inicial validou smartphones pequenos e grandes, retrato e paisagem, tablets e desktop, além das interações e cenários de acessibilidade. As revisões visuais posteriores usaram testes direcionados em Chrome emulado, sem repetir a matriz extensa ou as 112 combinações. A etapa fotográfica verificou seis viewports, comparação com original, carregamento único, contraste, rotação, modais e resiliência pontual. Não houve teste em aparelho físico, Firefox ou Safari/iOS nesta etapa. Resultados, histórico de execuções e limites de cobertura estão no [registro de validação](plans/2-validation.md).

Não foi adicionada infraestrutura ou dependência de testes ao projeto.

## Publicação

A publicação da v2 final, incluindo a fotografia, foi autorizada após a revisão visual. A [versão em dist](dist/index.html) contém o HTML, os 14 florais e as quatro fotos aprovadas, espelhados de `src/`. O destino existente é o [GitHub Pages do convite](https://tiagocarmo.github.io/casamento/).

O workflow existente continua publicando `dist/` em pushes para `main` ou execução manual. `npm run deploy` também publica essa pasta; não é um comando de preview. A publicação usa a branch `gh-pages`, configurada no GitHub Pages; o workflow foi preservado.

Nas próximas alterações, manter `src/` como fonte e promover a versão aprovada para `dist/` antes da publicação.
