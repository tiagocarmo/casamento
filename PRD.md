# PRD — Convite de Casamento Tatiana & Tiago

**Versão:** 1.3.3

**Atualização:** 22 de outubro de 2026

**Etapa atual:** tarefa 2 concluída — v2 com fundos florais aprovada e promovida de `src/` para `dist/`, com publicação autorizada pelo usuário.

**Idioma:** português do Brasil (pt-BR).

**Plano aprovado:** [plano 2 consolidado](plans/2-plan.md), incluindo todas as revisões da tarefa 2; [plano 1](plans/1-plan.md) como histórico. **Acompanhamento:** [tarefas](TASKS.md).

Esta versão adiciona somente os fundos florais e substitui a tolerância a rolagem dos slides em retrato pelo aceite de conteúdo completo sem rolagem desde 320×480 pixels CSS, em uso normal. Mantém a página vertical nos demais formatos. A foto do casal está fora da tarefa 2.

## 1. Visão e público

Convite digital para o casamento de **Tatiana & Tiago**, em **20 de fevereiro de 2027 (sábado), às 16h**, no **Monarca Casarão**, Belo Horizonte – MG.

Um link reúne a mensagem afetiva, informações do evento, localização e acesso à lista de presentes. O público principal são convidados em smartphones, incluindo pessoas com pouca familiaridade com tecnologia.

A entrega atual é estática, sem backend, cadastro, autenticação, coleta de dados de convidados ou confirmação de presença. Os noivos compartilham o link e acompanham a lista na plataforma externa; o trabalho da cerimonialista com RSVP será definido na tarefa 3.

## 2. Escopo e organização

### Etapa atual — tarefa 2

- Um único HTML semântico com CSS próprio e JavaScript internos, sem framework ou build.
- Cinco seções, compartilhadas entre o carrossel em retrato e o fluxo vertical nos demais formatos.
- Copy completa preservada, ícones SVG inline, divisores, identidade e tipografia.
- 14 peças florais WebP com alpha: 12 assets iniciais preservados, derivados dos cinco originais, e duas faixas recompostas com imagegen exclusivamente para o fechamento desktop.
- Florais do evento crescem gradualmente acima de 668px de altura em retrato; encerramento mobile aprovado preservado.
- Compactação por medidas reais do viewport e conteúdo, corpo mínimo de 14px e controles de pelo menos 44×44px.
- Modais de localização e presentes.
- Navegação acessível, responsividade e links diretos.
- Metadados, `noindex`, fallback sem fontes e conteúdo legível sem JavaScript.
- Plano, lista de tarefas, README e registro da validação.

### Fora desta etapa

- Fotografia do casal, inclusive espaços reservados para ela.
- RSVP, convidados, acompanhantes, tokens, formulários, busca ou armazenamento.
- Pagamentos, cotas, chaves ou reservas de presentes.
- Backend, API, banco de dados, autenticação ou painel administrativo.
- Mensagens automáticas, analytics, internacionalização e infraestrutura de testes.

A aprovação final autorizou a promoção da v2 para `dist/`, commit, envio a `main` e publicação pelo workflow existente. Não alterar a infraestrutura de publicação.

Os planos ficam em `plans/<número-da-tarefa>-plan.md`. O `TASKS.md` tem tarefas numeradas, status e links relativos para planos existentes. Tarefas futuras podem não ter plano. A conclusão exige implementação, validação e documentação coerentes.

## 3. Conteúdo obrigatório

### Seção 1 — Apresentação

- NOSSO GRANDE DIA
- Tatiana & Tiago
- 20 | 02 | 2027
- UM NOVO CAPÍTULO DA NOSSA HISTÓRIA
- Divisores com coração.

### Seção 2 — História

- VOCÊ FAZ PARTE DESSA HISTÓRIA
- “Estamos muito felizes em compartilhar com você um dos momentos mais especiais da nossa vida.”
- “Queremos que esteja ao nosso lado para celebrar o amor, a amizade e tudo o que construímos até aqui.”
- “Será um prazer ter você conosco!”

### Seção 3 — Informações do evento

- DATA; ícone de calendário; 20 DE FEVEREIRO DE 2027; SÁBADO, ÀS 16H.
- CERIMÔNIA E RECEPÇÃO; ícone de alianças.
- “A cerimônia e a recepção acontecerão no mesmo local, para que possamos viver esse momento especial juntos do início ao fim.”
- LOCAL; ícone de pin; MONARCA CASARÃO.
- R. Praia Formosa, 247 — Alto Caiçaras / Belo Horizonte – MG.
- ABRIR NO MAPA.

### Seção 4 — Confirmação e presentes

- CONFIRME SUA PRESENÇA.
- “Sua presença tornará o nosso dia ainda mais especial!”
- “Por favor, confirme sua presença até o dia 20 de janeiro de 2027.”
- No desktop com container de 800px, manter esse prazo inteiro em uma linha; agrupar a data para evitar “2027” isolado. No mobile, permitir quebra natural.
- CONFIRMAR PRESENÇA: link `href="#"`, sem ação nesta etapa.
- LISTA DE PRESENTES; ícone de presente.
- “O melhor presente é ter você com a gente! Mas, se desejar nos presentear, preparamos uma lista especial.”
- ACESSAR LISTA DE PRESENTES.

### Seção 5 — Fechamento

- “O nosso para sempre começa aqui.”
- Tatiana & Tiago
- 20 | 02 | 2027

A composição final usa texto terracota sobre creme, com florais no topo e na base. Não há fotografia, texto alternativo de foto ausente ou caixa reservada para ela.

## 4. Requisitos funcionais

| ID | Comportamento e aceite |
|---|---|
| FR-01 | Exatamente cinco seções `.slide`, na ordem acima, sem duplicar conteúdo para cada layout. Em retrato com largura abaixo de 768px, carrossel; nos demais casos, fluxo vertical. |
| FR-02 | No carrossel: anterior/próximo, cinco indicadores, swipe horizontal predominante de pelo menos 45px, ArrowRight/PageDown e ArrowLeft/PageUp. Navegação circular nos extremos; indicador acompanha a seção. Transição de 0,52s, `cubic-bezier(.22, 1, .36, 1)`. |
| FR-03 | Apresentação completa e legível, com nomes em caligrafia, data, divisores e florais superior esquerdo/inferior direito, derivados de 1.jpeg. |
| FR-04 | História completa, em dois parágrafos e assinatura caligráfica, sem cortes ou sobreposição. Florais superior direito/inferior esquerdo, derivados de 2.jpeg. |
| FR-05 | Data, horário, local e endereço corretos; botão abre o modal sem mudar a página. Conteúdo completo sem rolagem em retrato desde 320×480. Cantos superior direito/inferior esquerdo derivados de 3.jpeg; preservar a base da densidade até 668px, crescer gradualmente até 180/180px em 440×956 e limitar o crescimento. Modo compacto preservado. |
| FR-06 | Modal de localização com nome, endereço, Fechar e Abrir Mapa. Busca no Google Maps por `Monarca Casarão, R. Praia Formosa, 247, Alto Caiçaras, Belo Horizonte - MG`. |
| FR-07 | Confirmar presença é um placeholder com aparência de ação primária. Interceptar o clique: não mudar URL, rolagem ou slide; não abrir modal, coletar dados ou mostrar confirmação. O prazo é apenas informação. |
| FR-08 | Modal de presentes: “Nossa lista oficial para quem desejar nos presentear:”, Site da Lista e Voltar. Destino provisório `https://noivos.casar.com`; sem informações de pagamento no convite. Quatro cantos florais derivados de 4.jpeg. |
| FR-09 | Fechamento com frase, assinatura e data em texto, sem foto ou conteúdo duplicado. Abaixo de 768px, preservar os florais anteriores; a partir de 768px, usar duas artes exclusivas de 800×77px e 800×91px em toda a largura útil, mantendo proporção e transição suave para creme. |
| FR-10 | `?slide=1` até `?slide=5` seleciona o slide ou posiciona a seção vertical. Ausente ou inválido abre a primeira seção. O deep link tem precedência sobre a abertura padrão; navegar não altera a URL. |

### Navegação e mudança de formato

- No carrossel, usar `translateX(-índice × 100%)`; limitar índices internos válidos e aplicar ciclo somente a anterior/próximo.
- Controles no cabeçalho, com alvos de pelo menos 44×44px. Em largura a partir de 320px, manter os sete controles em uma linha; em larguras menores, permitir mais linhas para preservar esses alvos.
- Conteúdo completo, centralizado e sem área rolável nos slides desde 320×480 em retrato, em uso normal. Medir todos os slides e escolher entre densidade confortável (18px), intermediária (16px) e compacta (14px), ajustando espaços, florais, ícones e divisores. Recalcular com fontes e mudanças da área disponível, inclusive alturas intermediárias.
- Modais, zoom/texto ampliado e áreas menores que a matriz mantêm rolagem acessível quando necessária. Swipe não pode confundir gesto vertical com troca de seção.
- Slides inativos ficam inertes e ocultos da leitura assistiva.
- Fora do carrossel, remover seus controles da apresentação e do foco; deixar o teclado rolar a página normalmente.
- Preservar a seção em leitura ao girar/redimensionar, sem recarregar.
- Sem JavaScript, mostrar todas as seções em fluxo vertical. Modais e navegação interativa dependem de JavaScript.

### Contrato comum dos modais

- Fechar por botão, Escape ou clique diretamente no backdrop.
- Foco contido, fundo inerte, restauração do foco ao acionador e da posição de leitura.
- Teclas de carrossel suspensas enquanto houver modal aberto.
- Rolagem interna para conteúdo alto; modal utilizável após rotação/redimensionamento.
- Links externos em nova aba com `rel="noopener noreferrer"`, somente por ação do convidado.

## 5. Requisitos não funcionais

| ID | Requisito |
|---|---|
| NFR-01 | Mobile-first. Carrossel em largura <768px e retrato; fluxo vertical em paisagem ou largura ≥768px. Página vertical centralizada em até 800px, com altura natural e sem overflow horizontal. |
| NFR-02 | Identidade em creme `#F6E9D9`, terracota `#B5422F`, marrom `#4A3530`; Cormorant Garamond e Parisienne. SVG inline para calendário, alianças, pin, presente, coração e controles. Detalhes em DESIGN.md. |
| NFR-03 | Um `src/index.html` com CSS/JS internos e 14 assets locais WebP com alpha em `src/assets/florals/`. Sem Tailwind, framework, build, novas dependências ou requisições de dados de convidados. |
| NFR-04 | Navegadores modernos, toque e teclado. Registrar a cobertura real; emulação não equivale a teste em smartphone físico. |
| NFR-05 | Sem internet/fontes, usar fontes do sistema; CSS e JS locais preservam a estrutura e as interações. Links externos exigem conexão. |
| NFR-06 | Sem cookies, storage, analytics ou coleta de dados de convidados. Google Fonts requer conexões externas; mapa e presentes abrem por ação explícita. |
| NFR-07 | Zoom liberado, foco visível, contraste AA, hierarquia semântica, rótulos acessíveis, SVG decorativo oculto e `prefers-reduced-motion`. Modais com foco gerenciado e Escape. |
| NFR-08 | `lang="pt-BR"`, título, descrição, cor do tema e `noindex`. Não há controle de acesso por senha. |
| NFR-09 | V2 aprovada em src/ e espelhada integralmente em dist/, incluindo os 14 assets. Publicação autorizada pelo workflow existente, sem alteração de infraestrutura. |
| NFR-10 | Copy em pt-BR, com acentuação correta. Data do evento: 20/02/2027 às 16h; prazo informado: 20/01/2027. |
| NFR-11 | Florais com alpha real, proporção preservada, sem quadriculado, emendas ou halos perceptíveis. Cantos compartilhados entre formatos; duas variantes exclusivas para o fechamento desktop. Conjunto alvo de até 1,5 MB. Foto do casal fora do escopo. |
| NFR-12 | Cinco seções independentes; tokens centralizados em CSS; JS organizado por navegação, formato, ajuste de densidade, swipe, deep link e modais. Quantidade de slides derivada das seções; indicadores explícitos. |

## 6. Regras de negócio

1. Cerimônia e recepção acontecem no mesmo local, na data e horário informados.
2. A lista de presentes é externa, opcional e ainda tem endereço provisório.
3. Não existe RSVP ou lista de convidados nesta versão.
4. O prazo de confirmação não aciona bloqueio ou registro técnico.
5. Não existem meios de pagamento dentro do convite.
6. O convite não se destina à indexação; `noindex` não torna o link autenticado.

## 7. Arquitetura e operação

- `src/index.html`: implementação desta etapa; abrir diretamente ou servir a raiz por HTTP.
- `src/assets/florals/`: 14 peças transparentes locais, incluindo duas variantes do fechamento a partir de 768px.
- `dist/index.html` e `dist/assets/florals/`: cópias fiéis da v2 aprovada em src/ para publicação.
- `#stage`: página centralizada ou palco do carrossel.
- `#carouselNav`: botões e cinco indicadores; visível somente no carrossel.
- `#slidesViewport` / `#slidesContainer`: viewport e trilha das mesmas cinco seções.
- `#mapModal` / `#giftModal`: elementos `dialog` nativos.
- CSS próprio com custom properties, media queries, viewport dinâmica e safe areas.
- JS vanilla sem módulos, backend, bibliotecas ou persistência.
- Requisições externas iniciais: apenas Google Fonts e seus arquivos de fonte. Florais carregados localmente como fundos decorativos, em camadas sem eventos de ponteiro e com área central de leitura livre.

O workflow histórico publica `dist/` via `gh-pages`, em push para `main` ou execução manual. A tarefa 1 estabeleceu a publicação da estrutura sem imagens. Com a aprovação da v2, `dist/` passa a espelhar o HTML e os 14 florais de `src/`; o envio a `main` aciona o mesmo workflow.

## 8. Validação e aceite

Na entrega inicial, foi registrada a matriz: 320×480, 320×568, 360×640, 390×844, 430×932, 568×320, 667×375, 844×390, 768×1024, 1024×768, 1280×720, 1440×900 e 1920×1080.

Essa validação cobriu todas as seções, navegação, toque/teclado, deep links, rotação, modais, confirmação sem ação, destinos externos, ampliação, fontes indisponíveis, modo sem JS e redução de movimento. O histórico inclui 112 combinações adicionais de altura/fontes.

As revisões visuais usam validação direcionada, sem repetir a bateria completa ou as 112 combinações. A revisão final verifica apenas evento e fechamento em 375×667, 440×668, 440×800, 440×956 e 1440×900, além de transparência, recursos locais e botão de localização. Comparar o encerramento mobile antes/depois. Registrar separadamente cada execução e sua cobertura real.

Aceite: em retrato normal, página e slides sem rolagem desde 320×480, texto mínimo de 14px, alvos de 44×44px e conteúdo integralmente dentro da área disponível, inclusive com fontes alternativas; nenhum conteúdo inacessível, corte ou overflow horizontal; nenhum erro de JS ou recurso local quebrado; documentação coerente; diferenças de cobertura registradas. Não instalar infraestrutura de testes no projeto. Evidências em [validação da tarefa 2](plans/2-validation.md).

## 9. Pendências e evoluções

| Etapa | Pendência |
|---|---|
| Tarefa 2 | Concluída e aprovada; v2 espelhada em dist/ para publicação autorizada. |
| Foto do casal | Fora da tarefa 2; incluir quando houver fotografia disponível e escopo aprovado. |
| Tarefa 3 | Planejar e implementar confirmação de convidados. Definir identificação, grupos/acompanhantes, persistência, privacidade, prazo e eventual operação da cerimonialista. |
| Próxima entrega funcional | Substituir o link provisório dos presentes e implementar a confirmação de convidados. A v2 está aprovada para publicação com essas limitações conhecidas. |
| Compatibilidade | Registrar e completar os navegadores/aparelhos não disponíveis na validação local. |

A tarefa 2 segue o plano 2; a tarefa 3 ainda não possui plano. Nenhuma decisão de backend, token, WhatsApp ou armazenamento está antecipada como implementação aprovada.

## 10. Histórico

| Versão | Data | Alteração |
|---|---|---|
| 1.0.0 | 22/10/2026 | Requisitos extraídos da POC de seis slides. |
| 1.1.0 | 22/10/2026 | Cinco slides; RSVP como placeholder; remoção do pagamento e atualização visual. |
| 1.2.0 | 22/10/2026 | Plano 1: estrutura sem imagens em src/, CSS próprio, SVG inline, carrossel em retrato e fluxo vertical até 800px nos demais formatos; sem deploy. |
| 1.2.1 | 22/10/2026 | Implementação aprovada; cópia idêntica promovida para dist/ como complemento da tarefa 1, sem deploy remoto. |
| 1.3.0 | 22/10/2026 | Plano 2: 12 florais WebP transparentes em src/, retrato sem rolagem desde 320×480, corpo mínimo de 14px; dist/ preservado para aprovação. |
| 1.3.1 | 22/10/2026 | Revisão visual da tarefa 2 e prazo de confirmação em uma linha no desktop; validação direcionada, sem repetir a matriz extensa. |
| 1.3.2 | 22/10/2026 | Evento em telas altas, duas faixas exclusivas desktop, mobile preservado, 14 assets e consolidação documental da tarefa 2. |
| 1.3.3 | 22/10/2026 | V2 aprovada; promoção integral de src/ para dist/ e publicação autorizada pelo fluxo existente. |
