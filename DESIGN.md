# Design System — Tatiana & Tiago

**Versão:** 1.3.4 · **Atualização:** 22 de outubro de 2026

**Evento:** 20 de fevereiro de 2027 · **Implementação atual:** `src/index.html`, com 14 florais e quatro fotografias WebP locais, espelhados em `dist/` após aprovação final.

**Escopo:** [plano 2 consolidado](plans/2-plan.md), imagens do convite: florais e fotografia do casal. Entrega final aprovada para merge na `main` e publicação.

A tarefa 2 acrescenta florais às cinco seções e, em sua última etapa, a fotografia no encerramento. Mantém conteúdo, interações e os quatro primeiros slides aprovados.

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
| Fechamento abaixo de 768px | Somente `5-bottom.webp`, sobre a fotografia. `5-top.webp` preservado como histórico. |
| Fechamento desktop, ≥768px | Somente `5-bottom-desktop.webp` (800×91px), recomposto horizontalmente. A faixa superior de 800×77px permanece como histórico. |

- **14 peças:** as 12 iniciais foram preservadas; os cantos são compartilhados entre formatos e as únicas variantes são as duas faixas do fechamento desktop. O encerramento fotográfico consome somente as bases; as duas faixas superiores anteriores ficam preservadas, sem uso.
- Nos quatro primeiros slides, `::before` e `::after` compõem os cantos; no encerramento, representam gradientes e flores inferiores. Fotografia em picture/img acessível, atrás dos textos; camadas decorativas com `pointer-events: none`.
- `--floral-top-size` e `--floral-bottom-size` controlam os cantos; o encerramento usa `--closing-flowers` e `--closing-photo-scale`.
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

### Encerramento fotográfico — estado final

- Retrato em carrossel: foto original proporcional; confortável com frase em três linhas inclinadas, 52px; intermediário/compacto com duas linhas sem inclinação, 38/28px.
- Fluxo vertical: fotografia horizontal, altura mínima de 720px no desktop e 560px na paisagem estreita. Frase em duas linhas, 54px no desktop e 44px na paisagem estreita, inclinação de −5°.
- Frase/divisor em `#8D2E21`; assinatura e data em `#FFF8EF`. Gradiente superior creme com alpha 184/255 até 28%, desaparecendo em 48%; gradiente inferior escuro começa em 56% e chega a alpha 191/255 em 73%.
- Assinatura de 46/32/26px e data de 18/16/14px nas densidades confortável/intermediária/compacta; desktop 42/18px.
- Flores somente na base: 120/85/50px por densidade; 72px em paisagem estreita; 91px a partir de 768px. Respiro inferior adicional de 12px, ou 10px no compacto.
- Picture reserva a camada fotográfica, usa source horizontal em paisagem ou largura ≥768px, srcset e loading lazy. A imagem usa object-fit cover, posição central inferior e escala uniforme de 1,25 no vertical, 1,2 no carrossel ou 1 no compacto. Recortes preservam rostos e beijo; não alongar a imagem.
- Foto em quatro WebP: retrato 480×860/768×1376 e paisagem 800×600/1200×900. A região original do casal é restaurada antes da compressão; cenário lateral gerado. Nenhum retoque facial ou cromático adicional.
- Sem foto, os gradientes e a superfície creme preservam leitura. A ampliação mantém rolagem de segurança. Inventário, prompts e prova de preservação no registro dos assets.

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
- Encerramento com fotografia: frase no céu, assinatura/data claras acima dos florais inferiores e gradientes localizados. Os textos ficam fora dos rostos nos enquadramentos validados.
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
| 1.3.4 | 22/10/2026 | Encerramento fotográfico responsivo, casal protegido, frase terracota e assinatura clara, flores somente na base; tarefa 2 final aprovada para publicação. |
