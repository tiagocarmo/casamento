# Tatiana & Tiago

Convite digital de casamento para **20 de fevereiro de 2027, às 16h**, no **Monarca Casarão**, em Belo Horizonte – MG.

A versão 2 aprovada reúne o convite completo e **fundos florais transparentes**, em HTML com CSS e JavaScript internos. A identidade usa creme e terracota, Cormorant Garamond, Parisienne e ícones SVG inline. A fotografia do casal ainda não faz parte da entrega.

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
- No slide do evento em retrato, as flores crescem gradualmente acima de 668px de altura, até 180px nos dois cantos em 440×956. O fechamento preserva a arte mobile; a partir de 768px usa duas faixas exclusivas, recompostas para toda a largura.
- Girar ou redimensionar a tela preserva a seção em leitura.
- Localização e presentes abrem modais com fechamento por botão, Escape ou fundo; o foco retorna ao acionador.
- Sem JavaScript, os textos continuam disponíveis em fluxo vertical; navegação interativa e modais exigem JavaScript.

## Estrutura

```text
src/index.html          Fonte da v2 aprovada, com fundos florais
src/assets/florals/     14 peças WebP com alpha, incluindo duas faixas exclusivas desktop
plans/1-plan.md          Plano aprovado da tarefa 1
plans/1-validation.md    Validação da etapa sem imagens
plans/2-plan.md          Plano consolidado de toda a tarefa 2 e suas revisões
plans/2-validation.md    Validação da etapa com florais
plans/2-assets.md        Origens, tratamento e prompts dos assets
TASKS.md                Tarefas numeradas e links para seus planos
PRD.md                  Requisitos da etapa atual e evoluções futuras
DESIGN.md               Identidade e componentes implementados
slides/                 Mockups para referência futura
slides-bg/              Originais dos fundos florais, preservados
dist/index.html         V2 aprovada, cópia fiel de src/index.html
dist/assets/florals/    Cópias dos 14 florais para publicação
.github/workflows/      Workflow existente de publicação
```

Consulte as [tarefas](TASKS.md), o [plano 2 consolidado](plans/2-plan.md), a [validação atual](plans/2-validation.md), os [assets](plans/2-assets.md), o [PRD](PRD.md) e o [design](DESIGN.md). O plano 2 reúne a implementação inicial e todos os ajustes aprovados; o [plano 1](plans/1-plan.md) preserva o histórico da primeira etapa.

## Limites desta etapa

- O botão **Confirmar presença** é um placeholder sem ação. Não existe confirmação, cadastro ou registro de convidados.
- O link de presentes `https://noivos.casar.com` é **provisório**; sua substituição permanece pendente para a entrega funcional do convite.
- Há somente florais decorativos; a foto do casal permanece pendente. São 14 peças WebP com alpha: os 12 assets iniciais preservados e duas variantes exclusivas do fechamento desktop (800×77px e 800×91px). O conjunto ocupa aproximadamente 1,33 MB.
- Os originais JPEG são preservados; `5-exemplo-recorte.jpeg` não é usado, pois seu quadriculado não é transparência real.
- Não há backend, persistência, cookies, analytics ou coleta de dados de convidados. Google Fonts faz requisições externas de fontes; mapa e presentes abrem por ação do usuário.
- O convite usa `noindex`; isso não constitui controle de acesso.

## Validação

A entrega inicial validou smartphones pequenos e grandes, retrato e paisagem, tablets e desktop, além das interações e cenários de acessibilidade. As revisões visuais posteriores usaram testes direcionados em Chrome emulado, sem repetir a matriz extensa ou as 112 combinações. Capturas do encerramento mobile foram comparadas antes/depois. Resultados, histórico de execuções e limites de cobertura estão no [registro de validação](plans/2-validation.md).

Não foi adicionada infraestrutura ou dependência de testes ao projeto.

## Publicação

A publicação da v2 foi autorizada. A [versão em dist](dist/index.html) contém o HTML e os 14 florais aprovados, idênticos aos arquivos de `src/`. O destino existente é o [GitHub Pages do convite](https://tiagocarmo.github.io/casamento/).

O workflow existente continua publicando `dist/` em pushes para `main` ou execução manual. `npm run deploy` também publica essa pasta; não é um comando de preview. A publicação usa a branch `gh-pages`, configurada no GitHub Pages; o workflow foi preservado.

Nas próximas alterações, manter `src/` como fonte e promover a versão aprovada para `dist/` antes da publicação.
