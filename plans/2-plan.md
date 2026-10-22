# Plano 2 — Incluir as imagens do convite · Consolidado

**Data:** 22 de outubro de 2026. **Tarefa:** 2 — Incluir as imagens do convite.

**Estado:** implementação e validação concluídas; imagens e entrega aprovadas pelo usuário, incluindo merge na `main` e deploy da última versão. A fotografia é a última etapa da tarefa 2. A tarefa 3 continua sendo a confirmação de convidados e ainda não possui plano.

Este documento reúne o comportamento final da versão 2. Instruções intermediárias superadas aparecem somente no histórico. [Tarefas](../TASKS.md) · [Validação](2-validation.md) · [Assets e prompts](2-assets.md).

## 1. Resultado e limites

- Cinco seções, com todos os textos e interações da [tarefa 1](1-plan.md). Os quatro primeiros slides permanecem iguais à v2 floral aprovada.
- Florais transparentes nas cinco seções e fotografia do casal no encerramento, com flores somente na base dessa seção.
- Preservar creme `#F6E9D9`, terracota `#B5422F`, marrom `#4A3530`, Cormorant Garamond, Parisienne, SVG inline e divisores com coração.
- Em retrato abaixo de 768px, carrossel sem rolagem normal desde **320×480 pixels CSS**. Modais e ampliação mantêm rolagem acessível quando necessária.
- Em paisagem, tablet e desktop, fluxo vertical em coluna de até 800px. O encerramento desktop tem aproximadamente 800×720px. Sem JavaScript, leitura vertical.
- Preservar navegação circular, indicadores, swipe, teclado, deep links, contexto na rotação e modais. RSVP permanece sem ação; presentes mantêm o destino provisório.
- CSS próprio e JavaScript internos, sem framework, build, novas dependências, backend, formulários, cookies, analytics ou dados de convidados.
- A etapa fotográfica foi preparada em `src/`, preservando `dist/` durante a revisão. A aprovação final posterior autoriza espelhar a entrega em `dist/`, integrar à `main` e publicar pelo workflow existente.

## 2. Florais

Originais de `/home/tiago-carmo/PESSOAL/casamento/slides-bg`, também preservados em `slides-bg/`. Não usar o JPEG com quadriculado incorporado. Extração com imagegen nativo, transparência real, recorte e redução proporcional; duas faixas desktop recompostas posteriormente.

| Seção | Composição vigente |
|---|---|
| Apresentação | `1-top-left.webp` e `1-bottom-right.webp`. |
| História | `2-top-right.webp` e `2-bottom-left.webp`. |
| Evento | `3-top-right.webp` e `3-bottom-left.webp`. |
| Confirmação/presentes | Quatro cantos derivados de `4.jpeg`. |
| Encerramento abaixo de 768px | Somente `5-bottom.webp`, sobre a fotografia. |
| Encerramento a partir de 768px | Somente `5-bottom-desktop.webp`, de 800×91px, sobre a fotografia. |

Os **14 arquivos WebP com alpha** permanecem preservados, somando 1.328.210 bytes. As duas peças de topo do encerramento são históricas e não são consumidas pela composição fotográfica. Camadas decorativas não interceptam cliques nem integram a leitura assistiva. CSS define as superfícies e as máscaras suaves; proporções e área central de leitura são preservadas.

## 3. Responsividade e ajustes dos quatro primeiros slides

### Densidade e encaixe

- Altura dinâmica `100dvh`, fallback `100vh` e áreas seguras.
- Sete controles em uma linha desde 320px, alvos mínimos de **44×44px**.
- Medir os cinco slides e escolher a primeira densidade em que todos cabem: confortável (**18px**), intermediária (**16px**) ou compacta (**14px**).
- Recalcular após fontes, resize e alterações do viewport interno. Reduzir espaços e ornamentos antes dos textos; nunca escalar a interface ou esconder conteúdo para simular encaixe.
- No compacto, reduzir ícones e omitir os divisores densos do evento e o primeiro da confirmação. Preservar rolagem de segurança para acessibilidade.

### Cantos florais

Larguras em pixels CSS, topo/base. Na confirmação, cada valor corresponde aos dois cantos do respectivo par.

| Seção | Desktop ≥768px | Retrato confortável | Retrato intermediário | Retrato compacto |
|---|---|---|---|---|
| Apresentação | 240/260 | `clamp(180px, 55vw, 240px)` nos dois cantos | 135/135 | 110/110 |
| História | 190/210 | 195/195 | 135/150 | 85/100 |
| Evento | 190/180 | Base 110/125, crescimento por altura | Base 85/95, crescimento por altura | 52/65 |
| Confirmação/presentes | 180/160 | 140/140 | 96/80 | 44/48 |

No evento, preservar a base até 668px de altura. De 668 a 956px, acrescentar linearmente até 70px no topo e 55px na base, com limite superior. Em **440×956**, o confortável resulta em **180/180px**. O compacto não cresce.

Em paisagem abaixo de 768px, preservar os cantos anteriores: apresentação 240/260, história 190/210, evento 130/180 e confirmação 140/160.

**Prazo:** manter exatamente “Por favor, confirme sua presença até o dia 20 de janeiro de 2027.” No desktop, esse parágrafo pode chegar a 640px, permitindo a frase inteira em uma linha no container de 800px. Agrupar a data para evitar o ano isolado; no mobile, permitir quebra natural.

## 4. Fotografia do encerramento

### Preservação e exportação

- Fonte preservada: `photo-original/IMG_2809.JPG`, 768×1376px. Referência: `slides/convite-5.png`.
- Prioridade obrigatória: preservar identidade, proporções, expressão, beijo, cabelos, óculos, corpos e roupas. Sem retoque facial, embelezamento ou aumento artificial de detalhes.
- Retrato: exportação direta da original, sem geração, em **480×860** e **768×1376px**.
- Paisagem: expansão com imagegen em canvas 4:3; restaurar os pixels originais sobre toda a região protegida do casal antes de reduzir/exportar. Gerar **800×600** e **1200×900px**.
- O cenário lateral e pequenas continuações além dos limites do enquadramento original são sintéticos. A suavização e a compatibilização de luz ocorrem na base gerada; a região protegida original é recomposta por cima. Não usar diretamente uma geração que redesenhe o casal.
- Redimensionamento proporcional e enquadramento por recorte. A prova de preservação compara o master antes da redução/compressão; WebP final tem compressão com perdas, não igualdade binária com o JPEG.
- Sem aquecimento adicional: a luz dourada da fonte já combina com o convite.
- Quatro WebP em `src/assets/photos/`, qualidade 86, sem metadados. Maiores arquivos: **107.774 bytes no retrato** e **112.500 bytes na paisagem**, abaixo das metas de 180/250 KB.

### Composição e carregamento

- Fotografia em `<picture>` com descrição acessível, `srcset`, dimensões reservadas, carregamento nativo sob demanda e decodificação assíncrona.
- Retrato abaixo de 768px usa a fotografia vertical; paisagem ou largura ≥768px usa a horizontal. Selecionar uma variante na abertura, sem baixar os dois formatos.
- Frase em HTML/Parisienne, terracota escuro `#8D2E21`, com divisor abaixo. Retrato confortável usa três linhas e inclinação leve; intermediário/compacto usam duas linhas sem inclinação. Fluxo vertical usa duas linhas inclinadas quando houver espaço.
- Assinatura e data em creme claro `#FFF8EF`, acima das flores. Gradientes localizados clareiam o céu e escurecem a faixa de assinatura, preservando a leitura e evitando texto sobre os rostos.
- Desktop: altura mínima de 720px; paisagem estreita: ao menos 560px. A imagem usa `object-fit: cover`, posição central inferior e escala uniforme, sem alongamento.
- Flores inferiores: 120px no confortável, 85px no intermediário, 50px no compacto; 72px na paisagem estreita e 91px a partir de 768px.
- Sem foto/fontes, manter textos, dimensões e contraste. Texto ampliado pode usar a rolagem de segurança.

## 5. Validação e conclusão

O [registro](2-validation.md) separa cada execução. A matriz inicial e as 112 combinações são históricas e não são repetidas nas revisões pontuais.

Na etapa fotográfica, revisar somente o encerramento em Chrome emulado: **320×480, 375×667, 440×956, 667×375, 768×1024 e 1440×900**. Conferir enquadramento, comparação com original, leitura, contraste, encaixe real sem rolagem, variante/peso selecionados e carregamento único. Verificar pontualmente navegação, rotação, modais, foto ausente, fontes alternativas e texto ampliado.

Preservar os quatro primeiros slides, JavaScript e os 14 florais. Registrar capturas/medidas, prompts e tratamento no inventário; declarar ausência de teste em aparelho físico, Firefox e Safari/iOS nesta revisão.

**Aceite:** implementação funcional, casal preservado acima da aproximação estética, retrato normal sem rolagem, corpo mínimo de 14px, controles de 44×44px, imagens otimizadas, documentação consolidada e tarefa 2 concluída. A aprovação posterior do usuário encerrou os ajustes visuais e autorizou merge na `main` e deploy. RSVP e link definitivo dos presentes permanecem pendentes.

## 6. Histórico resumido

| Revisão | Resultado |
|---|---|
| Florais iniciais | 12 recortes transparentes e compactação por medidas reais. |
| Primeira revisão visual | Cantos maiores, prazo em uma linha no desktop e fechamento mais discreto. |
| Revisão dos florais | Evento cresce acima de 668px; duas faixas desktop de 800×77/91px; 14 assets. |
| Liberação floral | V2 aprovada, espelhada em dist/ e publicada pelo workflow existente. |
| Etapa final das imagens | Foto retrato/paisagem, casal protegido, frase no céu, assinatura clara e flores somente na base. Esta etapa substitui o fechamento anterior sobre creme. |
| Aprovação final | Usuário aprovou as imagens, concluiu a tarefa 2 e autorizou integrar à main e publicar a última versão. |
