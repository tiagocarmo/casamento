# Validação — Plano 2

**Data:** 22 de outubro de 2026.

**Entrega:** [convite com florais](../src/index.html), conforme [plano 2](2-plan.md). [Assets, origens e prompts](2-assets.md).

Este documento preserva as execuções separadas: entrega inicial, **Revisão visual — validação simplificada**, **Ajustes finais — celulares altos e faixas desktop** e **Liberação da v2 — promoção para dist**. As seções históricas descrevem o estado da respectiva entrega; a liberação e o [plano consolidado](2-plan.md) registram o estado vigente. A matriz extensa não foi repetida nas revisões.

## Ambiente e método

Chrome **153.0.8010.52**, Linux, modo headless, com Playwright já disponível no ambiente. Nenhuma dependência ou infraestrutura de testes foi adicionada ao projeto.

Foram usados HTTP local, abertura `file://`, medições de geometria, teclado, toque emulado e capturas para inspeção visual. Roteiros e capturas auxiliares ficaram fora do repositório.

## Matriz principal

As cinco seções foram percorridas em todas as dimensões. O conteúdo textual foi comparado ao da tarefa 1: nenhum texto foi removido ou alterado.

| Dimensão em pixels CSS | Formato | Resultado |
|---|---|---|
| 320×480 | Carrossel | Passou: cinco slides completos, sem área rolável |
| 320×568 | Carrossel | Passou: cinco slides completos, sem área rolável |
| 360×640 | Carrossel | Passou: cinco slides completos, sem área rolável |
| 390×844 | Carrossel | Passou: cinco slides completos, sem área rolável |
| 430×932 | Carrossel | Passou: cinco slides completos, sem área rolável |
| 568×320 | Vertical | Passou |
| 667×375 | Vertical | Passou |
| 844×390 | Vertical | Passou |
| 768×1024 | Vertical | Passou |
| 1024×768 | Vertical | Passou |
| 1280×720 | Vertical, até 800px | Passou |
| 1440×900 | Vertical, até 800px | Passou |
| 1920×1080 | Vertical, até 800px | Passou |

Em retrato, foram verificados: altura rolável da página/slides, limites do conteúdo dentro da seção, ausência de overflow horizontal, corpo mínimo de 14px, alvos mínimos de 44×44px e os sete controles do cabeçalho em uma linha. A rolagem de segurança continua disponível para ampliação e outros cenários excepcionais; o encaixe normal não é obtido cortando o texto.

## Alturas intermediárias, fontes e área útil

- **112 combinações adicionais:** larguras 320, 360, 390 e 430; alturas 480, 568, 600, 601, 640, 700, 740, 741, 800, 844, 900, 901, 932 e 1000; cada combinação com fontes carregadas e com Google Fonts bloqueado. Nenhum slide precisou de rolagem.
- **Áreas seguras simuladas:** reserva de 20px no topo e 34px na base, em 320×480, com fontes normais e alternativas. Cinco slides sem overflow.
- **Altura disponível reduzida sem alterar a media query:** palco reduzido de 844px para 480px, mantendo a viewport de teste. A medição por ResizeObserver escolheu a densidade compacta e preservou a seção aberta, sem overflow.
- **Resposta tardia das fontes:** não desfaz uma rolagem já iniciada pelo leitor no fluxo vertical.

A simulação de áreas seguras e altura reduzida testa reservas de espaço e reação à área útil; não equivale a operar a barra de endereço de Safari/iOS ou Chrome em aparelho físico.

## Arte e carregamento

- 12 WebP RGBA, todos com alpha real, pixels transparentes e opacos. Total **1.221.838 bytes**, aproximadamente **1,22 MB**, abaixo da meta de 1,5 MB.
- Mesmas peças em todos os formatos; nenhum conjunto específico por dispositivo.
- Inspeção sobre creme e em capturas de smartphone pequeno/grande, paisagem, tablet e desktop: bordas limpas, proporções preservadas, sem quadriculado ou retângulos de fundo. Centro de leitura livre; flores menores nos blocos densos.
- Faixas do fechamento com transição gradual de alpha em CSS; sem fotografia do casal ou espaço reservado para ela.
- Originais JPEG preservados e conferidos por SHA-256. O exemplo JPEG com quadriculado não é consumido pelo convite.
- Os 12 arquivos decodificam por `file://` e carregam por HTTP local sem erros.
- Bloqueio de todos os WebP nas 13 dimensões: conteúdo e geometria permanecem funcionais e, em retrato normal, sem rolagem.
- Nenhum erro de JavaScript ou recurso floral quebrado nos testes normais. Falhas de fontes/imagens nos cenários de resiliência foram provocadas intencionalmente.

## Navegação e acessibilidade

As 12 verificações de regressão passaram: botões/indicadores e ciclo, teclado, deep links válidos/inválidos em celular/desktop, placeholder sem ação, modais com foco/Tab/Shift+Tab/Escape/backdrop, rotação e preservação da seção, rotação com modal aberto, modais em paisagem curta, swipe emulado e gesto vertical, redução de movimento, ausência de storage/cookies e fallback sem JS/fontes.

Verificações adicionais:

- Texto ampliado mantém rolagem interna acessível até os botões.
- Reflow equivalente a zoom de 200% no menor celular (160×240) preserva controles, leitura e ausência de overflow horizontal. Não constitui teste de pinch zoom físico.
- Sem JavaScript, os cinco blocos continuam em fluxo vertical, com os florais locais.
- Camadas decorativas não interceptam cliques nem adicionam conteúdo à leitura assistiva.
- Referências ARIA/SVG, IDs, sintaxe de JavaScript, links de documentação e `git diff --check` conferidos.

## Correções e decisão de implementação

A revisão independente confirmou a transparência, a preservação dos originais e a qualidade visual das amostras, mas encontrou dois excessos de altura: imediatamente acima do corte fixo de compactação (741px) e no fechamento com fonte alternativa e áreas seguras.

**Decisão:** escolher a densidade por medidas reais dos cinco slides, tentando confortável (18px), intermediária (16px) e compacta (14px), e recalcular com fontes, resize e alterações do viewport interno. Essa implementação substitui cortes fixos de altura e cobre também alturas intermediárias e redução da área útil. Não reduz o corpo abaixo de 14px nem os alvos abaixo de 44px.

Foram ajustados o respiro floral do fechamento, margens/ícones decorativos dos blocos densos, o limite de largura dos divisores em zoom e o escopo dos estilos de cada densidade. As falhas foram reproduzidas antes das correções e os cenários correspondentes passaram após os ajustes.

## Limites e entrega

**Testado:** Chrome headless, viewports e toque emulados, fontes indisponíveis, imagens indisponíveis, reservas de área segura e ampliação simuladas.

**Não testado:** Firefox, Safari/iOS, aparelhos físicos e leitor de tela real. Não se declara cobertura desses ambientes.

`dist/`, workflow, dependências, mockups e originais foram preservados. A tarefa 2 fica em `src/` para aprovação visual; não houve commit, push ou deploy nesta entrega. Foto do casal, RSVP e link definitivo de presentes continuam fora deste escopo.

## Revisão visual — validação simplificada

**Data:** 22/10/2026. **Ambiente:** Chrome 153.0.8010.52 headless, com viewports/toque emulados. Não houve repetição das 112 combinações, da matriz completa ou de testes em outros navegadores.

Alterações restritas à composição floral e à largura do prazo de confirmação. Os 12 WebP, textos, fontes, controles e JavaScript foram preservados. O modo compacto e a paisagem de smartphone mantêm as medidas florais anteriores.

| Dimensão | Cobertura e medidas | Resultado |
|---|---|---|
| 440×956 | Cinco slides, densidade confortável; altura útil/rolável de cada slide: 903/903px. | Passou, sem rolagem; flores maiores e textos separados. |
| 375×667 | Cinco slides, densidade intermediária; altura útil/rolável: 614/614px. | Passou, sem rolagem; flores visíveis nos slides 2, 3 e 4. |
| 320×480 | Cinco slides, densidade compacta; altura útil/rolável: 427/427px. | Passou, sem rolagem ou cortes. |
| 1440×900 | Fluxo vertical; revisão visual dos slides 3, 4 e 5. Prazo com largura de 640px e uma linha. Fechamento reduzido de 843px para 603px de altura. | Passou; faixas menores, texto preservado e ano junto à data. |
| 667×375 | Cinco seções em sequência, controles de carrossel ausentes e sem overflow horizontal. | Passou; composição de paisagem preservada. |

Nos três retratos, medidas confirmam conteúdo dentro da área disponível, corpo mínimo de 14px, botões e sete controles do cabeçalho com alvos de pelo menos 44×44px. As densidades permaneceram confortável, intermediária e compacta, respectivamente; não foi preciso compactar mais os textos para acomodar as flores.

A revisão visual das capturas confirmou centro de leitura livre, proporções preservadas e ausência de colisões entre florais e textos/botões nas telas combinadas. Os cinco slides mantêm exatamente a copy anterior. Nenhum erro de JavaScript foi observado.

**Prazo:** o teste reproduziu duas linhas antes da correção, com parágrafo de 464px; após a ampliação para 640px, confirmou uma linha e o texto integral inalterado.

**Verificação breve de interação:** indicadores, avanço circular do quinto ao primeiro slide e abertura dos dois modais por clique passaram; Escape fechou os modais. A primeira execução do roteiro usou seletores de teste incorretos para os modais; o roteiro foi corrigido para os atributos existentes e a execução final passou. Isso não exigiu alteração no JavaScript do convite.

**Evidências locais:** capturas individuais, painéis `440x956-review.jpg`, `375x667-review.jpg`, `320x480-review.jpg`, `desktop-review.jpg`, roteiro e medidas em `results.json`, no diretório `/tmp/casamento-plan2-revision/`. Os painéis são capturas de QA, sem integração aos assets do convite.

**Revisão estática independente:** nenhum problema concreto nas media queries, na precedência do modo compacto, no parágrafo do prazo ou nas faixas do fechamento. Conferências finais: JavaScript idêntico ao da entrega anterior e com sintaxe válida, links locais de documentação válidos e `git diff --check` sem erros.

**Limites:** apenas Chrome emulado nesta revisão; não houve novo teste em Firefox, Safari/iOS ou aparelhos reais. Permanecem os limites de cobertura registrados anteriormente. Nenhuma infraestrutura de testes foi adicionada. `dist/` preservado, sem commit, push ou publicação.

## Ajustes finais — celulares altos e faixas desktop

**Data:** 22/10/2026. **Ambiente:** Chrome 153.0.8010.52 headless, com viewports e toque emulados. Validação restrita aos slides de evento e fechamento nos cinco cenários aprovados; sem repetir as 112 combinações, a bateria completa ou outros navegadores.

### Medidas e inspeção visual

| Viewport | Densidade | Evento: larguras topo/base | Altura útil/rolável do evento | Fechamento |
|---|---|---|---|---|
| 375×667 | Intermediária | 85/95px, sem alteração | 614/614px | Captura idêntica à anterior. |
| 440×668 | Intermediária | 85/95px, sem alteração | 615/615px | Captura idêntica à anterior. |
| 440×800 | Confortável | 142,083/150,208px | 747/747px | Captura idêntica à anterior. |
| 440×956 | Confortável | 180/180px | 903/903px | Captura idêntica à anterior. |
| 1440×900 | Vertical | 190/180px, sem alteração | Altura natural de 896px | Novas faixas de 77/91px, em 100% da largura útil. |

Nos quatro retratos, o evento e o fechamento não têm área rolável; conteúdo dentro da área disponível e nenhuma rolagem horizontal. A inspeção das capturas em 440×800 e 440×956 confirmou cantos maiores, proporções naturais e centro de leitura livre, sem colisões com data, endereço ou botão. A comparação binária dos PNGs antes/depois confirmou que o encerramento mobile é visualmente idêntico nas quatro dimensões.

No desktop, o container mantém 800px com bordas, portanto a largura útil renderizada é 798px. As artes de 800px preenchem toda essa área, com escala uniforme e sem os espaços laterais anteriores. O fechamento tem altura natural de 531px; faixas menores e máscaras suaves para creme, sem distorção ou emendas.

### Assets e preservação

- Novos arquivos: `5-top-desktop.webp` de **800×77px**, 47.874 bytes; `5-bottom-desktop.webp` de **800×91px**, 58.498 bytes.
- Ambos RGBA com alpha de 0 a 255; há arte em todas as 800 colunas, sem margens laterais inteiras vazias. Exportação por redução uniforme e recorte vertical, sem deformar a ilustração.
- Total final: **14 peças, 1.328.210 bytes**, aproximadamente **1,33 MB**, abaixo da meta de 1,5 MB.
- SHA-256 confirmou os **12 assets anteriores idênticos**, incluindo as duas faixas mobile. Os originais JPEG permanecem preservados.
- Novo crescimento restrito ao CSS do evento em carrossel; compacto, tipografia, conteúdo, controles e JavaScript preservados.

### Verificações direcionadas e evidências

Antes da implementação, o cenário de 440×956 registrou 110/125px e o desktop usava a arte anterior com alturas de 110/130px. Após a alteração, os cenários correspondentes passaram com 180/180px e com as duas variantes desktop de 77/91px.

Os cinco slides mantêm exatamente a copy anterior. O clique real no botão de localização abriu o modal; Escape o fechou. Nenhum erro de JavaScript ou recurso local quebrado observado. O roteiro normalizou a representação computada de `background-size` como `100% auto`, conforme retornada pelo navegador, e a execução final passou.

**Evidências locais:** `/tmp/casamento-plan2-final/`, contendo capturas `event-<largura>x<altura>.png`, `closing-<largura>x<altura>.png`, referências `before-closing-*.png`, `closing-desktop.png`, medidas em `results.json`, hashes e metadados dos novos assets. [Inventário e prompts](2-assets.md).

**Consolidação:** o plano 2 foi reorganizado como referência única do comportamento final e do histórico resumido. README, PRD, design e inventário foram alinhados às 14 peças, crescimento do evento e exceção desktop. A lista mantém a tarefa 1 concluída, a tarefa 2 ligada ao plano consolidado e a tarefa 3 de confirmação de convidados pendente.

**Fechamento documental:** tarefa 2 marcada como concluída após implementação, validação e consolidação. Links locais dos documentos conferidos, JavaScript comparado com a versão anterior e idêntico, sintaxe válida e `git diff --check` sem erros. Revisão estática independente confirmou a coerência de CSS, capturas e documentação, sem problemas concretos no escopo; não executou testes adicionais.

**Limites:** revisão final apenas em Chrome emulado; Firefox, Safari/iOS, aparelhos físicos e leitor de tela real não foram testados novamente. Os resultados anteriores permanecem históricos, sem ampliação indevida de cobertura. Entrega em `src/` para revisão visual, com `dist/` preservado, sem commit, push ou publicação.

## Liberação da v2 — promoção para dist

Após concluir a v2, o usuário autorizou sua publicação. O HTML e os 14 WebP aprovados foram copiados integralmente de `src/` para `dist/`. Comparação byte a byte confirmou **15 arquivos idênticos** nas duas pastas. Originais, dependências e workflow de publicação permanecem preservados.

A conferência de publicação executou os testes direcionados contra **`/dist/` por HTTP local**, em Chrome 153.0.8010.52 emulado: 375×667, 440×668, 440×800, 440×956 e 1440×900. Os cinco cenários passaram, com conteúdo preservado, florais nas medidas esperadas, encerramento mobile idêntico às referências e sem rolagem nos slides verificados em retrato. O botão de localização abriu o modal; nenhum erro de JavaScript ou recurso local quebrado foi observado. Não houve repetição da bateria extensa ou das 112 combinações.

A regra existente `dist/*` no `.gitignore` tinha exceção apenas para o HTML. Foi acrescentada a exceção de `dist/assets/` para versionar os 14 florais e disponibilizá-los no checkout do workflow. O workflow e as dependências não foram alterados.

Evidências locais da promoção: `/tmp/casamento-v2-publish/`, incluindo capturas, roteiro e `results.json`. Documentação atualizada para a v2 aprovada, com tarefa 2 concluída e tarefa 3 pendente.

**Fluxo autorizado:** commit e envio à branch principal `main`, acionando o workflow existente `Deploy HTML para GitHub Pages`, que publica `dist/` na branch `gh-pages`. Destino configurado: [convite no GitHub Pages](https://tiagocarmo.github.io/casamento/). A checagem de disponibilidade remota é feita após a execução do workflow, separadamente da validação local registrada acima.
