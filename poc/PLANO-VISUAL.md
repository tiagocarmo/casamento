# PLANO-VISUAL.md — Fidelidade ao mockup `convite-slides-mobile.JPG`

Objetivo: reproduzir no app a aparência do mockup (fundo creme, buquês florais, tipografia,
cores, espaçamentos), mantendo a interatividade atual (RSVP, mapa, swipe) e sem build.

## Decisões do usuário (2026-10-17) — não perguntar de novo

1. Foto do slide final: usa-se o recorte do próprio painel 5; o código fica preparado para trocar por um original em alta resolução depois (`assets/foto-casal.jpg`).
2. Não existem recortes prontos das flores → extrair do mockup.
3. Fonte script: manter a free (Great Vibes) se renderizar bem; se parecer estranha, testar Parisienne/Italianno. A original do mockup pode ser paga — não usar.
4. Horário **16h** e local **Monarca Casarão** confirmados.
5. Lista de presentes: botão único apontando para link externo real que ainda não existe → `href="#"` com comentário `TODO`.
6. Desktop: **layout responsivo full-bleed**, não a versão de celular em frame fixo.

## Fatos medidos na imagem

- 1536×1024 px; **5 painéis** de ~307×1024 (proporção 0,30), gutters brancos em x ≈ 306, 619, 922, 1223.
- Interior dos painéis (x): p1 2–304 · p2 308–617 · p3 621–920 · p4 924–1221 · p5 1225–1534.
- Mapeamento (6 slides): p1→1 · p2→2 · p3→3 · **p4→4 (RSVP) e 5 (Presentes)** · p5→6 (foto).
- Resolução baixa: recortes saem em tamanho ≈ nativo para 390px de largura (upscale ~1,3×); no canvas desktop (~560px) o upscale chega a ~1,8× — aceitável em aquarela, mas não esticar além disso.
- Ferramentas: **sem Python e sem ImageMagick** — PowerShell + `System.Drawing` (LockBits/GetPixel/Clone).

## Paleta e tipografia (amostradas do mockup)

| token | hex | uso |
|---|---|---|
| `creme` | `#F8EBDB` | fundo de tudo, full-bleed (remove `pergaminho` #F7F3EE e o fundo escuro #26211D) |
| `terracota` | `#B5402E` (botões medidos #B6402F / #B34330) | botões, ícones, corações, divisores, títulos caps, datas, scripts |
| `terracotaDark` | `#9A3523` | hover dos botões |
| `marrom` | `#2E1D12` | corpo de texto serif |

- Fontes: Great Vibes (script) + Cormorant Garamond (títulos/corpo). Montserrat sai; micro-labels viram serif caps.
- Tamanhos (mobile ~390px): kicker caps 12–13px tracking .2em · corpo 16px leading 1.65 · data caps 24–26px · script da capa ~84px (até ~100px em telas maiores) · demais scripts 36–44px.
- **Não usar `vw`** — px fixos com overrides `sm:`/`md:` (vw ignora o canvas).

## Responsividade (implementado)

- Raiz: fundo creme full-bleed, `h-screen` + `height: 100dvh` (com fallback), sem frame, sem sombra, sem borda.
- Cada slide tem um wrapper-canvas: `relative mx-auto h-full w-full max-w-[560px] overflow-hidden` — **flores e conteúdo dentro dele** (a composição do mockup escala junto, sem esticar em telas largas).
- Florais: `<img>` com `h-[N%]` + `object-fit: cover` + máscaras de fade (`.fade-b` no topo, `.fade-t` na base); em telas baixas/o largo as faixas são recortadas — corte intencional.
- Padding vertical dos blocos de conteúdo em **`vh`** (ex.: `pt-[34vh] pb-[30vh]`). Nunca `%`: no CSS, padding percentual resolve contra a LARGURA do bloco, não a altura.
- Script da capa: `.script-main { font-size: min(96px, 24vw, 10vh) }` — acompanha a largura mas nunca estoura a altura do slide.
- Slide 5 ancorado na base (`justify-end` + `pb-[18vh]`) para agrupar presente + texto + botão como no terço inferior do mockup.
- Navegação: setas + indicadores fixos no topo do canvas (discretos, terracota).

## Assets (pasta `assets/`) — recortes do mockup, prontos

Recortes feitos com PowerShell + `System.Drawing` direto do mockup (upscale ~1,3× no mobile, ~1,8× no canvas desktop de 560px — aceitável em aquarela). Fundo creme igual ao da página (`#F8EBDB`) ⇒ emenda invisível. Textos queimados que invadiam recortes foram apagados pintando retângulos creme.

| arquivo | tamanho | usado em |
|---|---|---|
| `assets/flores/p1-topo.png` | 302×300 | slide 1 (topo) |
| `assets/flores/p1-base.png` | 304×304 | slide 1 (base) |
| `assets/flores/p2-topo-dir.png` | 143×200 | slide 2 (canto sup. dir.) |
| `assets/flores/p2-base.png` | 309×380 | slide 2 (base) |
| `assets/flores/p3-topo-dir.png` | 120×198 | slide 3 (canto sup. dir.) |
| `assets/flores/p3-base.png` | 299×140 | slide 3 (base) |
| `assets/flores/p4-topo.png` | 96×206 | slides 4 e 5 (canto sup. esq.) |
| `assets/flores/p4-base.png` | 297×180 | slides 4 e 5 (base) |
| `assets/p5-completo.jpg` | 308×682 | slide 6 (foto + flores + assinatura "Tatiana & Tiago" + "20 \| 02 \| 2027" já queimados no recorte) |
| `assets/foto-casal.jpg` | 308×364 | reserva: só a foto, para futura troca por original em alta resolução |

- Descartados após inspeção: `p5-faixa` (viraria emenda sobre a foto), `p4-ramo` (colidia com texto), `p3-cauda` (só caule fino).
- Ícones: SVG inline em linha (stroke 1,4–1,8, terracota) — calendário, alianças, pin, presente, check/check-duplo, setas, coração. FontAwesome removido (não tem outline de presente/alianças).
- Círculos `bg-bordo/10` do código antigo não existem no mockup → removidos.

## Componentes (no index.html)

- `.floral` — `<img>` absoluta, `pointer-events-none`, `z-0`, posicionada por canto.
- `.divider-heart` — linha — ♥ (SVG) — linha, terracota.
- `.btn-primario` — `<button>` ou `<a>`; fundo terracota, texto branco caps tracking .12em, ícone à esquerda, cantos ~10px.
- `.kicker` — caps terracota, tracking .2em, semibold.
- Manter: carrossel translateX, swipe (limiar 50px), indicadores, modais (creme + botão terracota), toast (terracota).

## Especificação slide a slide

1. **Capa** — flores: `p1-topo-esq` (0–46% altura) + `p1-base` (74–100%).
   "NOSSO GRANDE DIA" (kicker 2 linhas) → ♥ → script "Tatiana & Tiago" (~84–100px; `&` serif itálico) → "20 | 02 | 2027" → kicker "UM NOVO CAPÍTULO DA NOSSA HISTÓRIA" → ♥. Remover badge "Convite Exclusivo para o Grupo".
2. **História** — `p2-topo-dir` + `p2-base`.
   Título caps 2 linhas → ♥ → 2 parágrafos → ♥ → script "Será um prazer ter você conosco!" (~40px). Remover botão "Ir para Confirmação".
3. **Data/Local** — `p3-topo-dir` + `p3-base-dir`.
   DATA → ♥ → calendário → "20 DE FEVEREIRO DE 2027" → "SÁBADO, ÀS 16H" → ♥ → CERIMÔNIA E RECEPÇÃO → alianças → parágrafo → ♥ → LOCAL → pin → "MONARCA CASARÃO" → "R. Praia Formosa, 247 / Alto Caiçaras / Belo Horizonte – MG" → botão "ABRIR NO MAPA" (link Google Maps por busca do endereço até existir link oficial).
4. **RSVP** — `p4-topo-dir` + `p4-base-esq`.
   "CONFIRME SUA PRESENÇA" → ♥ → "Sua presença tornará o nosso dia ainda mais especial!" → "Por favor, confirme sua presença até o dia 20 de janeiro de 2027." → lista de convidados (cards creme, traço fino, seleção terracota) → botão "✓ CONFIRMAR PRESENÇA".
5. **Presentes** — mesmas flores do slide 4.
   LISTA DE PRESENTES → ♥ → presente → "O melhor presente é ter você com a gente! Mas, se desejar nos presentear, preparamos uma lista especial." → **link** "ACESSAR LISTA DE PRESENTES" com `href="#"` + `<!-- TODO: link real -->`. Sem cotas/modal.
6. **Foto** — fundo único: `p5-completo.jpg` (cover, `object-position: 50% 28%`): já contém a foto, as flores, a assinatura "Tatiana & Tiago" e "20 | 02 | 2027" queimados, como no painel 5.
   O recorte não inclui o "céu" do mockup (a citação original está logo acima do enquadramento), então um degradê creme (`rgba(248,235,219)` 0% → 50%) faz o papel do céu no topo.
   Citação "O nosso para sempre começa aqui." renderizada ao vivo (script terracota + drop-shadow creme) → ♥. Sem texto duplicado sobre a assinatura.
   Troca futura por alta resolução: `assets/foto-casal.jpg` (só a foto) + os overlays de degradê/citação que já existem no HTML.

## Copy final (transcrita do mockup)

- S1: NOSSO GRANDE DIA · Tatiana & Tiago · 20 | 02 | 2027 · UM NOVO CAPÍTULO DA NOSSA HISTÓRIA
- S2: VOCÊ FAZ PARTE DESSA HISTÓRIA · "Estamos muito felizes em compartilhar com você um dos momentos mais especiais da nossa vida." · "Queremos que esteja ao nosso lado para celebrar o amor, a amizade e tudo o que construímos até aqui." · Será um prazer ter você conosco!
- S3: DATA · 20 DE FEVEREIRO DE 2027 · SÁBADO, ÀS 16H · CERIMÔNIA E RECEPÇÃO · "A cerimônia e a recepção acontecerão no mesmo local, para que possamos viver esse momento especial juntos do início ao fim." · LOCAL · MONARCA CASARÃO · R. Praia Formosa, 247 · Alto Caiçaras · Belo Horizonte – MG
- S4: CONFIRME SUA PRESENÇA · "Sua presença tornará o nosso dia ainda mais especial!" · "Por favor, confirme sua presença até o dia 20 de janeiro de 2027."
- S5: LISTA DE PRESENTES · "O melhor presente é ter você com a gente! Mas, se desejar nos presentear, preparamos uma lista especial."
- S6: O nosso para sempre começa aqui. · Tatiana & Tiago · 20 | 02 | 2027

## Interatividade preservada

- Swipe/setas/indicadores; RSVP com cookie+localStorage (`wedding_rsvp_token`); modal do mapa com endereço novo; toast terracota. Reset do RSVP: apagar a chave.

## Status (2026-10-17)

- F1–F5 concluídas (tokens, assets, slides 1–6, RSVP restilizado, presentes com link `#`).
- F6 — verificação feita: mobile 390×844 (iframe) e desktop 1600×1148; RSVP do zero → confirmar → recarregar (persiste) → alterar (volta com os confirmados pré-marcados); modal do mapa abre/fecha; setas, indicadores e swipe OK; console limpo (só o aviso esperado do Tailwind Play CDN).
- Pendências de conteúdo (não visuais): link real da lista de presentes; `tokenGuests` personalizado por convite; opcional trocar `p5-completo.jpg` por original em alta.

## Aceite (checklist)

- Cada slide lado a lado com o painel correspondente: flores nos cantos certos, sem texto sobre texto, sem overflow, sem emenda visível nos recortes.
- Responsivo: 390px, ~768px e ~1440px sem quebrar (canvas centrado, flores acompanhando).
- Swipe/setas; RSVP do zero e "já confirmado" (apagar cookie); modal do mapa; console limpo.
- Offline (CDN fora) degrada sem quebrar — limitação conhecida.
