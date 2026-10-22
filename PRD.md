# PRD — Convite de Casamento Tatiana & Tiago

**Versão:** 1.0.0
**Data:** 22 de outubro de 2026
**Status:** Documento de requisitos da POC (as-is) + pendências para produção
**Fonte de verdade:** `poc/index.html`, complementado por `poc/PLANO-VISUAL.md`, `poc/AGENTS.md` e `DESIGN.md`
**Idioma do produto:** português do Brasil (pt-BR)

> Este PRD descreve o que a POC entrega hoje, com status de implementação e critérios de aceite. Onde a documentação e o código divergem, o código da POC prevalece. As divergências estão registradas na seção 11.6.

---

## 1. Contexto e visão

O produto é o convite digital de casamento de **Tatiana & Tiago**, celebrado em **20 de fevereiro de 2027 (sábado), às 16h**, no **Monarca Casarão**, em Belo Horizonte – MG.

O convite é uma experiência de página única, com estética editorial e floral, que substitui o convite impresso e concentra:

- apresentação do casal e da história;
- data, horário, cerimônia, recepção e localização;
- confirmação de presença (RSVP) por grupo familiar/convite;
- lista de presentes com PIX e link externo;
- encerramento afetivo com foto do casal.

A POC foi construída como um único arquivo HTML, sem backend, sem build e sem dependência de framework, para validar visual e fluxo antes da implementação definitiva.

### 1.1 Problema que resolve

- Centralizar informações do evento em um link único e fácil de compartilhar.
- Reduzir o atrito da confirmação de presença, permitindo marcar cada membro do grupo.
- Dar à cerimonialista uma lista consolidada por grupo, validada manualmente na recepção.
- Direcionar convidados que desejam presentear para a chave PIX e a lista oficial.

### 1.2 Princípios do produto

- **Mobile-first:** a experiência principal acontece no celular.
- **Elegância e fidelidade ao mockup:** paleta creme/terracota, tipografia serifada e caligrafia.
- **Simplicidade operacional:** um link por convite, sem cadastro nem senha.
- **Degradação controlada:** sem backend, o RSVP é local e a validação oficial é humana.

---

## 2. Objetivos e métricas

### 2.1 Objetivos de negócio

1. Comunicar todas as informações do casamento de forma clara e visualmente coerente.
2. Coletar a confirmação de presença por grupo até **20 de janeiro de 2027**.
3. Direcionar convidados para a lista de presentes/PIX.
4. Reduzir dúvidas sobre local, horário e validação de entrada.

### 2.2 Métricas de sucesso (não instrumentadas na POC)

| Métrica | Meta | Status |
|---|---|---|
| Convites acessados | 100% dos grupos convidados | Não instrumentado |
| Grupos com RSVP registrado | ≥ 90% até a data-limite | Não instrumentado |
| Conclusão do fluxo de RSVP | ≥ 80% de quem abre o slide 4 | Não instrumentado |
| Cliques na lista de presentes/PIX | Acompanhar por link externo | Não instrumentado |
| Erros de JavaScript em produção | Zero no console | Verificado manualmente na POC |

> A POC não possui analytics. Qualquer medição exigirá instrumentação posterior e consentimento compatível com a LGPD.

### 2.3 Não objetivos

- Não é um site público de casamento com blog, galeria ou área de convidados autenticada.
- Não processa pagamentos nem gerencia cotas de presentes.
- Não substitui a lista oficial da cerimonialista.
- Não oferece painel administrativo para os noivos.
- Não garante RSVP entre dispositivos diferentes (sem backend).

---

## 3. Público-alvo e personas

### 3.1 Convidado

- Recebe um link personalizado por WhatsApp/e-mail.
- Acessa predominantemente pelo celular, muitas vezes em rede móvel.
- Precisa entender data, local e confirmar quem do grupo comparecerá.
- Pode não ter intimidade com tecnologia; a interface deve ser óbvia e tolerante a erro.

### 3.2 Noivos (Tatiana & Tiago)

- Compartilham o link de cada grupo.
- Precisam que os nomes e grupos estejam corretos.
- Dependem do comprovante via WhatsApp e da validação da cerimonialista.

### 3.3 Cerimonialista

- Recebe os comprovantes de RSVP pelo WhatsApp.
- Confere os nomes na entrada do evento.
- É a autoridade final sobre a lista de presença.

---

## 4. Escopo

### 4.1 Dentro do escopo

- Convite interativo de página única com 6 slides.
- Navegação por toque, setas, indicadores, teclado e link direto.
- Conteúdo institucional do casamento e do evento.
- RSVP por grupo, com seleção individual de convidados.
- Persistência local do RSVP por 30 dias.
- Comprovante via WhatsApp para a cerimonialista.
- Busca de convite por nome.
- Modal de localização com link para o Google Maps.
- Modal de presentes com chave PIX copiável e link externo.
- Layout responsivo mobile-first.
- Publicação estática via GitHub Pages.

### 4.2 Fora do escopo (POC)

- Backend, API, banco de dados e sincronização entre dispositivos.
- Autenticação, login ou verificação de identidade.
- Painel administrativo, exportação de lista ou relatórios.
- Envio automático de e-mail/SMS/WhatsApp.
- Pagamentos, cotas ou reserva de presentes.
- Analytics, testes automatizados, lint e build.
- Internacionalização (apenas pt-BR).
- Acessibilidade completa WCAG 2.1 AA (há lacunas registradas).
- Página 404 personalizada, SEO público e indexação.

---

## 5. Requisitos funcionais

Legenda de status: **Implementado (POC)** · **Parcial** · **Pendente** · **Fora de escopo**
Prioridade: **Must** · **Should** · **Could**

### FR-01 — Página única com carrossel de 6 slides

**Descrição:** a aplicação é um único documento HTML que ocupa a viewport e apresenta 6 slides horizontais, sem recarregar a página.

**Regras:**
- Ordem: 1) Capa; 2) História; 3) Data/cerimônia/local; 4) RSVP; 5) Presentes; 6) Foto.
- Cada slide ocupa 100% da largura do container e a altura total da viewport.
- A transição usa `translateX(-N × 100%)` com duração de 0,52s e curva `cubic-bezier(0.22, 1, 0.36, 1)`.
- O slide inicial é o 1 (índice 0), salvo deep link.
- O primeiro slide é sempre exibido ao carregar.

**Critérios de aceite:**
- Existem exatamente 6 seções `.slide` e 6 indicadores.
- Nenhum scroll horizontal ou vertical indesejado na viewport.
- A troca de slide não recarrega a página.

**Prioridade:** Must · **Status:** Implementado (POC)

---

### FR-02 — Navegação entre slides

**Descrição:** o convidado pode navegar de várias formas, com comportamento previsível.

**Regras:**
- **Desktop (≥ 768px):** botões circulares fixos nas laterais esquerda e direita.
- **Mobile (< 768px):** botões no cabeçalho, ao lado dos indicadores.
- **Indicadores:** 6 barras no topo; a ativa é mais larga e opaca; clique leva ao slide correspondente.
- **Swipe:** gesto horizontal com limiar de **45px**; swipe para a esquerda avança e para a direita retrocede.
- **Teclado:** `ArrowRight`/`PageDown` avançam; `ArrowLeft`/`PageUp` retrocedem.
- **Ciclo:** avançar no último slide volta ao primeiro; retroceder no primeiro vai ao último.
- `goToSlide(i)` limita o índice ao intervalo válido.

**Critérios de aceite:**
- Todos os métodos funcionam em 390px e em desktop.
- O indicador ativo acompanha o slide atual.
- Não há navegação duplicada ou fora de ordem.

**Prioridade:** Must · **Status:** Implementado (POC)

---

### FR-03 — Slide 1: capa

**Descrição:** apresentação do casal e da data.

**Conteúdo:**
- Kicker: “NOSSO GRANDE DIA”.
- Divisor com coração.
- Caligrafia “Tatiana & Tiago” (imagem `assets/tatiana-tiago-clean.png`, texto alternativo “Tatiana & Tiago”).
- Data: “20 | 02 | 2027”.
- Kicker: “UM NOVO CAPÍTULO DA NOSSA HISTÓRIA”.
- Divisor com coração.
- Arranjo floral no topo (28% da altura) e na base (24%).

**Critérios de aceite:**
- A caligrafia não é cortada em 390px nem em telas altas.
- Os florais não cobrem texto.
- O slide é visualmente fiel ao painel 1 do mockup.

**Prioridade:** Must · **Status:** Implementado (POC)

---

### FR-04 — Slide 2: história

**Descrição:** mensagem afetiva de convite.

**Conteúdo:**
- Título: “VOCÊ FAZ PARTE DESSA HISTÓRIA”.
- Dois parágrafos:
  - “Estamos muito felizes em compartilhar com você um dos momentos mais especiais da nossa vida.”
  - “Queremos que esteja ao nosso lado para celebrar o amor, a amizade e tudo o que construímos até aqui.”
- Caligrafia: “Será um prazer ter você conosco!” (imagem `assets/sera-um-prazer-clean.png`).
- Florais no canto superior direito e na base.

**Critérios de aceite:**
- Textos legíveis e sem sobreposição aos florais.
- A caligrafia é exibida sem distorção.

**Prioridade:** Must · **Status:** Implementado (POC)

---

### FR-05 — Slide 3: data, cerimônia e local

**Descrição:** concentra as informações práticas do evento.

**Conteúdo:**
- **Data:** ícone de calendário; “20 DE FEVEREIRO DE 2027”; “Sábado, às 16h”.
- **Cerimônia e recepção:** ícone de alianças; texto informando que ambos acontecem no mesmo local.
- **Local:** ícone de pin; “MONARCA CASARÃO”; “R. Praia Formosa, 247 — Alto Caiçaras / Belo Horizonte – MG”.
- Botão “ABRIR NO MAPA” que abre o modal de localização.
- Florais no canto superior direito e na base.

**Critérios de aceite:**
- Data, horário e endereço corretos.
- O botão abre o modal sem navegar para outra página.
- O bloco completo cabe na viewport de 390×844 sem corte.

**Prioridade:** Must · **Status:** Implementado (POC)

---

### FR-06 — Modal de localização e link de mapa

**Descrição:** confirmação do endereço e abertura do GPS.

**Regras:**
- O modal exibe nome do local, endereço completo, botão “Fechar” e botão “Abrir GPS”.
- “Abrir GPS” abre o Google Maps em nova aba, via busca por:
  `Monarca Casarão, R. Praia Formosa, 247, Alto Caiçaras, Belo Horizonte - MG`.
- O modal fecha apenas pelo botão “Fechar” (não há ESC nem clique no backdrop na POC).

**Critérios de aceite:**
- O link abre o Google Maps com o endereço correto.
- O modal não bloqueia a navegação após fechar.

**Prioridade:** Must · **Status:** Implementado (POC)

---

### FR-07 — Identificação do convite por token

**Descrição:** cada convite é personalizado por grupo por meio de um token na URL.

**Regras:**
- Tokens aceitos nos parâmetros `?c=`, `?convite=`, `?t=` ou no hash (`#token`).
- A comparação é case-insensitive.
- Token válido seleciona o grupo e sua lista de convidados.
- Token inválido ou ausente mantém o primeiro grupo da base (“Tatiana & Tiago (Noivos)”), sem mensagem de erro.
- O nome do grupo é exibido no formulário de RSVP.
- O token não é removido da URL.

**Critérios de aceite:**
- `?c=fam-viana` exibe “Família Viana” e seus 4 convidados.
- `?c=FAM-VIANA` tem o mesmo efeito.
- URL sem token não quebra a página.

**Prioridade:** Must · **Status:** Implementado (POC)

---

### FR-08 — Seleção de convidados e confirmação de presença

**Descrição:** o convidado marca quem do grupo comparecerá.

**Regras:**
- Cada convidado é uma linha clicável com nome, checkbox e rótulo “Irá”/“Ausente”.
- A seleção alterna a cada clique e atualiza o visual imediatamente.
- O botão “Confirmar Presença” fica desabilitado enquanto nenhum nome estiver selecionado.
- Ao menos 1 nome deve ser selecionado para confirmar.
- Nomes não selecionados são registrados como ausentes.
- Não há limite de acompanhantes além dos nomes listados no grupo.
- O envio grava o RSVP e exibe toast de sucesso.
- Um aviso fixo informa que a lista será validada pela cerimonialista na recepção.

**Critérios de aceite:**
- O botão só habilita com ≥ 1 selecionado.
- O texto de ajuda muda de “Selecione ao menos um nome” para instrução de confirmação.
- Após confirmar, o formulário é substituído pelo resumo.

**Prioridade:** Must · **Status:** Implementado (POC)

---

### FR-09 — Persistência local do RSVP

**Descrição:** a confirmação é lembrada no mesmo navegador/dispositivo por 30 dias.

**Regras:**
- Gravação em cookie (`path=/; SameSite=Lax`, validade de 30 dias) e em `localStorage`.
- Chaves:
  - específica: `wedding_rsvp_<token>`;
  - genérica: `wedding_rsvp_token`.
- Payload:

```json
{
  "status": "accepted",
  "token": "fam-viana",
  "groupName": "Família Viana",
  "confirmedGuests": ["Arthur Viana"],
  "absentGuests": ["Helena Viana", "Beatriz Viana", "Lucas Viana"],
  "date": "22/10/2026"
}
```

- Leitura prioriza a chave específica; usa a genérica como fallback.
- O registro só é aceito se `status === "accepted"` e o token coincidir com o grupo atual (ou estiver ausente).
- O `date` é gerado com `toLocaleDateString('pt-BR')`.

**Critérios de aceite:**
- Recarregar a página mantém o estado “Presença Registrada”.
- Apagar cookie e localStorage volta ao formulário.
- Um JSON corrompido não quebra a página (erro tratado e registrado no console).

**Prioridade:** Must · **Status:** Implementado (POC)

---

### FR-10 — Estado “presença já confirmada” e edição

**Descrição:** ao retornar, o convidado vê o que confirmou e pode alterar.

**Regras:**
- O formulário é ocultado e o painel de confirmação é exibido.
- O painel mostra:
  - ícone de check duplo e título “Presença Registrada!”;
  - grupo e data da confirmação;
  - nomes confirmados com “✓”;
  - nomes ausentes, se houver;
  - selo de validação pela cerimonialista;
  - botão “Enviar Comprovante à Cerimonialista” (WhatsApp);
  - botão “Alterar Seleção”.
- “Alterar Seleção” reabre o formulário com os nomes confirmados pré-marcados.
- Uma nova confirmação sobrescreve o registro anterior.

**Critérios de aceite:**
- O resumo reflete exatamente a última seleção.
- Editar e salvar novamente atualiza cookie, localStorage e resumo.
- O estado “já confirmado” tem precedência ao recarregar.

**Prioridade:** Must · **Status:** Implementado (POC)

---

### FR-11 — Comprovante via WhatsApp

**Descrição:** o convidado envia o comprovante à cerimonialista.

**Regras:**
- O botão monta um link `https://api.whatsapp.com/send?phone=<numero>&text=<mensagem>`.
- A mensagem inclui:
  - nome do grupo;
  - confirmação de presença no casamento de Tatiana & Tiago em 20/02/2027;
  - lista de confirmados;
  - pedido de validação na lista oficial da cerimonialista.
- O link abre em nova aba.
- O número é configurado na constante `cerimonialistaWhatsapp`.

**Critérios de aceite:**
- O link contém o texto codificado corretamente.
- Nomes com acento e quebra de linha não quebram a URL.
- O número real deve substituir o placeholder antes da produção.

**Prioridade:** Must · **Status:** Implementado (POC) com número placeholder `5531999999999`

---

### FR-12 — Busca de convite por nome

**Descrição:** quem não abriu o link tokenizado pode localizar seu convite pelo nome.

**Regras:**
- O link “🔍 Buscar meu nome” mostra/esconde o campo de busca.
- A busca é case-insensitive e filtra por nome do grupo ou nome de qualquer convidado.
- São exibidos no máximo 6 resultados.
- Cada resultado mostra grupo, nomes e ação “Selecionar”.
- Ao selecionar, o grupo é carregado, a busca fecha e um toast confirma.
- Sem resultados, exibe “Nenhum convite encontrado.”.
- A busca não verifica identidade: qualquer pessoa pode carregar qualquer grupo.

**Critérios de aceite:**
- Buscar “Viana” retorna a Família Viana.
- Buscar “Tiago” retorna o grupo dos noivos.
- Selecionar um grupo atualiza o título e a lista de convidados.

**Prioridade:** Should · **Status:** Implementado (POC)

---

### FR-13 — Slide 5: lista de presentes e PIX

**Descrição:** orienta quem deseja presentear.

**Conteúdo:**
- Título “LISTA DE PRESENTES”.
- Ícone de presente.
- Texto: “O melhor presente é ter você com a gente! Mas, se desejar nos presentear, preparamos uma lista especial.”.
- Botão “ACESSAR LISTA DE PRESENTES” que abre o modal de presentes.

**Regras do modal:**
- Exibe a chave PIX `casamentotatianatiago@gmail.com`.
- Botão “Copiar” copia a chave via Clipboard API; em caso de falha, mostra a chave em toast.
- Botão “Voltar” fecha o modal.
- Botão “Site da Lista” abre `https://noivos.casar.com` em nova aba (link provisório, marcado como TODO no código).
- Não há cotas, valores ou pagamento dentro do app.

**Critérios de aceite:**
- A chave PIX é copiada corretamente.
- O modal abre e fecha sem afetar o slide.
- O link externo abre em nova aba com `rel="noopener"`.

**Prioridade:** Must · **Status:** Implementado (POC) com link provisório

---

### FR-14 — Slide 6: encerramento com foto

**Descrição:** fechamento emocional do convite.

**Regras:**
- O slide exibe uma única imagem `assets/p5-completo.jpg` em `object-contain`, ocupando a área disponível.
- A imagem contém foto do casal, florais, assinatura “Tatiana & Tiago” e data “20 | 02 | 2027” (arte queimada no asset).
- Texto alternativo: “Tatiana & Tiago no Pôr do Sol”.
- O asset reserva `assets/foto-casal.jpg` permite troca futura por foto em alta resolução.

**Critérios de aceite:**
- A imagem é exibida inteira, sem corte, em mobile e desktop.
- Não há texto duplicado sobre a assinatura.

**Prioridade:** Must · **Status:** Implementado (POC) com resolução baixa

---

### FR-15 — Feedback ao usuário

**Descrição:** ações relevantes têm retorno visual imediato.

**Regras:**
- Toast aparece na base central, fundo terracota, texto claro, por ~3,2s.
- Toasts usados em: confirmação de presença, carregamento de convite pela busca e cópia da chave PIX.
- Fallback da cópia exibe a chave no próprio toast.
- Botões têm estados hover, active e disabled.

**Critérios de aceite:**
- Nenhuma ação relevante termina sem feedback.
- O toast não bloqueia cliques e desaparece sozinho.

**Prioridade:** Should · **Status:** Implementado (POC)

---

### FR-16 — Personalização por grupo

**Descrição:** cada convite tem título de grupo e lista de convidados próprios.

**Regras:**
- Base fixa em JavaScript: `weddingGuestsDatabase`.
- Estrutura: `{ token, groupName, guests[] }`.
- A POC contém **41 grupos** e **103 nomes** (a documentação fala em ~110).
- O grupo dos noivos é o fallback.
- A troca de grupo atualiza título, lista, seleção e estado de RSVP.
- Não há edição em tempo real nem fonte externa de dados.

**Critérios de aceite:**
- Cada token carrega exatamente o grupo correspondente.
- Nenhum nome de outro grupo aparece na lista.
- O RSVP fica vinculado ao token do grupo carregado.

**Prioridade:** Must · **Status:** Implementado (POC) com dados placeholder

---

### FR-17 — Deep link para slide

**Descrição:** permite abrir o convite diretamente em um slide específico.

**Regras:**
- Parâmetro `?slide=N`, com `N` entre 0 e 5.
- Valores inválidos são ignorados e o convite abre no slide 1.
- Combinável com o token do convite.

**Critérios de aceite:**
- `?slide=3` abre o RSVP.
- `?c=fam-viana&slide=3` abre o RSVP já com a Família Viana.

**Prioridade:** Could · **Status:** Implementado (POC)

---

## 6. Requisitos não funcionais

### NFR-01 — Responsividade

- Layout mobile-first, testado em ~390px, ~768px e 1280–1920px.
- `#stage` usa `100vh` com fallback para `100dvh`.
- Card central com largura máxima de **480px**, centralizado no desktop, com sombra e bordas laterais discretas.
- Fundo creme full-bleed; no desktop, gradiente radial quente.
- Florais e conteúdo ficam dentro do card (não esticam em telas largas).
- Paddings verticais em `vh` (nunca `%`) para não resolver contra a largura.
- **Aceite:** sem overflow, corte de texto ou perda de navegação nos três tamanhos.

### NFR-02 — Fidelidade visual e design system

- Tokens implementados:
  - `creme` `#F8EBDB` (fundo);
  - `cremeSoft` `#FAF1E6`;
  - `terracota` `#B5402E` (CTAs, ícones, títulos, divisores);
  - `terracotaDark` `#9A3523` (hover);
  - `marrom` `#2E1D12` (corpo de texto).
- Tipografia: **Cormorant Garamond** (400/500/600/700 e itálicos); caligrafia dos noivos e da frase do slide 2 são **imagens PNG**, não webfonts.
- Componentes: `.kicker`, `.body-text`, `.divider-heart`, `.btn-primario`, `.btn-contorno`, `.guest-row`, `.guest-check`, `.floral`, `.custom-scroll`.
- Regra floral: 1 arranjo no topo + 1 arranjo na base por slide padrão (slides 1–5).
- Ícones em SVG inline, traço 1,4–1,8, sem FontAwesome/Montserrat.
- **Aceite:** comparação lado a lado com o mockup, sem emendas visíveis ou texto sobre texto.

### NFR-03 — Performance e simplicidade técnica

- Um único HTML com HTML, CSS e JS vanilla; sem build, bundler, framework, lint ou testes.
- Dependências externas: Tailwind Play CDN, Google Fonts e assets locais.
- Sem bibliotecas adicionais, sem requisições de dados, sem backend.
- Transições em CSS; nenhum loop de animação contínuo.
- **Aceite:** abrir `index.html` e navegar sem erros de console; não introduzir build/framework sem decisão explícita.

### NFR-04 — Compatibilidade

- Navegadores modernos: Chrome, Safari, Firefox e Edge (versões atuais).
- Suporte a toque (swipe) e teclado.
- Funciona via `file://` **desde que haja internet** para carregar CDN e fontes.
- **Aceite:** fluxo completo em Chrome mobile/desktop e Safari iOS.

### NFR-05 — Degradação offline

- Sem internet, Tailwind e Google Fonts não carregam; o layout perde estilo.
- O conteúdo e o JS continuam no arquivo, mas a experiência não é garantida offline.
- **Aceite:** a página não deve travar; a limitação é conhecida e documentada.

### NFR-06 — Privacidade e segurança

- Não há backend: o RSVP não sai do dispositivo, exceto quando o usuário abre WhatsApp/Google Maps/lista de presentes.
- A base com **103 nomes** está embutida no HTML público; qualquer pessoa com o link pode lê-la.
- Tokens são previsíveis (`fam-viana`, `casal-rocha` etc.) e não autenticam identidade.
- A busca expõe todos os grupos.
- Cookie sem `Secure`; `SameSite=Lax`.
- **Aceite:** nenhum dado é enviado silenciosamente a terceiros; riscos de exposição de PII e de confirmação por terceiros estão documentados.

### NFR-07 — Acessibilidade

- Existem `aria-label` nos botões de navegação, `alt` nas imagens informativas e `alt=""` nas decorativas.
- Navegação por teclado disponível para slides.
- Lacunas atuais:
  - `maximum-scale=1.0, user-scalable=no` impede zoom;
  - modais sem foco preso, sem fechamento por ESC e sem restauração de foco;
  - ausência de estilos de foco visíveis;
  - ausência de `prefers-reduced-motion`;
  - estado de seleção depende de cor + texto (parcialmente ok).
- **Aceite:** fluxo de RSVP possível apenas com teclado; zoom liberado e modais acessíveis após correção.

### NFR-08 — Manutenibilidade

- Tokens centralizados no `tailwind.config` inline; CSS auxiliar no `<head>`.
- Adicionar/remover slide exige 3 edições: bloco do slide, indicador e constante `totalSlides`.
- Código organizado por comentários de seção (slides, modais, RSVP, navegação).
- **Aceite:** um desenvolvedor consegue localizar e alterar conteúdo sem build.

### NFR-09 — Publicação e deploy

- GitHub Pages via GitHub Actions em push para `main` ou execução manual.
- Workflow: checkout, Node 20, `npm ci`, configuração de identidade e `npm run deploy` (`gh-pages -d dist`).
- `dist/index.html` é a página publicada atualmente: um placeholder “Em construção”, com `noindex`.
- A POC **não** está em `dist/` e, portanto, não é o que está no ar.
- **Aceite:** workflow verde e site servindo `dist/`; publicar o convite real exige decisão e cópia de assets.

### NFR-10 — Indexação e metadados

- O placeholder em `dist/` tem `meta description`, `theme-color` e `meta robots noindex`.
- A POC não tem `noindex` nem `meta description`.
- **Aceite:** convite não deve ser indexado por buscadores; adicionar `noindex` ao app real.

### NFR-11 — Localização e formatos

- Todo o conteúdo em pt-BR.
- Datas por extenso: “20 de fevereiro de 2027”, “Sábado, às 16h”.
- Data do RSVP em `dd/mm/aaaa`.
- Sem i18n, moeda ou fuso configurável.
- **Aceite:** nenhum texto em outro idioma; acentuação correta.

### NFR-12 — Robustez de dados

- Leitura de cookie/localStorage em `try/catch` para JSON inválido.
- Fallback da chave específica para a genérica.
- Token desconhecido não gera erro; usa o grupo padrão.
- Lacunas: `localStorage.setItem` sem tratamento (pode lançar em modo privado/armazenamento bloqueado); cookie sem `Secure`; sem validação de esquema além de `status`/`token`.
- **Aceite:** valores corrompidos ou ausentes não impedem a navegação.

### NFR-13 — Qualidade dos assets

- Florais e foto foram recortados do mockup (sem originais), com upscale de ~1,3× no mobile e ~1,8× no card desktop.
- Fundo creme dos recortes coincide com `#F8EBDB`, evitando emendas.
- Assets não referenciados no HTML permanecem na pasta (legado).
- **Aceite:** em 390px e 1440px não há serrilhado ou emenda perceptível; troca por alta resolução é desejável.

---

## 7. Regras de negócio

| ID | Regra |
|---|---|
| BR-01 | O evento ocorre em 20/02/2027, sábado, às 16h, no Monarca Casarão, Belo Horizonte – MG. |
| BR-02 | Cerimônia e recepção acontecem no mesmo local. |
| BR-03 | O prazo exibido para confirmação é 20/01/2027; **não há bloqueio técnico** após essa data. |
| BR-04 | A confirmação é por grupo, com seleção individual de cada convidado. |
| BR-05 | É obrigatório selecionar ao menos 1 nome para confirmar. |
| BR-06 | Nomes não selecionados são tratados como ausentes. |
| BR-07 | Cada grupo tem um único registro de RSVP, editável e sobrescrito a cada nova confirmação. |
| BR-08 | O RSVP local é um comprovante, não a lista oficial; a validação é feita pela cerimonialista na recepção. |
| BR-09 | O token identifica o grupo, não a pessoa; não há autenticação. |
| BR-10 | Não há acompanhantes fora dos nomes previamente listados no grupo. |
| BR-11 | A lista de presentes é opcional; a chave PIX é o meio direto de contribuição. |
| BR-12 | O convite é privado; não deve ser indexado publicamente. |

---

## 8. Fluxos principais

### 8.1 Abertura e navegação

1. Convidado abre o link (`?c=<token>`).
2. App resolve o token e carrega o grupo.
3. Slide 1 é exibido.
4. Convidado navega por swipe, setas, indicadores ou teclado.

### 8.2 Primeira confirmação de presença

1. Convidado chega ao slide 4.
2. Vê o nome do grupo e a lista de convidados.
3. Marca quem comparecerá (≥ 1).
4. Botão habilita; toca em “Confirmar Presença”.
5. App grava cookie + localStorage, mostra toast e troca para o painel “Presença Registrada!”.

### 8.3 Retorno com RSVP existente

1. App lê a chave específica do token; se não houver, a genérica.
2. Valida `status` e `token`.
3. Exibe resumo com confirmados, ausentes e data.
4. Oferece WhatsApp e “Alterar Seleção”.

### 8.4 Edição da seleção

1. Convidado toca em “Alterar Seleção”.
2. Formulário reabre com os confirmados pré-marcados.
3. Altera e confirma novamente.
4. Registro anterior é sobrescrito.

### 8.5 Busca por nome

1. Convidado toca em “Buscar meu nome”.
2. Digita parte do nome.
3. App filtra até 6 grupos.
4. Convidado seleciona o grupo.
5. Lista e RSVP passam a ser daquele grupo.

### 8.6 Localização

1. No slide 3, toca em “Abrir no Mapa”.
2. Modal mostra endereço.
3. “Abrir GPS” leva ao Google Maps em nova aba.
4. “Fechar” retorna ao slide.

### 8.7 Presentes

1. No slide 5, toca em “Acessar Lista de Presentes”.
2. Modal mostra chave PIX e link externo.
3. “Copiar” copia a chave; “Site da Lista” abre o link; “Voltar” fecha.

---

## 9. Conteúdo e copy

### 9.1 Slide 1 — Capa

- NOSSO GRANDE DIA
- Tatiana & Tiago
- 20 | 02 | 2027
- UM NOVO CAPÍTULO DA NOSSA HISTÓRIA

### 9.2 Slide 2 — História

- VOCÊ FAZ PARTE DESSA HISTÓRIA
- “Estamos muito felizes em compartilhar com você um dos momentos mais especiais da nossa vida.”
- “Queremos que esteja ao nosso lado para celebrar o amor, a amizade e tudo o que construímos até aqui.”
- “Será um prazer ter você conosco!”

### 9.3 Slide 3 — Data, cerimônia e local

- DATA
- 20 DE FEVEREIRO DE 2027
- Sábado, às 16h
- CERIMÔNIA E RECEPÇÃO
- “A cerimônia e a recepção acontecerão no mesmo local, para que possamos viver esse momento especial juntos do início ao fim.”
- LOCAL
- MONARCA CASARÃO
- R. Praia Formosa, 247 — Alto Caiçaras / Belo Horizonte – MG
- ABRIR NO MAPA

### 9.4 Slide 4 — RSVP

- CONFIRME SUA PRESENÇA
- “Sua presença tornará o nosso dia ainda mais especial!”
- “Por favor, confirme sua presença até o dia 20 de janeiro de 2027.”
- “Selecione quem irá comparecer:”
- “Validação Oficial: A lista de presenças confirmadas será conferida e validada na recepção pela Cerimonialista do Casal.”
- CONFIRMAR PRESENÇA
- “Presença Registrada!”
- “Registrado com sucesso: A cerimonialista do casal fará a validação deste convite na entrada do evento.”
- ENVIAR COMPROVANTE À CERIMONIALISTA
- ALTERAR SELEÇÃO

### 9.5 Slide 5 — Presentes

- LISTA DE PRESENTES
- “O melhor presente é ter você com a gente! Mas, se desejar nos presentear, preparamos uma lista especial.”
- ACESSAR LISTA DE PRESENTES
- “Nossa lista oficial e chave PIX para quem desejar nos presentear:”
- Chave PIX (Telefone/Casal): `casamentotatianatiago@gmail.com`
- COPIAR
- SITE DA LISTA
- VOLTAR

### 9.6 Slide 6 — Encerramento

- Imagem única com foto do casal, florais, assinatura “Tatiana & Tiago” e “20 | 02 | 2027”.

---

## 10. Arquitetura e implementação

### 10.1 Estrutura atual

```
casamento/
├── poc/
│   ├── index.html              # app completo (HTML + CSS + JS)
│   ├── convite-slides-mobile.JPG # mockup de referência
│   └── assets/                 # flores, caligrafias e foto recortados
├── dist/
│   └── index.html              # placeholder "Em construção" publicado
├── .github/workflows/deploy.yml
├── DESIGN.md
├── README.md
├── package.json
└── package-lock.json
```

### 10.2 Stack

- HTML5 semântico.
- CSS via Tailwind Play CDN + estilos locais no `<head>`.
- JavaScript vanilla (ES6), sem módulos.
- Google Fonts (Cormorant Garamond).
- SVG inline para ícones.
- Assets locais (PNG/JPG).

### 10.3 Estrutura do `index.html`

- `<head>`: meta viewport, Tailwind CDN, fontes, `tailwind.config`, `<style>`.
- `#stage`: palco full-screen.
- `#cardViewport`: card de até 480px.
- `header`: navegação e indicadores.
- `#slidesContainer`: 6 `<section class="slide">`.
- `#mapModal` e `#giftModal`.
- `<script>`: base de convidados, storage, token, busca, RSVP, navegação, modais, toast e inicialização.

### 10.4 Integrações externas

| Integração | Uso | Observação |
|---|---|---|
| cdn.tailwindcss.com | Estilos | Requer internet; Play CDN |
| fonts.googleapis.com / gstatic.com | Cormorant Garamond | Requer internet |
| google.com/maps | Abrir GPS | Nova aba |
| api.whatsapp.com | Comprovante | Número placeholder |
| noivos.casar.com | Lista de presentes | Link provisório |

### 10.5 Deploy

- Workflow em `.github/workflows/deploy.yml`.
- Gatilhos: push em `main` e `workflow_dispatch`.
- Publica `dist/` na branch `gh-pages`.
- URL: `https://tiagocarmo.github.io/casamento`.
- **A POC não é publicada**; o ar continua sendo o placeholder.

### 10.6 Divergências entre documentação e código

| Tema | Documentação | Código (fonte de verdade) |
|---|---|---|
| Paleta | `DESIGN.md`: `#FDF9F2` / `#9E3C29` / `#4A3530` | `#F8EBDB` / `#B5402E` / `#2E1D12` |
| Tipografia | `DESIGN.md`: Parisienne/Great Vibes | Caligrafia em PNG; Cormorant Garamond |
| Link de presentes | `AGENTS.md`/`PLANO-VISUAL.md`: `href="#"` | Modal com PIX + `noivos.casar.com` |
| Swipe | `AGENTS.md`: 50px | 45px |
| Slide 6 | `PLANO-VISUAL.md`: citação ao vivo + degradê | Imagem única `p5-completo.jpg`, sem overlay |
| Base de convidados | “~110 pessoas” | 41 grupos / 103 nomes |
| Número da cerimonialista | Não documentado | Placeholder `5531999999999` |
| Deploy | — | `dist/` é placeholder, POC não publicada |

---

## 11. Pendências, riscos e decisões abertas

### 11.1 Pendências para produção

| ID | Pendência | Impacto | Prioridade |
|---|---|---|---|
| P-01 | Substituir o link provisório da lista de presentes pelo oficial | Convidado pode ser direcionado ao lugar errado | Must |
| P-02 | Substituir o WhatsApp placeholder da cerimonialista | Comprovante não chega ao destino | Must |
| P-03 | Substituir os 41 grupos/103 nomes placeholder pelos reais | Convites personalizados incorretos | Must |
| P-04 | Definir se o RSVP terá backend/sincronização | Hoje o registro é só local e não consolidável | Must |
| P-05 | Publicar o convite real em `dist/` | Hoje o site no ar é “Em construção” | Must |
| P-06 | Adicionar `noindex` e metadados ao app real | Exposição em buscadores | Should |
| P-07 | Trocar assets por versões em alta resolução | Qualidade visual em telas grandes | Should |
| P-08 | Corrigir acessibilidade (zoom, foco, ESC, reduced motion) | Conformidade e inclusão | Should |
| P-09 | Aplicar prazo real de RSVP ou deixar explícito que é apenas informativo | Expectativa do convidado | Should |
| P-10 | Tratar falha de `localStorage` e adicionar `Secure` ao cookie | Robustez e segurança | Could |
| P-11 | Remover assets não utilizados e atualizar `DESIGN.md` | Manutenção e consistência | Could |
| P-12 | Criar testes automatizados e lint | Qualidade em evolução | Could |

### 11.2 Riscos

| ID | Risco | Probabilidade | Impacto | Mitigação |
|---|---|---|---|---|
| R-01 | Exposição de nomes de convidados no HTML público | Alta | Médio | `noindex`, link não divulgado, avaliar ofuscação/backend |
| R-02 | RSVP perdido ao limpar dados, trocar de dispositivo ou navegador | Alta | Alto | Backend ou formulário oficial; orientar envio do comprovante |
| R-03 | Qualquer pessoa confirma por outro grupo via busca | Média | Alto | Verificação pela cerimonialista; token secreto ou backend |
| R-04 | Dependência de CDN (Tailwind/fontes) | Média | Médio | Build local de CSS e self-hosting de fontes |
| R-05 | Número/link placeholder chegarem em produção | Média | Alto | Checklist de go-live |
| R-06 | Baixa resolução dos assets recortados | Alta | Médio | Substituir pelos originais |
| R-07 | Prazo de RSVP não aplicado tecnicamente | Média | Baixo | Decidir regra e implementar |
| R-08 | Tailwind Play CDN não recomendado para produção | Alta | Médio | Migrar para build estático |
| R-09 | Perda de dados por falha de `localStorage` | Baixa | Médio | `try/catch` e fallback para cookie |

### 11.3 Decisões abertas

| ID | Decisão | Opções |
|---|---|---|
| D-01 | O RSVP será local ou terá backend? | Manter local + WhatsApp / backend + painel |
| D-02 | Qual será o canal oficial de validação? | WhatsApp da cerimonialista / planilha / sistema |
| D-03 | O convite real será publicado em `dist/`? | Sim, substituir placeholder / manter placeholder |
| D-04 | Qual paleta é canônica? | POC (`#F8EBDB`) / `DESIGN.md` (`#FDF9F2`) |
| D-05 | Qual lista de presentes será usada? | Casar.com / outra plataforma / só PIX |
| D-06 | O convite deve ser indexável? | Não (recomendado) / sim |
| D-07 | O prazo de 20/01/2027 será bloqueante? | Sim / não |
| D-08 | Haverá acompanhantes fora da lista? | Não / sim, com regra |
| D-09 | Quando trocar os assets pela alta resolução? | Antes do go-live / depois |

---

## 12. Critérios de aceite globais

### 12.1 Experiência

- [ ] Abrir em 390×844, 768×1024 e 1440×900 sem overflow ou conteúdo cortado.
- [ ] Navegar pelos 6 slides com swipe, setas, indicadores e teclado.
- [ ] O indicador ativo acompanha o slide.
- [ ] Nenhum texto sobrepõe florais ou outro texto.

### 12.2 RSVP

- [ ] Token válido carrega o grupo correto; token inválido não quebra.
- [ ] Botão desabilitado sem seleção e habilitado com ≥ 1.
- [ ] Confirmação grava cookie + localStorage e mostra resumo.
- [ ] Recarregar mantém o estado.
- [ ] “Alterar Seleção” pré-marca os confirmados.
- [ ] Edição sobrescreve o registro.
- [ ] Busca por nome encontra e carrega o grupo.
- [ ] WhatsApp abre com a mensagem correta.
- [ ] JSON corrompido não quebra a página.

### 12.3 Conteúdo e integrações

- [ ] Data, horário e endereço corretos.
- [ ] Modal do mapa abre, fecha e leva ao Google Maps.
- [ ] Chave PIX copia corretamente.
- [ ] Link da lista abre em nova aba.
- [ ] Slide 6 exibe a imagem inteira.

### 12.4 Qualidade técnica

- [ ] Console limpo (exceto aviso do Tailwind Play CDN).
- [ ] Sem requisições quebradas de assets.
- [ ] `noindex` no app publicado.
- [ ] Build/deploy do GitHub Pages verde.
- [ ] Acessibilidade mínima: foco visível, zoom liberado, modais com ESC.

### 12.5 Conteúdo final

- [ ] Nomes reais dos grupos e convidados.
- [ ] WhatsApp real da cerimonialista.
- [ ] Link real da lista de presentes.
- [ ] Assets em alta resolução.
- [ ] Revisão ortográfica da copy.

---

## 13. Glossário

| Termo | Definição |
|---|---|
| **RSVP** | Confirmação de presença. |
| **Token** | Identificador do grupo de convidados na URL (ex.: `fam-viana`). |
| **Grupo** | Conjunto de convidados que recebe um mesmo link (família, casal, padrinhos). |
| **Grupo dos noivos** | Grupo padrão usado quando não há token válido. |
| **Cerimonialista** | Profissional que valida a lista de presença na recepção. |
| **POC** | Proof of Concept; implementação atual em `poc/index.html`. |
| **Play CDN** | Versão do Tailwind que compila classes no navegador em runtime. |
| **Deep link** | URL que abre o app diretamente em um slide (`?slide=N`). |
| **PII** | Informação pessoal identificável (nomes dos convidados). |

---

## 14. Histórico de versões

| Versão | Data | Autor | Mudança |
|---|---|---|---|
| 1.0.0 | 22/10/2026 | Equipe do projeto | Requisitos extraídos da POC; documento inicial. |
