# Design System — Tatiana & Tiago

**Versão:** 1.3.3 · **Atualização:** 22 de outubro de 2026

**Evento:** 20 de fevereiro de 2027 · **Implementação atual:** `src/index.html`, com 14 peças locais em `src/assets/florals/`, espelhados em `dist/` para publicação.

**Escopo:** [plano 2 consolidado](plans/2-plan.md), fundos florais responsivos. A v2 foi aprovada e promovida para `dist/` por solicitação do usuário.

A segunda etapa acrescenta florais às cinco seções, mantendo tipografia, conteúdo e interações. A foto do casal permanece fora do escopo, sem espaço reservado.

## 1. Tokens e tipografia

| Token | Valor | Uso |
|---|---|---|
| `--color-primary` | `#B5422F` | Títulos, ícones, divisores e botões. |
| `--color-primary-dark` | `#9B3727` | Hover e foco. |
| `--color-secondary` | `#4A3530` | Corpo e informações do evento. |
| `--color-bg` | `#F6E9D9` | Fundo da página, carrossel e fechamento. |
| `--color-surface` | `#FAF1E6` | Seções da página vertical e modais. |
| `--color-white` | `#FFFFFF` | Texto de botões primários. |
| `--color-line` | `#B5422F45` | Bordas decorativas. |
| `--page-width` | `800px` | Limite da página vertical. |
| `--slide-duration` | `.52s` | Transição do carrossel. |
| `--slide-easing` | `cubic-bezier(.22, 1, .36, 1)` | Curva da transição. |

Tokens centralizados em CSS, sem Tailwind. Magenta, coral e oliva aparecem na arte floral, preservando os tons das referências.

- **Corpo e títulos:** Cormorant Garamond 400/500/600; alternativas Georgia e Times New Roman.
- **Caligrafia:** Parisienne 400; alternativas Brush Script MT e cursiva do sistema.
- **Corpo:** 20px no fluxo vertical; 18px no modo confortável, 16px no intermediário e **14px no compacto**. Entrelinha de 1,35 a 1,65 conforme formato.
- **Títulos:** 22px no fluxo vertical; 19px no modo confortável, 17px no intermediário e 16px no compacto. Caixa alta e tracking de .12em.
- **Kicker:** 13px, peso 600, caixa alta e tracking de .24em.
- **Capa:** nomes de 64–94px no fluxo vertical e 56–80px no carrossel; 32px abaixo de 240px de largura para reflow ampliado.
- **Frases caligráficas:** 30–50px conforme seção e altura; 28px abaixo de 240px de largura.
- **Botões:** 14px, ou 13px na composição compacta; peso 600, altura mínima de 44px.

Textos longos têm largura de leitura restrita. As fontes alternativas também devem caber na matriz normal, sem depender da fonte remota.

## 2. Florais e camadas

Os originais `slides-bg/1.jpeg` a `5.jpeg` foram preservados. A extração do fundo foi realizada com `imagegen`, em modo nativo e com transparência real; os resultados foram recortados, redimensionados e exportados para WebP com alpha.

| Seção | Peças e posição |
|---|---|
| Apresentação | `1-top-left.webp` e `1-bottom-right.webp`. |
| História | `2-top-right.webp` e `2-bottom-left.webp`. |
| Evento | `3-top-right.webp` e `3-bottom-left.webp`, menores para preservar espaço. |
| Confirmação/presentes | `4-top-left.webp`, `4-top-right.webp`, `4-bottom-left.webp`, `4-bottom-right.webp`. |
| Fechamento | `5-top.webp` e `5-bottom.webp`, faixas com transição gradual de alpha para o fundo creme. |
| Fechamento desktop, ≥768px | `5-top-desktop.webp` (800×77px) e `5-bottom-desktop.webp` (800×91px), recompostos horizontalmente a partir do estilo dos florais anteriores. |

- **14 peças:** as 12 iniciais foram preservadas; os cantos são compartilhados entre formatos e as únicas variantes são as duas faixas do fechamento desktop. Abaixo de 768px, o fechamento mantém os assets anteriores.
- `::before` e `::after` compõem as camadas; conteúdo acima, `pointer-events: none` e nenhuma semântica informativa nas imagens.
- `--floral-top-size` e `--floral-bottom-size` controlam os cantos; o fechamento usa `--floral-head-height` e `--floral-foot-height`.
- Proporções preservadas, com recortes deliberados nas bordas e área central livre para leitura.
- Flores com mais presença na capa e história; evento e confirmação/presentes preservam espaço para os textos. No desktop, o fechamento usa faixas mais discretas.
- A superfície é definida pelo CSS. Não há papel creme incorporado aos assets, nem retângulos de cor ou quadriculado.
- No fechamento, máscaras CSS suavizam a passagem das faixas para a área de texto sem esticar a arte.
- Ausência/falha das imagens não altera as dimensões ou a legibilidade do conteúdo.

Origens, prompts, recortes, dimensões e pesos estão no [registro dos assets](plans/2-assets.md). O arquivo `5-exemplo-recorte.jpeg` não é usado: seu quadriculado está gravado no JPEG.

### Revisão visual da tarefa 2

Larguras dos arranjos em pixels CSS, na ordem topo/base; em confirmação/presentes, o valor vale para cada canto do respectivo par.

| Seção | Desktop, a partir de 768px | Retrato confortável | Retrato intermediário |
|---|---|---|---|
| Apresentação | 240/260 | `clamp(180px, 55vw, 240px)` nos dois cantos | 135/135 |
| História | 190/210 | 195/195 | 135/150 |
| Evento | 190/180 | Base 110/125, com crescimento por altura | Base 85/95, com crescimento por altura |
| Confirmação/presentes | 180/160 | 140/140 | 96/80 |

O modo compacto mantém as medidas anteriores: apresentação 110/110, história 85/100, evento 52/65 e confirmação/presentes 44/48. A revisão não reduz fontes nem muda a escolha de densidade. A paisagem de smartphone mantém a composição anterior.

No evento em retrato, a base da densidade é preservada até 668px de altura. Entre 668 e 956px, o CSS acrescenta linearmente até 70px no topo e 55px na base, com limite superior; em 440×956, os arranjos chegam a 180/180px. Usar `100dvh`, com fallback para `100vh`. O modo compacto não cresce.

No fechamento a partir de 768px, as novas faixas têm 77px no topo e 91px na base e ocupam 100% da largura útil. O padding acompanha as alturas, com respiro de 32px. As flores foram recompostas, recortadas e redimensionadas uniformemente, sem achatamento.

O fechamento em retrato mobile permanece igual: faixas de 145/175px no modo confortável, 105/125px no intermediário e 60/75px no compacto; respiros de 20px ou 8px no compacto. Em paisagem abaixo de 768px, as faixas anteriores mantêm 220/260px e respiros de 32px.

## 3. Componentes

- `.section-title`: título serifado terracota, caixa alta.
- `.body-text`: corpo marrom centralizado, até 29rem de largura.
- `.rsvp-deadline`: preserva o texto do prazo; a partir de 768px pode chegar a 640px e mantém a data agrupada, evitando o ano isolado. No mobile, mantém a quebra natural do parágrafo.
- `.script`: caligrafia terracota, restrita a nomes e frases curtas.
- `.divider-heart`: duas linhas e coração, decorativo; largura máxima limitada ao espaço disponível.
- `.btn-primary`: terracota, texto branco, raio de 4px e hover mais escuro.
- `.btn-outline`: borda/texto terracota, fundo transparente e hover suave.
- `.icon`: SVG inline, traço de 1,6; complementa rótulos em texto.
- `.modal`: dialog nativo, superfície clara, até 420px, backdrop quente e rolagem interna acessível.

Botões e indicadores têm alvos mínimos de 44×44px; foco visível de 2px com afastamento de 5px. Indicadores inativos mantêm contraste de pelo menos 3:1; o ativo também se diferencia pela largura. A confirmação mantém aparência primária e permanece sem ação.

## 4. Retrato sem rolagem

Em largura abaixo de 768px e orientação retrato, o convite usa o carrossel de cinco slides, altura dinâmica com fallback e áreas seguras.

- Sete controles em **uma linha desde 320px**, preservando os alvos de toque. Abaixo disso, os indicadores podem ocupar mais linhas.
- Conteúdo centralizado e integralmente visível desde **320×480 pixels CSS**, sem área rolável na página ou nos slides em uso normal.
- Medir os cinco slides na altura efetivamente disponível e tentar, em ordem, os modos confortável, intermediário e compacto; escolher o primeiro em que todos cabem.
- O modo intermediário diminui espaços, tipografia e florais. O compacto torna os ícones do evento/presentes blocos menores, retira divisores do evento e o primeiro da confirmação e reduz margens decorativas; preserva todos os textos e ações.
- Recalcular após carregamento de fontes, redimensionamento e alteração do viewport interno observada por ResizeObserver, incluindo redução de altura sem mudança de orientação. Não depender de cortes fixos de media query para garantir o encaixe.
- Em alturas compactas, reduzir o respiro do fechamento para acomodar também as fontes alternativas.
- Não escalar a interface inteira ou reduzir os alvos de toque para fazê-la caber.
- Modais, zoom/texto ampliado e áreas menores que a matriz mantêm rolagem de segurança quando necessária.

O critério é medir o conteúdo dentro da área disponível; esconder overflow não substitui o encaixe real.

## 5. Paisagem, tablet, desktop e acessibilidade

- Cinco seções em uma coluna, altura natural e largura máxima de 800px, sem controles de carrossel.
- Florais dentro de cada seção, com parágrafos mais estreitos que o container.
- Mesmos elementos HTML dos slides; preservar a seção em leitura ao girar/redimensionar.
- Fechamento com frase, nomes e data sobre creme, emoldurados pelas faixas florais; sem foto ou texto branco sobre imagem.
- Zoom liberado, contraste AA, controles nomeados e `prefers-reduced-motion`.
- Modais com Escape, backdrop, foco contido e retorno ao acionador.
- Sem JavaScript, todas as seções permanecem em fluxo vertical; sem fontes, o layout e as funções locais continuam disponíveis.

Resultados e limites da validação no [registro da tarefa 2](plans/2-validation.md).

## 6. Histórico

| Versão | Data | Alteração |
|---|---|---|
| 1.0.0 | 22/10/2026 | Identidade inicial. |
| 1.1.0 | 22/10/2026 | Paleta e composições dos cinco mockups. |
| 1.2.0 | 22/10/2026 | Variante sem imagens, CSS próprio, Parisienne, SVG inline e fluxo vertical até 800px fora do celular em retrato. |
| 1.3.0 | 22/10/2026 | Florais WebP transparentes e composição por altura para retrato sem rolagem desde 320×480; dist/ preservado. |
| 1.3.1 | 22/10/2026 | Revisão da tarefa 2: florais maiores nos slides indicados, fechamento desktop mais discreto e prazo sem ano isolado. |
| 1.3.2 | 22/10/2026 | Evento cresce em celulares altos; duas faixas desktop de 800×77/91px, encerramento mobile preservado e plano 2 consolidado. |
| 1.3.3 | 22/10/2026 | V2 aprovada e espelhada em dist/ para publicação pelo workflow existente. |
