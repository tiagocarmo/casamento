# PRD — Convite de Casamento Tatiana & Tiago

**Versão:** 1.1.0
**Data:** 22 de outubro de 2026
**Status:** Especificação da versão de 5 slides. RSVP fora do escopo desta versão.
**Idioma do produto:** português do Brasil (pt-BR)
**Referência visual:** `slides/convite-1.png` a `slides/convite-5.png`
**Assets de implementação:** `slides-bg/1.jpeg` a `slides-bg/5.jpeg`

> Esta versão substitui a especificação anterior, de 6 slides. O botão **“Confirmar Presença”** é um placeholder (`href="#"`) e não possui funcionalidade nesta entrega: não abre modal, não coleta dados e não registra presença. A evolução futura do RSVP está registrada na seção 12.

---

## 1. Contexto e visão

O produto é o convite digital de casamento de **Tatiana & Tiago**, celebrado em **20 de fevereiro de 2027 (sábado), às 16h**, no **Monarca Casarão**, em Belo Horizonte – MG.

O convite é uma experiência de página única, com estética editorial e floral, organizada em **5 slides**:

1. **Apresentação** — casal e data.
2. **História** — mensagem afetiva de convite.
3. **Data** — data, cerimônia, recepção e localização.
4. **Confirmação e Presentes** — chamada para confirmar presença (placeholder) e acesso à lista de presentes.
5. **Fechamento** — foto do casal e assinatura.

A proposta é construir um único arquivo HTML, sem backend, sem build e sem dependência de framework.

### 1.1 Problema que resolve

- Centralizar as informações do evento em um link único e fácil de compartilhar.
- Direcionar convidados que desejam presentear para o link oficial da lista.
- Reduzir dúvidas sobre data, horário, local e validação de entrada.
- Entregar uma experiência elegante, leve e adequada ao celular.

### 1.2 Princípios do produto

- **Mobile-first:** a experiência principal acontece no celular em formato retrato, com suporte a paisagem e desktop.
- **Fidelidade ao mockup:** paleta creme/terracota, tipografia serifada, caligrafia e composições florais.
- **Simplicidade operacional:** um link, sem cadastro e sem senha.
- **Privacidade por padrão:** esta versão não coleta, armazena nem transmite dados pessoais.
- **Sem backend:** todo o conteúdo é estático; links externos só abrem por ação do convidado.

---

## 2. Objetivos e não objetivos

### 2.1 Objetivos

1. Comunicar todas as informações do casamento de forma clara e visualmente coerente.
2. Direcionar convidados para a lista oficial de presentes.
3. Reduzir dúvidas sobre local, horário e validação de entrada.
4. Entregar uma experiência rápida e elegante em qualquer dispositivo.

### 2.2 Não objetivos

- Implementar confirmação de presença (RSVP) nesta versão.
- Coletar, armazenar ou sincronizar dados de convidados.
- Processar pagamentos, cotas ou reservas de presentes.
- Oferecer painel administrativo, exportação de lista ou relatórios.
- Enviar e-mail, SMS ou WhatsApp automaticamente.
- Ter backend, API, banco de dados ou autenticação.
- Ter analytics, testes automatizados, lint ou build.
- Oferecer internacionalização (apenas pt-BR).
- Ser indexado por buscadores.

### 2.3 Evolução futura

A confirmação de presença por grupo é uma evolução planejada, fora do escopo desta versão. Quando implementada, deverá substituir o placeholder do slide 4 e seguir as diretrizes da seção 12.

---

## 3. Público-alvo e personas

### 3.1 Convidado

- Recebe o link por WhatsApp ou e-mail.
- Acessa predominantemente pelo celular, muitas vezes em rede móvel.
- Precisa entender data, local e como acessar a lista de presentes.
- Pode não ter intimidade com tecnologia; a interface deve ser óbvia e tolerante a erro.

### 3.2 Noivos (Tatiana & Tiago)

- Compartilham o link do convite.
- Precisam que informações, links e assets estejam corretos.
- Acompanham a lista de presentes diretamente na plataforma externa.

### 3.3 Cerimonialista

- Não participa do fluxo desta versão, pois não há coleta de confirmações.
- Será envolvida apenas na evolução futura de RSVP, quando houver lista de presença a validar.

---

## 4. Escopo

### 4.1 Dentro do escopo

- Convite interativo de página única com **5 slides**.
- Navegação por toque, setas, indicadores, teclado e link direto.
- Conteúdo institucional do casamento e do evento.
- Modal de localização e link para o Google Maps.
- Modal de presentes e link externo para a lista oficial.
- Layout responsivo mobile-first.
- Publicação estática via GitHub Pages.

### 4.2 Fora do escopo

- RSVP, lista de convidados, tokens, busca por nome, persistência local e comprovante via WhatsApp.
- Qualquer chave ou meio de pagamento dentro do convite.
- Backend, API, banco de dados e sincronização entre dispositivos.
- Autenticação, login ou verificação de identidade.
- Painel administrativo, exportação de lista ou relatórios.
- Envio automático de e-mail, SMS ou WhatsApp.
- Pagamentos, cotas ou reserva de presentes.
- Analytics, testes automatizados, lint e build.
- Internacionalização.
- Indexação pública e SEO.

### 4.3 Premissas

- Os mockups `slides/convite-1.png` a `convite-5.png` são a referência visual canônica.
- Os arquivos `slides-bg/1.jpeg` a `5.jpeg` são a base para implementação.
- O link da lista de presentes é provisório até a definição do endereço oficial.
- Os assets disponíveis ainda não estão em alta resolução.
- Não haverá coleta de dados nesta versão.

---

## 5. Requisitos funcionais

### FR-01 — Página única com carrossel de 5 slides

**Descrição:** a aplicação é um único documento HTML que ocupa a viewport e apresenta 5 slides horizontais, sem recarregar a página.

**Regras:**
- Ordem: 1) Apresentação; 2) História; 3) Data; 4) Confirmação e Presentes; 5) Fechamento.
- Cada slide ocupa 100% da largura do container e a altura total da viewport.
- A transição usa `translateX(-N × 100%)` com duração de 0,52s e curva `cubic-bezier(0.22, 1, 0.36, 1)`.
- O slide inicial é o 1, salvo deep link.
- O primeiro slide é sempre exibido ao carregar.

**Critérios de aceite:**
- Existem exatamente 5 seções `.slide` e 5 indicadores.
- Nenhum scroll horizontal ou vertical indesejado na viewport.
- A troca de slide não recarrega a página.

---

### FR-02 — Navegação entre slides

**Descrição:** o convidado pode navegar de várias formas, com comportamento previsível.

**Regras:**
- **Desktop (≥ 768px):** botões circulares fixos nas laterais esquerda e direita.
- **Mobile (< 768px):** botões no cabeçalho, ao lado dos indicadores.
- **Indicadores:** 5 barras no topo; a ativa é mais larga e opaca; clique leva ao slide correspondente.
- **Swipe:** gesto horizontal com limiar de **45px**; swipe para a esquerda avança e para a direita retrocede.
- **Teclado:** `ArrowRight`/`PageDown` avançam; `ArrowLeft`/`PageUp` retrocedem.
- **Ciclo:** avançar no último slide volta ao primeiro; retroceder no primeiro vai ao último.
- `goToSlide(i)` limita o índice ao intervalo válido.

**Critérios de aceite:**
- Todos os métodos funcionam em 390px e em desktop.
- O indicador ativo acompanha o slide atual.
- Não há navegação duplicada ou fora de ordem.

---

### FR-03 — Slide 1: Apresentação

**Descrição:** apresentação do casal e da data.

**Conteúdo:**
- Fundo floral de `slides-bg/1.jpeg`.
- Kicker: “NOSSO GRANDE DIA”.
- Divisor com coração.
- Caligrafia “Tatiana & Tiago”.
- Data: “20 | 02 | 2027”.
- Kicker: “UM NOVO CAPÍTULO DA NOSSA HISTÓRIA”.
- Divisor com coração.
- Arranjo floral no topo (28% da altura) e na base (24%), valores aproximados para mobile retrato.

**Critérios de aceite:**
- A caligrafia não é cortada em 390px nem em telas altas.
- Os florais não cobrem texto.
- O slide é visualmente fiel ao mockup 1.

---

### FR-04 — Slide 2: História

**Descrição:** mensagem afetiva de convite.

**Conteúdo:**
- Fundo floral de `slides-bg/2.jpeg`.
- Título: “VOCÊ FAZ PARTE DESSA HISTÓRIA”.
- Dois parágrafos:
  - “Estamos muito felizes em compartilhar com você um dos momentos mais especiais da nossa vida.”
  - “Queremos que esteja ao nosso lado para celebrar o amor, a amizade e tudo o que construímos até aqui.”
- Caligrafia: “Será um prazer ter você conosco!”.
- Florais no canto superior direito e na base.

**Critérios de aceite:**
- Textos legíveis e sem sobreposição aos florais.
- A caligrafia é exibida sem distorção.
- O slide é visualmente fiel ao mockup 2.

---

### FR-05 — Slide 3: Data

**Descrição:** concentra as informações práticas do evento.

**Conteúdo:**
- Fundo floral de `slides-bg/3.jpeg`.
- **Data:** ícone de calendário; “20 DE FEVEREIRO DE 2027”; “SÁBADO, ÀS 16H”.
- **Cerimônia e recepção:** ícone de alianças; texto informando que ambos acontecem no mesmo local.
- **Local:** ícone de pin; “MONARCA CASARÃO”; “R. Praia Formosa, 247 — Alto Caiçaras / Belo Horizonte – MG”.
- Botão “ABRIR NO MAPA” que abre o modal de localização.
- Florais no canto superior direito e na base.

**Critérios de aceite:**
- Data, horário e endereço corretos.
- O botão abre o modal sem navegar para outra página.
- O bloco completo cabe na viewport de 390×844 sem corte.

---

### FR-06 — Modal de localização e link de mapa

**Descrição:** confirmação do endereço e abertura do mapa.

**Regras:**
- O modal exibe nome do local, endereço completo, botão “Fechar” e botão “Abrir Mapa”.
- “Abrir Mapa” abre o Google Maps em nova aba, via busca por:
  `Monarca Casarão, R. Praia Formosa, 247, Alto Caiçaras, Belo Horizonte - MG`.
- O modal fecha pelo botão “Fechar”, pela tecla `ESC` ou por clique no backdrop.
- O foco retorna ao botão que abriu o modal ao fechar.

**Critérios de aceite:**
- O link abre o Google Maps com o endereço correto.
- O modal não bloqueia a navegação após fechar.
- `ESC` e clique no backdrop fecham o modal.

---

### FR-07 — Slide 4: Confirmação de presença (placeholder)

**Descrição:** o slide apresenta a chamada para confirmação de presença, mas **não implementa o fluxo de RSVP nesta versão**.

**Conteúdo:**
- Fundo floral de `slides-bg/4.jpeg`.
- Título: “CONFIRME SUA PRESENÇA”.
- Texto: “Sua presença tornará o nosso dia ainda mais especial!”.
- Texto: “Por favor, confirme sua presença até o dia 20 de janeiro de 2027.”.
- Botão “CONFIRMAR PRESENÇA” com `href="#"`.

**Regras:**
- O botão é um **placeholder**: não abre modal, não exibe formulário, não coleta dados, não persiste informação, não envia mensagem e não altera o slide.
- Não deve haver mensagem de sucesso, confirmação ou promessa de registro.
- Não há lista de convidados, token, busca por nome ou persistência local nesta versão.
- A aparência do botão segue o mockup e o `DESIGN.md`.

**Critérios de aceite:**
- Clicar no botão mantém o convidado no slide 4.
- Nenhum dado é coletado ou armazenado.
- Não existe fluxo de RSVP em nenhum ponto da aplicação.

---

### FR-08 — Slide 4: Lista de presentes

**Descrição:** direciona o convidado para a lista oficial de presentes.

**Conteúdo:**
- Título: “LISTA DE PRESENTES”.
- Ícone de presente.
- Texto: “O melhor presente é ter você com a gente! Mas, se desejar nos presentear, preparamos uma lista especial.”.
- Botão “ACESSAR LISTA DE PRESENTES” que abre o modal de presentes.

**Regras do modal:**
- Exibe o texto “Nossa lista oficial para quem desejar nos presentear:”.
- Botão “Site da Lista” abre `https://noivos.casar.com` em nova aba, com `rel="noopener noreferrer"`.
- Botão “Voltar” fecha o modal.
- O modal também fecha por `ESC` ou clique no backdrop.
- Não há chave, código ou meio de pagamento dentro do convite.
- O link é provisório e deve ser substituído pelo endereço oficial antes da publicação.

**Critérios de aceite:**
- O modal abre e fecha sem afetar o slide.
- O link externo abre em nova aba.
- Nenhuma informação de pagamento é exibida no app.
- O link provisório está identificado como pendência.

---

### FR-09 — Slide 5: Fechamento

**Descrição:** fechamento emocional do convite.

**Regras:**
- O slide exibe a composição final do mockup 5: foto do casal, frase “O nosso para sempre começa aqui.”, florais, assinatura “Tatiana & Tiago” e data “20 | 02 | 2027”.
- A imagem é exibida inteira, em `object-contain`, ocupando a área disponível.
- Texto alternativo: “Tatiana & Tiago no Pôr do Sol”.
- Não há texto duplicado sobre a assinatura.

**Critérios de aceite:**
- A imagem é exibida sem corte em mobile e desktop.
- A frase, a assinatura e a data permanecem legíveis.
- O slide é visualmente fiel ao mockup 5.

---

### FR-10 — Deep link para slide

**Descrição:** permite abrir o convite diretamente em um slide específico.

**Regras:**
- Parâmetro `?slide=N`, com `N` entre 1 e 5.
- Valores inválidos ou ausentes abrem o slide 1.
- O parâmetro não interfere na navegação normal.

**Critérios de aceite:**
- `?slide=4` abre o slide “Confirmação e Presentes”.
- `?slide=99` abre o slide 1.
- A navegação posterior continua funcionando.

---

## 6. Requisitos não funcionais

### NFR-01 — Responsividade

- Layout mobile-first, validado em ~390px, ~768px e 1280–1920px.
- `#stage` usa `100vh` com fallback para `100dvh`.
- Card central com largura máxima de **480px** no desktop, com sombra e bordas laterais discretas.
- Fundo creme full-bleed; no desktop, gradiente radial quente.
- Florais e conteúdo ficam dentro do card e não esticam em telas largas.
- Paddings verticais em `vh`, nunca `%`.
- **Aceite:** sem overflow, corte de texto ou perda de navegação nos três tamanhos.

### NFR-02 — Fidelidade visual e design system

- Tokens definidos em `DESIGN.md`:
  - fundo: `#F6E9D9`;
  - terracota: `#B5422F`;
  - marrom: `#4A3530`;
  - acentos florais: magenta `#A00030`, coral `#E06D41`, oliva `#6B6B3A`.
- Tipografia: **Cormorant Garamond** (400/500/600 e itálicos) e caligrafia em asset ou fonte script.
- Componentes: `.kicker`, `.body-text`, `.divider-heart`, `.btn-primary`, `.btn-outline`, `.modal`, `.slide`.
- Composições florais conforme cada mockup, sem cobrir texto.
- Ícones em SVG inline, traço 1,4–1,8, sem FontAwesome.
- **Aceite:** comparação lado a lado com os mockups, sem emendas visíveis ou texto sobre texto.

### NFR-03 — Performance e simplicidade técnica

- Um único HTML com HTML, CSS e JS vanilla; sem build, bundler, framework, lint ou testes.
- Dependências externas: Tailwind Play CDN, Google Fonts e assets locais.
- Sem bibliotecas adicionais, sem requisições de dados e sem backend.
- Transições em CSS; nenhum loop de animação contínuo.
- **Aceite:** abrir `index.html` e navegar sem erros de console; não introduzir build/framework sem decisão explícita.

### NFR-04 — Compatibilidade

- Navegadores modernos: Chrome, Safari, Firefox e Edge (versões atuais).
- Suporte a toque (swipe) e teclado.
- Funciona via `file://` desde que haja internet para carregar CDN e fontes.
- **Aceite:** fluxo completo em Chrome mobile/desktop e Safari iOS.

### NFR-05 — Degradação offline

- Sem internet, Tailwind e Google Fonts não carregam; o layout perde estilo.
- O conteúdo e o JS continuam no arquivo, mas a experiência não é garantida offline.
- **Aceite:** a página não deve travar; a limitação é conhecida e documentada.

### NFR-06 — Privacidade e segurança

- Não há backend, cookies, `localStorage`, analytics ou coleta de dados.
- Nenhum nome de convidado ou dado pessoal é embutido no HTML.
- Links externos abrem apenas por ação do usuário, em nova aba e com `rel="noopener noreferrer"`.
- **Aceite:** nenhum dado é enviado silenciosamente a terceiros.

### NFR-07 — Acessibilidade

- `user-scalable=no` e `maximum-scale=1` são proibidos.
- Navegação por teclado disponível para slides e modais.
- Botões de navegação com `aria-label`; imagens informativas com `alt`; imagens decorativas com `alt=""`.
- Foco visível em todos os controles.
- Modais fecham por `ESC`, prendem o foco enquanto abertos e devolvem o foco ao botão de origem.
- Respeitar `prefers-reduced-motion` para reduzir transições.
- **Aceite:** fluxo completo possível apenas com teclado; zoom liberado; contraste mínimo AA.

### NFR-08 — Indexação e metadados

- A página deve incluir `meta name="robots" content="noindex"`.
- Incluir `meta name="description"` e `meta name="theme-color"` coerentes com o convite.
- **Aceite:** convite não indexado por buscadores.

### NFR-09 — Publicação e deploy

- GitHub Pages via GitHub Actions em push para `main` ou execução manual.
- Workflow: checkout, Node 20, `npm ci`, configuração de identidade e `npm run deploy` (`gh-pages -d dist`).
- `dist/` é a pasta publicada.
- O `dist/index.html` atual ainda é o placeholder “Em construção”; a publicação do convite real exige copiar o HTML e os assets para `dist/`.
- **Aceite:** workflow verde e site servindo o convite real.

### NFR-10 — Localização e formatos

- Todo o conteúdo em pt-BR.
- Datas por extenso: “20 de fevereiro de 2027”, “Sábado, às 16h”.
- Sem i18n, moeda ou fuso configurável.
- **Aceite:** nenhum texto em outro idioma; acentuação correta.

### NFR-11 — Qualidade dos assets

- Os fundos `slides-bg/1.jpeg` a `5.jpeg` têm 768×1376 e são a base disponível.
- Os mockups `slides/convite-*.png` são referência visual, não assets de produção.
- A foto e os florais do slide 5 devem ser substituídos por versões em alta resolução quando disponíveis.
- **Aceite:** em 390px e 1440px não há serrilhado ou emenda perceptível; caso haja, registrar como pendência de go-live.

### NFR-12 — Manutenibilidade

- Conteúdo organizado em 5 seções independentes.
- Adicionar ou remover slide exige 3 edições: bloco do slide, indicador e constante `totalSlides`.
- Tokens centralizados no `DESIGN.md` e no `tailwind.config` inline.
- **Aceite:** um desenvolvedor consegue localizar e alterar conteúdo sem build.

---

## 7. Regras de negócio

| ID | Regra |
|---|---|
| BR-01 | O evento ocorre em 20/02/2027, sábado, às 16h, no Monarca Casarão, Belo Horizonte – MG. |
| BR-02 | Cerimônia e recepção acontecem no mesmo local. |
| BR-03 | A lista de presentes é externa e opcional. |
| BR-04 | O RSVP não está implementado nesta versão; o botão “Confirmar Presença” é um placeholder sem ação. |
| BR-05 | Nenhum dado pessoal é coletado, armazenado ou transmitido nesta versão. |
| BR-06 | O link da lista de presentes é provisório até a definição do endereço oficial. |
| BR-07 | O convite é privado e não deve ser indexado. |
| BR-08 | Não há lista de convidados, acompanhantes ou seleção de presença nesta versão. |
| BR-09 | Links externos abrem em nova aba e somente por ação do usuário. |
| BR-10 | O prazo de 20/01/2027 é exibido como informação; não há bloqueio ou registro técnico nesta versão. |

---

## 8. Conteúdo e copy

### 8.1 Slide 1 — Apresentação

- NOSSO GRANDE DIA
- Tatiana & Tiago
- 20 | 02 | 2027
- UM NOVO CAPÍTULO DA NOSSA HISTÓRIA

### 8.2 Slide 2 — História

- VOCÊ FAZ PARTE DESSA HISTÓRIA
- “Estamos muito felizes em compartilhar com você um dos momentos mais especiais da nossa vida.”
- “Queremos que esteja ao nosso lado para celebrar o amor, a amizade e tudo o que construímos até aqui.”
- “Será um prazer ter você conosco!”

### 8.3 Slide 3 — Data

- DATA
- 20 DE FEVEREIRO DE 2027
- SÁBADO, ÀS 16H
- CERIMÔNIA E RECEPÇÃO
- “A cerimônia e a recepção acontecerão no mesmo local, para que possamos viver esse momento especial juntos do início ao fim.”
- LOCAL
- MONARCA CASARÃO
- R. Praia Formosa, 247 — Alto Caiçaras / Belo Horizonte – MG
- ABRIR NO MAPA

### 8.4 Slide 4 — Confirmação de presença

- CONFIRME SUA PRESENÇA
- “Sua presença tornará o nosso dia ainda mais especial!”
- “Por favor, confirme sua presença até o dia 20 de janeiro de 2027.”
- CONFIRMAR PRESENÇA

> O botão é um placeholder nesta versão. Ver FR-07 e BR-04.

### 8.5 Slide 4 — Lista de presentes

- LISTA DE PRESENTES
- “O melhor presente é ter você com a gente! Mas, se desejar nos presentear, preparamos uma lista especial.”
- ACESSAR LISTA DE PRESENTES
- “Nossa lista oficial para quem desejar nos presentear:”
- SITE DA LISTA
- VOLTAR

### 8.6 Slide 5 — Fechamento

- “O nosso para sempre começa aqui.”
- Tatiana & Tiago
- 20 | 02 | 2027

---

## 9. Arquitetura e implementação

### 9.1 Estrutura atual

```text
casamento/
├── .github/workflows/deploy.yml
├── dist/index.html
├── DESIGN.md
├── PRD.md
├── README.md
├── package.json
├── package-lock.json
├── slides/              # mockups de referência (5 imagens)
└── slides-bg/           # fundos e recortes para implementação
```

### 9.2 Stack

- HTML5 semântico.
- CSS via Tailwind Play CDN + estilos locais no `<head>`.
- JavaScript vanilla (ES6), sem módulos.
- Google Fonts (Cormorant Garamond e, se necessário, fonte script).
- SVG inline para ícones.
- Assets locais (JPEG/PNG).

### 9.3 Estrutura do `index.html`

- `<head>`: meta viewport, Tailwind CDN, fontes, `tailwind.config`, `<style>`.
- `#stage`: palco full-screen.
- `#cardViewport`: card de até 480px.
- `header`: navegação e 5 indicadores.
- `#slidesContainer`: 5 `<section class="slide">`.
- `#mapModal` e `#giftModal`.
- `<script>`: navegação, deep link, abertura/fechamento de modais e swipe.
- **Não há** base de convidados, storage, token, busca ou fluxo de RSVP.

### 9.4 Integrações externas

| Integração | Uso | Observação |
|---|---|---|
| cdn.tailwindcss.com | Estilos | Requer internet; Play CDN |
| fonts.googleapis.com / gstatic.com | Cormorant Garamond | Requer internet |
| google.com/maps | Abrir mapa | Nova aba |
| noivos.casar.com | Lista de presentes | Link provisório |

### 9.5 Deploy

- Workflow em `.github/workflows/deploy.yml`.
- Gatilhos: push em `main` e `workflow_dispatch`.
- Publica `dist/` na branch `gh-pages`.
- URL: `https://tiagocarmo.github.io/casamento`.
- **Estado atual:** `dist/index.html` é o placeholder “Em construção”; o convite real ainda não foi publicado.

### 9.6 Decisões desta versão

| Tema | Decisão |
|---|---|
| Quantidade de slides | 5 slides |
| RSVP | Não implementado; botão “Confirmar Presença” com `href="#"` |
| Lista de presentes | Apenas link externo, sem meio de pagamento no app |
| Paleta | Atualizada para os mockups atuais (`DESIGN.md` v1.1.0) |
| Dados pessoais | Nenhuma coleta nesta versão |
| Link da lista | Provisório (`noivos.casar.com`) |

---

## 10. Pendências e riscos

### 10.1 Pendências

| ID | Pendência | Impacto | Prioridade |
|---|---|---|---|
| P-01 | Definir o comportamento do botão “Confirmar Presença” antes de publicar: manter placeholder, ocultar o bloco ou implementar RSVP | Convidado pode clicar e não acontecer nada | Must |
| P-02 | Substituir o link provisório da lista de presentes pelo oficial | Convidado pode ser direcionado ao lugar errado | Must |
| P-03 | Publicar o convite real em `dist/` com os assets | Hoje o site no ar é “Em construção” | Must |
| P-04 | Substituir assets por versões em alta resolução | Qualidade visual em telas grandes | Should |
| P-05 | Adicionar `noindex` e metadados ao app real | Exposição em buscadores | Should |
| P-06 | Validar o uso de `slides-bg/5-exemplo-recorte.jpeg` e a composição final do slide 5 | Consistência do fechamento | Should |
| P-07 | Revisar a copy do prazo de confirmação enquanto o RSVP for placeholder | Expectativa do convidado | Should |
| P-08 | Atualizar o `README.md` com instruções de execução e deploy | Manutenção | Could |

### 10.2 Riscos

| ID | Risco | Probabilidade | Impacto | Mitigação |
|---|---|---|---|---|
| R-01 | Botão “Confirmar Presença” sem ação frustrar convidados | Alta | Alto | Implementar RSVP ou ocultar o bloco antes do go-live |
| R-02 | Link provisório da lista chegar em produção | Média | Alto | Checklist de go-live |
| R-03 | Assets em baixa resolução perderem qualidade | Alta | Médio | Substituir pelos originais |
| R-04 | Dependência de CDN (Tailwind/fontes) | Média | Médio | Build local de CSS e self-hosting de fontes |
| R-05 | Recorte dos fundos retrato no desktop | Média | Baixo | Testar `cover` e ajustar o card |
| R-06 | Convite indexado por buscadores | Média | Médio | `noindex` e link não divulgado |
| R-07 | Publicação do placeholder em vez do convite | Média | Alto | Validar `dist/` antes do deploy |

---

## 11. Critérios de aceite globais

### 11.1 Experiência

- [ ] Abrir em 390×844, 768×1024 e 1440×900 sem overflow ou conteúdo cortado.
- [ ] Navegar pelos 5 slides com swipe, setas, indicadores e teclado.
- [ ] O indicador ativo acompanha o slide.
- [ ] Nenhum texto sobrepõe florais ou outro texto.
- [ ] `?slide=4` abre o slide “Confirmação e Presentes”.

### 11.2 Conteúdo e integrações

- [ ] Data, horário e endereço corretos.
- [ ] Modal do mapa abre, fecha por botão/ESC/backdrop e leva ao Google Maps.
- [ ] Modal de presentes abre, fecha por botão/ESC/backdrop e leva à lista externa.
- [ ] Nenhuma informação de pagamento aparece no convite.
- [ ] Slide 5 exibe a imagem inteira com frase, assinatura e data legíveis.

### 11.3 Placeholder e privacidade

- [ ] O botão “Confirmar Presença” não abre modal, não coleta dados e não altera o slide.
- [ ] Não há lista de convidados, token, storage, busca ou fluxo de RSVP.
- [ ] Nenhum dado pessoal é embutido no HTML.
- [ ] Nenhuma requisição de dados é feita.

### 11.4 Qualidade técnica

- [ ] Console limpo (exceto aviso do Tailwind Play CDN).
- [ ] Sem requisições quebradas de assets.
- [ ] `noindex` no app publicado.
- [ ] Build/deploy do GitHub Pages verde.
- [ ] Acessibilidade mínima: foco visível, zoom liberado, modais com ESC e foco gerenciado.

### 11.5 Conteúdo final

- [ ] Link real da lista de presentes.
- [ ] Assets em alta resolução.
- [ ] Revisão ortográfica da copy.
- [ ] Decisão registrada sobre o placeholder de confirmação.

---

## 12. Evolução futura — RSVP

Esta seção registra a intenção futura. **Nada aqui faz parte do escopo atual.**

Quando o RSVP for implementado, a solução deverá definir:

- modelo de identificação do convite (token por grupo ou link individual);
- lista de convidados e regra de acompanhantes;
- seleção individual de presença;
- persistência local e/ou backend;
- comprovante via WhatsApp para a cerimonialista;
- busca de convite por nome;
- tratamento de privacidade e LGPD;
- regra de bloqueio após 20/01/2027;
- substituição do `href="#"` do botão “Confirmar Presença”.

Pré-requisitos para a evolução:

1. Definir se haverá backend ou se o RSVP continuará local com comprovante manual.
2. Substituir os nomes placeholder por dados reais.
3. Definir o número oficial da cerimonialista.
4. Validar o fluxo com a cerimonialista.
5. Atualizar este PRD e o `DESIGN.md` com os novos componentes.

---

## 13. Glossário

| Termo | Definição |
|---|---|
| **RSVP** | Confirmação de presença. Fora do escopo desta versão. |
| **Placeholder** | Elemento visual sem funcionalidade real nesta entrega. |
| **Mockup** | Imagem de referência visual (`slides/convite-*.png`). |
| **Play CDN** | Versão do Tailwind que compila classes no navegador em runtime. |
| **Deep link** | URL que abre o app diretamente em um slide (`?slide=N`). |
| **CTA** | Call to action; botão de ação principal. |

---

## 14. Histórico de versões

| Versão | Data | Mudança |
|---|---|---|
| 1.0.0 | 22/10/2026 | Requisitos extraídos da POC de 6 slides. |
| 1.1.0 | 22/10/2026 | Revisão para 5 slides; RSVP como placeholder; remoção do meio de pagamento; atualização do design system. |
