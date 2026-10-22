# Design System — Tatiana & Tiago

**Versão:** 1.2.0 · **Atualização:** 22 de outubro de 2026

**Evento:** 20 de fevereiro de 2027 · **Implementação:** `src/index.html`, com cópia aprovada em `dist/index.html`.

**Escopo:** [plano 1](plans/1-plan.md), estrutura sem imagens.

A primeira etapa preserva a identidade editorial dos mockups, usando apenas tipografia, espaços, linhas e ícones SVG inline. Fotos, florais e composições com imagens serão trabalhados na tarefa 2. Não reservar áreas vazias para esses assets.

## 1. Tokens

| Token | Valor | Uso |
|---|---|---|
| `--color-primary` | `#B5422F` | Títulos, ícones, divisores e botões. |
| `--color-primary-dark` | `#9B3727` | Hover e foco. |
| `--color-secondary` | `#4A3530` | Corpo e informações do evento. |
| `--color-bg` | `#F6E9D9` | Fundo da página, carrossel e fechamento. |
| `--color-surface` | `#FAF1E6` | Seções na página vertical e modais. |
| `--color-white` | `#FFFFFF` | Texto de botões primários. |
| `--color-line` | `#B5422F45` | Bordas decorativas. |
| `--page-width` | `800px` | Limite da página vertical. |
| `--slide-duration` | `.52s` | Transição do carrossel. |
| `--slide-easing` | `cubic-bezier(.22, 1, .36, 1)` | Curva da transição. |

Tokens centralizados em `:root`, sem Tailwind. As cores magenta, coral e oliva das referências ficam reservadas às imagens futuras, sem uso nos textos desta etapa.

## 2. Tipografia

| Papel | Fonte e escala |
|---|---|
| Corpo e títulos | Cormorant Garamond 400/500/600; alternativas Georgia e Times New Roman. |
| Caligrafia | Parisienne 400; alternativas Brush Script MT e cursiva do sistema. |
| Nomes da capa | 64–94px no fluxo vertical; 56–80px no carrossel; 32px abaixo de 240px. |
| Títulos | 22px no fluxo vertical; 19px no carrossel; caixa alta e tracking de .12em. |
| Corpo | 20px no fluxo vertical; 18px no carrossel, com entrelinha de 1,55–1,65. |
| Kicker | 13px, peso 600, caixa alta, tracking de .24em. |
| Frases caligráficas | 35–50px conforme seção e formato; 28px abaixo de 240px no carrossel. |
| Botões | 14px, ou 13px em telas abaixo de 360px; peso 600. |

As escalas redistribuem os espaços dos mockups sem imagens. Caligrafia limitada a nomes e frases curtas; textos longos têm largura de leitura restrita. Não depender da fonte remota para caber o conteúdo: a alternativa também deve ser alcançável por rolagem.

## 3. Componentes

- `.section-title`: título serifado, terracota, caixa alta e tracking moderado.
- `.body-text`: texto marrom, centralizado, até 29rem de largura.
- `.script`: caligrafia terracota.
- `.divider-heart`: duas linhas finas com coração central, decorativo e oculto da leitura assistiva.
- `.btn-primary`: terracota, texto branco, borda e raio de 4px; hover mais escuro.
- `.btn-outline`: borda/texto terracota, fundo transparente e hover suave.
- `.icon`: SVG inline, traço de 1,6, sem biblioteca externa; ícones decorativos não substituem rótulos.
- `.modal`: dialog nativo, superfície clara, largura máxima de 420px, backdrop quente, rolagem interna e ações empilhadas.

Botões e indicadores têm alvos mínimos de 44×44px; texto pode quebrar em telas estreitas. Foco visível de 2px com afastamento de 5px. O placeholder de confirmação mantém a aparência do botão primário, mas não realiza ação.

## 4. Composição e formatos

### Celular em retrato, largura menor que 768px

- Carrossel de cinco slides em altura de viewport dinâmica, com fallback de `100vh`.
- Cabeçalho com setas e cinco indicadores. Abaixo de 360px, usar duas ou mais linhas e contador para preservar os alvos de toque; indicadores quebram conforme o espaço disponível.
- Conteúdo centralizado quando couber; rolagem vertical interna quando exceder a área disponível.
- Indicador ativo mais largo e opaco; slides inativos inertes.
- Respeitar áreas seguras do aparelho, zoom e gestos verticais.

### Paisagem, tablet e desktop

- Cinco seções em uma coluna, com altura natural, sem controles de carrossel.
- Conteúdo centralizado em até 800px; margens externas de 24px e borda discreta a partir de 768px.
- Espaçamento vertical generoso e divisões finas entre seções; parágrafos mais estreitos que o container.
- Mesmos elementos HTML dos slides; preservar a seção em leitura na mudança de modo.

### Fechamento nesta etapa

Frase, assinatura e data em terracota sobre creme. Não usar texto branco, overlay de fotografia ou área reservada para imagem inexistente.

## 5. Acessibilidade e validação

- Zoom liberado, contraste AA e controles com nomes acessíveis.
- `prefers-reduced-motion` elimina transições.
- Modais com Escape, backdrop, foco contido e retorno ao acionador.
- Sem JavaScript, todas as seções permanecem em fluxo vertical.
- Sem Google Fonts, o CSS e as funcionalidades locais continuam disponíveis.
- Validar as dimensões e comportamentos do [plano](plans/1-plan.md); resultados no [registro de validação](plans/1-validation.md).

## 6. Referências futuras e histórico

Os arquivos `slides/convite-1.png` a `convite-5.png` são referências visuais. `slides-bg/1.jpeg` a `5.jpeg` e o exemplo de recorte ficam reservados à tarefa 2; não são requisitados pela versão atual.

| Versão | Data | Alteração |
|---|---|---|
| 1.0.0 | 22/10/2026 | Identidade inicial. |
| 1.1.0 | 22/10/2026 | Paleta e composições dos cinco mockups. |
| 1.2.0 | 22/10/2026 | Variante sem imagens, CSS próprio, Parisienne, SVG inline e fluxo vertical até 800px fora do celular em retrato. |
