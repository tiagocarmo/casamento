# Plano 2 — Fundos florais responsivos · Consolidado

**Data:** 22 de outubro de 2026. **Tarefa:** 2 — Incluir fundos florais.

**Liberação:** v2 concluída e aprovada pelo usuário; publicação autorizada. `src/` e `dist/` contêm o mesmo HTML e os mesmos 14 florais.

Este documento reúne a implementação inicial e todas as revisões aprovadas da versão 2. As seções 1 a 4 descrevem o estado final; a seção 5 mantém o histórico resumido. [Tarefas](../TASKS.md) · [Validação](2-validation.md) · [Assets e prompts](2-assets.md).

## 1. Resultado e limites

- Convite completo em `src/index.html`, com as mesmas cinco seções, textos e interações da [tarefa 1](1-plan.md).
- Adicionar somente florais decorativos: apresentação, história, evento, confirmação/presentes e fechamento. Sem fotografia do casal ou espaço reservado para ela.
- Preservar creme `#F6E9D9`, terracota `#B5422F`, marrom `#4A3530`, Cormorant Garamond, Parisienne, ícones SVG inline e divisores com coração.
- Em retrato com largura abaixo de 768px, manter cinco slides e conteúdo integral sem rolagem desde **320×480 pixels CSS**, em uso normal. Modais, zoom/texto ampliado e condições excepcionais conservam rolagem acessível.
- Em paisagem, tablet e desktop, manter as cinco seções em fluxo vertical, com largura máxima de 800px e altura natural. Sem JavaScript, manter leitura vertical.
- Preservar navegação circular, indicadores, swipe, teclado, deep links, rotação, foco e modais. Confirmar presença continua com `href="#"` e ação padrão impedida; o link de presentes continua provisório.
- CSS próprio e JavaScript internos, sem framework, build, dependências, API, backend, formulários, cookies, analytics ou dados de convidados.
- Implementação aprovada em `src/` e espelhada em `dist/`, incluindo os 14 assets. A aprovação final autoriza commit, envio a `main` e publicação pelo workflow existente, sem alterações na infraestrutura.

## 2. Assets e composição

Usar os originais de `/home/tiago-carmo/PESSOAL/casamento/slides-bg`, preservados também em `slides-bg/` no repositório. Não consumir `5-exemplo-recorte.jpeg`, cujo quadriculado está incorporado à imagem.

A primeira etapa extraiu os florais com imagegen nativo e transparência real; recorte e redimensionamento preservaram as proporções. A revisão final acrescentou duas composições horizontais exclusivas do desktop, geradas com os florais do fechamento como referência de estilo e cor. Os 12 arquivos anteriores permaneceram intactos.

| Seção | Arte final |
|---|---|
| Apresentação | Duas peças de 1.jpeg, superior esquerda e inferior direita. |
| História | Duas peças de 2.jpeg, superior direita e inferior esquerda. |
| Evento | Duas peças de 3.jpeg, superior direita e inferior esquerda. |
| Confirmação/presentes | Quatro peças de 4.jpeg, uma em cada canto. |
| Fechamento abaixo de 768px | `5-top.webp` e `5-bottom.webp`, derivados de 5.jpeg, preservados para o mobile. |
| Fechamento a partir de 768px | `5-top-desktop.webp` de **800×77px** e `5-bottom-desktop.webp` de **800×91px**. |

- **14 arquivos WebP com alpha real**, locais em `src/assets/florals/`, com meta de até 1,5 MB no conjunto. As únicas variantes por formato são as duas faixas do fechamento desktop.
- Camadas decorativas em `::before` e `::after`, sem interceptar cliques ou integrar a leitura assistiva; conteúdo acima das imagens.
- Área central livre, proporções naturais, recortes deliberados nas bordas, sem papel de fundo, quadriculado, retângulos de cor ou halos perceptíveis.
- Manter a superfície creme em CSS e as máscaras suaves do fechamento. Falhas de imagem não devem impedir leitura ou interação.
- Registrar origens, prompts, tratamento, dimensões e pesos no [inventário](2-assets.md).

## 3. Responsividade e ajustes visuais finais

### Densidade e conteúdo sem rolagem

- Palco baseado em `100dvh`, com fallback `100vh` e áreas seguras.
- Sete controles do cabeçalho em uma linha desde 320px, com alvos mínimos de **44×44px**.
- Medir os cinco slides e escolher a primeira densidade em que todos cabem: confortável (**18px**), intermediária (**16px**) ou compacta (**14px**).
- Recalcular com fontes, resize e alterações do viewport interno. Reduzir espaços e ornamentos nos modos menores, preservando todos os textos e ações.
- No compacto, reduzir ícones decorativos e omitir os divisores do evento e o primeiro da confirmação. Manter a rolagem de segurança para acessibilidade; ocultar overflow não substitui o encaixe real.
- Não reduzir a tipografia ou os controles para acomodar os aumentos florais das revisões.

### Cantos florais

Larguras em pixels CSS, na ordem topo/base. Na confirmação/presentes, cada valor corresponde aos dois cantos do respectivo par.

| Seção | Desktop, ≥768px | Retrato confortável | Retrato intermediário | Retrato compacto |
|---|---|---|---|---|
| Apresentação | 240/260 | `clamp(180px, 55vw, 240px)` nos dois cantos | 135/135 | 110/110 |
| História | 190/210 | 195/195 | 135/150 | 85/100 |
| Evento | 190/180 | Base 110/125, com crescimento por altura | Base 85/95, com crescimento por altura | 52/65 |
| Confirmação/presentes | 180/160 | 140/140 | 96/80 | 44/48 |

**Crescimento do evento em retrato:** até 668px de altura, usar a base da densidade. Entre 668px e 956px, acrescentar progressivamente até 70px no topo e 55px na base, com interpolação linear e limite superior. Em **440×956**, o modo confortável resulta em **180/180px**. O compacto não recebe esse acréscimo. Usar altura dinâmica quando suportada, com fallback, e alterar somente o CSS do slide de evento.

**Paisagem abaixo de 768px:** preservar os cantos anteriores: apresentação 240/260, história 190/210, evento 130/180 e confirmação/presentes 140/160. Sem crescimento por altura.

### Fechamento e prazo de confirmação

- **Fechamento desktop, ≥768px:** faixas novas ocupam 100% da largura útil, com topo de 77px e base de 91px. Esses valores reduzem em aproximadamente 30% as alturas de referência anteriores. Flores recompostas horizontalmente, com proporções naturais; padding acompanha as faixas, com 32px de respiro para o conteúdo.
- **Fechamento em retrato mobile:** preservar assets e composição aprovados. Alturas topo/base: confortável 145/175px; intermediário 105/125px; compacto 60/75px. Respiros de 20px, ou 8px no compacto.
- **Fechamento em paisagem abaixo de 768px:** preservar as faixas originais, com alturas de 220/260px e respiros de 32px.
- **Prazo:** preservar exatamente “Por favor, confirme sua presença até o dia 20 de janeiro de 2027.” No desktop, ampliar somente esse parágrafo para até 640px, com a frase em uma linha no container de 800px e data agrupada para evitar o ano isolado. No mobile, manter quebra natural.

## 4. Validação, documentação e entrega

O [registro de validação](2-validation.md) separa três execuções: entrega inicial, primeira revisão visual e ajustes finais. Os resultados antigos são históricos; não representam repetição de testes na revisão atual.

**Cobertura inicial já realizada:** matriz de 13 dimensões, 112 combinações adicionais de altura/fontes e verificações de navegação, modais, acessibilidade e resiliência. Não repetir essa bateria para ajustes visuais pontuais.

**Validação final direcionada, em Chrome emulado:**

- 375×667 e 440×668: evento preservado e encerramento mobile inalterado.
- 440×800 e 440×956: flores progressivamente maiores, centro de leitura livre e ausência de rolagem.
- 1440×900: faixas completas na largura útil, dimensões corretas e ausência de distorções ou emendas.
- Transparência, carregamento das duas peças e clique no botão de localização.
- Registrar capturas e medidas; conferir a preservação dos assets anteriores e comparar o encerramento mobile antes/depois.

Registrar separadamente emulação e aparelhos reais; declarar lacunas em Firefox, Safari/iOS e aparelhos físicos. Não adicionar infraestrutura de testes ao projeto.

**Consolidação documental obrigatória:**

- Este plano é a referência única da tarefa 2, organizado pelo comportamento final, com histórico breve separado.
- Atualizar README, PRD e design nos pontos afetados: 14 assets, variantes desktop, crescimento por altura e v2 aprovada para publicação.
- Manter inventário com os prompts e registro de validação por execução.
- Conferir links e `TASKS.md`, preservando números: tarefa 1 concluída; tarefa 2 com `[plano](plans/2-plan.md)` e concluída após implementação, validação e documentação; tarefa 3 de confirmação de convidados pendente.

**Aceite:** florais legíveis e consistentes com as referências; conteúdo integralmente acessível; ausência de rolagem normal em retrato desde 320×480; corpo mínimo de 14px e alvos mínimos de 44×44px; encerramento mobile preservado; faixas desktop exclusivas em toda a largura; documentação coerente. Foto do casal, RSVP e link definitivo dos presentes continuam como evoluções futuras. Para publicar a v2 aprovada, conferir igualdade de src/dist, abertura por HTTP e carregamento dos assets; acompanhar o workflow e verificar o conteúdo servido no destino.

## 5. Histórico resumido

| Revisão | Resultado |
|---|---|
| Inicial | 12 recortes transparentes, cinco composições e compactação por medidas reais para retrato sem rolagem. |
| Primeira revisão visual | Cantos maiores nos slides indicados, prazo completo em uma linha no desktop e primeiro ajuste de discrição do fechamento. |
| Ajustes finais | Crescimento do evento acima de 668px, duas novas faixas desktop em 800×77/91px, mobile preservado e conjunto de 14 assets. |
| Consolidação | Plano reorganizado pelo estado final, testes separados por execução e documentos/tarefas alinhados. |
| Liberação da v2 | Aprovação final e promoção do HTML e dos 14 florais para dist/, com publicação autorizada em main pelo workflow existente. |
