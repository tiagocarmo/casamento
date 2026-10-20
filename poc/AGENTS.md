# AGENTS.md

Convite de casamento interativo (Tatiana & Tiago — 20/02/2027), página única em pt-BR.
Não é repositório git. Não há package.json, build, lint ou testes.

## Arquivos
- `index.html` — o app inteiro: HTML, CSS e JS (vanilla) num único arquivo.
- `convite-slides-mobile.JPG` — mockup com **5 painéis** de ~307×1024 e **referência visual oficial** (layout, fundo creme, flores, tipografia). O app usa 6 slides: o painel 4 do mockup (RSVP + presentes) vira os slides 4 e 5, e o painel 5 (foto) é o slide 6.
- `assets/` — recortes do próprio mockup (não existem originais das flores): `assets/flores/*.png` (8 buquês com fundo creme), `assets/p5-completo.jpg` (fundo do slide 6 inteiro: foto + flores + assinatura + data queimados) e `assets/foto-casal.jpg` (só a foto, reserva para troca por alta resolução).
- `PLANO-VISUAL.md` — plano de fidelidade visual: paleta amostrada, tabela de assets, especificação slide a slide e status da verificação.

## Verificação
- Sem suíte de testes. Abrir `index.html` direto no navegador (file://) — não precisa de servidor. Tailwind e Google Fonts vêm de CDN; offline a página fica sem estilo.
- Testar em ~390px (celular) e em desktop largo (~1280–1920px): o layout é responsivo full-bleed, sem frame de celular fixo.
- O navegador das ferramentas só aceita http(s): para testar por elas, servir a pasta (ex.: `HttpListener` do PowerShell) e abrir `http://localhost:PORT/index.html`.
- RSVP persiste 30 dias em cookie + localStorage `wedding_rsvp_token`. Para testar do zero, apague a chave; senão o app abre na tela "Presença Já Confirmada".

## Como o index.html é montado
- Carrossel de 6 slides em `#slidesContainer` via `translateX(-N*100%)`; navegação por setas, barras indicadoras, swipe (limiar 50px) e `goToSlide(i)`. O slide 4 (RSVP) não tem comentário `<!-- SLIDE 4 -->`.
- Adicionar/remover slide exige 3 edições: bloco do slide, um `<div class="indicator-bar" onclick="goToSlide(i)">` por slide, e a constante `totalSlides`.
- Cada slide tem um wrapper-canvas `relative mx-auto h-full w-full max-w-[560px] overflow-hidden` com **florais e conteúdo dentro** (fora dele, só o fundo creme full-bleed). Florais = `<img>` absoluta por canto, `h-[N%]` + `object-fit: cover` + máscaras de fade `.fade-t`/`.fade-b` (classes no `<style>` do head).
- Tokens no `tailwind.config` inline do `<head>`: cores `creme` (#F8EBDB), `terracota` (#B5402E), `terracotaDark`, `marrom`; fontes `script` (Great Vibes) e `serif` (Cormorant Garamond). Montserrat e FontAwesome foram removidos — ícones são SVG inline e micro-labels serif caps. Usar os tokens, não hex solto.
- **Padding vertical dos slides em `vh`, nunca `%`** — no CSS, padding percentual resolve contra a largura do bloco, não a altura. A fonte da capa usa `.script-main { font-size: min(96px, 24vw, 10vh) }`.
- Fluxos JS: `renderGuestList()`/`submitRSVP()` (lista fixa `tokenGuests`, sem backend), `checkStoredRSVP()`/`editRSVP()` (troca de telas; ao editar, pré-marca os confirmados do token), `openModal`/`closeModal('mapModal')`, `showToast()`.
- Tailwind é o Play CDN: classes geradas em runtime, inclusive as injetadas por template string no JS. Não remover o CDN nem introduzir build sem pedido explícito.

## Personalização por convite (TODOs de conteúdo)
- `tokenGuests` contém nomes placeholder (inclusive dos noivos) — cada convite deve ser personalizado por grupo.
- Lista de presentes: o botão aponta para `href="#"` com comentário `TODO` no código — falta o link externo real.
- Slide 6 pode trocar `assets/p5-completo.jpg` por original em alta resolução (a foto sola está em `assets/foto-casal.jpg`; os overlays de degradê/citação já existem no HTML).
