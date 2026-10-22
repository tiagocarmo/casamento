# Design System — Casamento Tatiana & Tiago

**Data do Evento:** 20 de fevereiro de 2027
**Versão:** 1.1.0
**Atualizado em:** 22 de outubro de 2026
**Fonte de verdade visual:** `slides/convite-1.png` a `slides/convite-5.png`
**Assets de implementação:** `slides-bg/1.jpeg` a `slides-bg/5.jpeg`

> Esta versão substitui a paleta e a tipografia da versão 1.0.0, alinhando o design system aos mockups atuais de 5 slides.

---

## 1. Fundações (Design Tokens)

### 1.1 Paleta de Cores

| Token | Valor | Uso |
|---|---|---|
| `--color-primary` | `#B5422F` | Terracota principal: CTAs, títulos em destaque, ícones e divisores. |
| `--color-primary-dark` | `#9B3727` | Estado hover dos botões e ênfase. |
| `--color-secondary` | `#4A3530` | Marrom sépia para textos corridos, parágrafos e legendas. |
| `--color-bg` | `#F6E9D9` | Fundo creme dos slides 1 a 4. |
| `--color-surface` | `#FAF1E6` | Superfícies de modal e áreas de respiro. |
| `--color-white` | `#FFFFFF` | Texto sobre foto e sobre botões primários. |
| `--color-magenta` | `#A00030` | Acento floral: rosas e peônias. |
| `--color-coral` | `#E06D41` | Acento floral: flores coral e laranja. |
| `--color-olive` | `#6B6B3A` | Acento floral: folhas e ramagens. |
| `--color-overlay` | `rgba(46, 29, 18, 0.35)` | Película quente sobre a foto do slide 5. |

**Regras de contraste:**
- Texto corrido sempre em `--color-secondary` sobre `--color-bg`.
- Texto sobre foto sempre em branco ou terracota, com overlay suficiente para garantir leitura.
- Acentos florais são exclusivos das ilustrações; não usar em textos longos.

### 1.2 Tipografia

| Papel | Fonte | Uso |
|---|---|---|
| Display / Caligrafia | Great Vibes, Parisienne ou asset caligráfico | Nomes dos noivos, frase do slide 5 e destaques afetivos. |
| Heading / Body | Cormorant Garamond (400/500/600 e itálicos) | Títulos em caixa alta, textos corridos, datas e endereços. |

**Escala modular:**
- **H1 (caligrafia):** 36px–42px — nomes dos noivos.
- **H2 (caixa alta):** 18px–22px — títulos de seção.
- **Body:** 14px–16px — informações, datas e endereços.
- **Caption:** 12px — detalhes e legendas.
- **Kicker:** 11px–13px, caixa alta, `letter-spacing` de 0.22em–0.35em.

**Regras:**
- Caligrafia nunca é usada em textos longos.
- Títulos em caixa alta usam Cormorant Garamond com tracking generoso.
- Evitar pesos abaixo de 400 em textos pequenos.

### 1.3 Assets e composições florais

- **Slide 1:** `slides-bg/1.jpeg` — arranjo no topo e arranjo na base.
- **Slide 2:** `slides-bg/2.jpeg` — arranjo no canto superior direito e arranjo na base.
- **Slide 3:** `slides-bg/3.jpeg` — arranjo no canto superior direito e arranjo na base.
- **Slide 4:** `slides-bg/4.jpeg` — arranjos no topo esquerdo, topo direito e base.
- **Slide 5:** composição com foto, moldura floral e textos; `slides-bg/5.jpeg` e `slides-bg/5-exemplo-recorte.jpeg` são referências de recorte.
- **Regra:** os florais emolduram o conteúdo e nunca cobrem texto ou controles.
- **Ícones:** SVG inline, traço 1,4–1,8, na cor primária.

---

## 2. Biblioteca de Componentes

### 2.1 Botões

#### `.btn-primary`

- **Background:** `--color-primary` (`#B5422F`).
- **Texto/ícone:** branco, caixa alta, `letter-spacing` de 0.12em.
- **Formato:** cantos levemente arredondados, largura fluida ou fixa centralizada.
- **Ícone:** à esquerda do texto.
- **Estados:**
  - default: `#B5422F`;
  - hover: `#9B3727`;
  - active: leve redução de opacidade ou escala;
  - focus: anel visível de 2px com contraste.

#### `.btn-outline`

- **Background:** transparente.
- **Borda e texto:** `--color-primary`.
- **Uso:** ações secundárias, como “Voltar”.
- **Hover:** fundo terracota com 8% de opacidade.

#### Placeholder

- O botão “Confirmar Presença” segue o estilo `.btn-primary`, mas usa `href="#"` e não possui ação nesta versão.
- Não deve ser exibido como desabilitado; a aparência segue o mockup.

### 2.2 Divisores

- `.divider-heart`: linha horizontal fina na cor primária com um coração centralizado.
- Usado para separar blocos de conteúdo e reforçar a identidade visual.

### 2.3 Textos

- `.kicker`: caixa alta, tracking amplo, cor primária.
- `.body-text`: Cormorant Garamond, 14px–16px, cor secundária, entrelinha 1,6–1,7.
- `.script`: caligrafia para nomes e frases afetivas.

### 2.4 Modais

- `.modal`: overlay quente escuro com opacidade controlada.
- `.modal-card`: fundo `--color-surface`, largura máxima de 360px–420px, padding generoso, cantos discretos.
- Conteúdo: título, texto, botão principal e botão “Voltar”.
- Fechamento por botão, `ESC` ou clique no backdrop.
- Foco preso no modal enquanto aberto e devolvido ao botão de origem ao fechar.

### 2.5 Slides

- `.slide`: ocupa 100% da largura e da altura da viewport.
- Fundo em `background-size: cover`, com recorte controlado.
- Conteúdo centralizado verticalmente, com paddings em `vh`.
- No desktop, o convite é exibido em card central de até 480px.

### 2.6 Navegação

- **Indicadores:** 5 barras no topo; a ativa é mais larga e opaca.
- **Setas desktop:** botões circulares fixos nas laterais.
- **Setas mobile:** botões no cabeçalho, ao lado dos indicadores.
- **Swipe:** limiar de 45px.
- **Teclado:** setas e PageUp/PageDown.

---

## 3. Padrões de Contexto dos Slides

### 3.1 Slides 1 a 4 — Fundo creme com florais

- **Fundo:** `--color-bg` (`#F6E9D9`) ou asset floral correspondente.
- **Texto:** `--color-secondary` para corpo; `--color-primary` para títulos, ícones e CTAs.
- **Composição:** florais no topo e na base, conforme o mockup, sem invadir a área de texto.
- **Botões:** `.btn-primary` para ação principal.

### 3.2 Slide 5 — Foto com overlay

- **Fundo:** foto do casal com overlay quente.
- **Frase:** caligrafia em terracota.
- **Nomes e data:** brancos, com contraste garantido pelo overlay.
- **Florais:** moldura na base, sem cobrir os rostos.
- **Alternativa:** composição final em imagem única, desde que mantenha a legibilidade e a fidelidade ao mockup.

---

## 4. Responsividade e Acessibilidade

### 4.1 Responsividade

- Mobile-first, com baseline em 390×844.
- Validar em 768×1024 e 1280–1920px.
- `#stage` com `100vh` e fallback para `100dvh`.
- Card central de até 480px no desktop.
- Paddings verticais em `vh`; nunca `%`.
- Testar recorte dos fundos em telas muito estreitas e muito largas.

### 4.2 Acessibilidade

- Não usar `user-scalable=no` nem `maximum-scale=1`.
- Navegação completa por teclado.
- `aria-label` nos controles de navegação.
- `alt` descritivo em imagens informativas; `alt=""` em decorativas.
- Foco visível em todos os elementos interativos.
- Modais com `ESC`, backdrop, foco preso e restauração de foco.
- Respeitar `prefers-reduced-motion`.
- Contraste mínimo AA para textos e botões.

---

## 5. Notas de Implementação

- Tokens devem ser declarados como CSS variables no `:root` e replicados no `tailwind.config` inline.
- Os fundos disponíveis têm 768×1376 e podem ser usados com `cover`; substituir por alta resolução antes do go-live.
- O convite não coleta dados: sem cookies, `localStorage`, analytics ou lista de convidados.
- O modal de presentes contém apenas o link externo da lista; não há meio de pagamento no app.
- O botão “Confirmar Presença” é um placeholder sem ação nesta versão.
- Links externos abrem em nova aba com `rel="noopener noreferrer"`.

---

## 6. Histórico de Versões

| Versão | Data | Mudança |
|---|---|---|
| 1.0.0 | 22/10/2026 | Versão inicial, com paleta `#FDF9F2` / `#9E3C29` / `#4A3530`. |
| 1.1.0 | 22/10/2026 | Paleta e tipografia alinhadas aos mockups de 5 slides; regras de composição floral, modais e acessibilidade atualizadas. |
