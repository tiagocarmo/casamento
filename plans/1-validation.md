# Validação — Plano 1

**Data:** 22 de outubro de 2026.

**Entrega:** [estrutura sem imagens](../src/index.html), conforme [plano aprovado](1-plan.md).

## Ambiente e método

Chrome **153.0.8010.52**, em Linux, executado em modo headless com Playwright já disponível no ambiente. Não foi instalada dependência nem infraestrutura de testes no repositório.

A validação usou HTTP local e abertura direta por `file://`, viewports em pixels CSS, eventos de teclado, toque emulado via Chrome DevTools Protocol, medições de geometria e capturas para inspeção visual. Os roteiros e capturas auxiliares ficaram fora do projeto.

## Matriz de responsividade

As cinco seções foram percorridas em cada dimensão. As medições confirmaram ausência de overflow horizontal, limite de largura de 800px no fluxo vertical e alcance do final de cada slide quando necessária a rolagem interna.

| Viewport | Modo esperado e observado | Resultado |
|---|---|---|
| 320×568 | Carrossel; cabeçalho em duas linhas; conteúdo longo rolável | Passou |
| 360×640 | Carrossel | Passou |
| 390×844 | Carrossel; informações do evento cabem na área disponível | Passou |
| 430×932 | Carrossel | Passou |
| 568×320 | Página vertical | Passou |
| 667×375 | Página vertical | Passou |
| 844×390 | Página vertical | Passou |
| 768×1024 | Página vertical | Passou |
| 1024×768 | Página vertical | Passou |
| 1280×720 | Página vertical, até 800px | Passou |
| 1440×900 | Página vertical, até 800px | Passou |
| 1920×1080 | Página vertical, até 800px | Passou |

A revisão visual cobriu as cinco seções nas famílias de smartphone pequeno/grande, paisagem, tablet e desktop. Conteúdo que excede uma tela baixa permanece disponível por rolagem; não se exige que uma seção inteira caiba em paisagem.

## Interações e acessibilidade

- Botões, cinco indicadores, ciclo nos dois sentidos e teclas ArrowRight/ArrowLeft/PageDown/PageUp: passaram.
- Swipe horizontal emulado nos dois sentidos e gesto vertical sem trocar de slide: passaram.
- Deep links 1–5 em celular e desktop; inválidos `0`, `6`, `99`, `text` e `4.0`: passaram.
- Troca entre carrossel e página vertical, preservando a seção lida: passou. Revisão independente adicional percorreu 20 ciclos entre as cinco seções e quatro formatos.
- Rotação com modal aberto, fechamento e restauração da seção: passou.
- Modais de mapa e presentes: fechamento por botão, Escape e backdrop; Tab/Shift+Tab contidos; foco devolvido ao acionador; carrossel suspenso: passaram.
- Modal em 568×320 permanece dentro da viewport e permite alcançar seu botão de fechamento: passou.
- Destinos de mapa/presentes, `target="_blank"` e `rel="noopener noreferrer"`: conferidos. Não foram validados disponibilidade, conteúdo ou lista definitiva dos sites externos.
- Placeholder de confirmação preserva URL, slide e posição de rolagem, sem abrir modal: passou.
- PageDown conserva a rolagem nativa na página vertical: passou.
- `prefers-reduced-motion` elimina a transição do carrossel: passou.
- Reflow equivalente a zoom de 200% em desktop (720×450) e no menor celular (160×284): passou, incluindo quebra de textos e navegação. Não constitui teste de pinch zoom em aparelho físico.
- Sem fontes externas, carrossel e modal continuam funcionais; sem JavaScript e fontes, os cinco blocos permanecem em fluxo vertical: passou.
- Resposta tardia das fontes não desfaz uma rolagem já iniciada pelo leitor: passou.
- IDs únicos, referências ARIA e SVG resolvidas, sintaxe do JavaScript e `git diff --check`: passaram.
- Indicadores inativos: contraste corrigido para aproximadamente 3,10:1. Cores principais atendem aos contrastes de texto previstos; teclado e foco foram conferidos. Não houve auditoria com leitor de tela real.

Não foram detectados erros de JavaScript, recursos locais quebrados, requisições de imagem, formulários, cookies ou entradas em localStorage/sessionStorage. As requisições iniciais externas são de fontes do Google.

## Correções durante a validação

1. Aumentado o contraste dos indicadores inativos.
2. Ajustadas quebras e caligrafia em largura extremamente estreita, incluindo o cenário equivalente a zoom de 200%.
3. Evitado reposicionamento tardio causado pelo carregamento de fontes após o convidado começar a rolar.

Uma falha inicial do roteiro de rotação foi identificada como corrida do próprio teste: a rolagem era disparada antes de o novo modo estar aplicado. O roteiro passou a aguardar a troca de modo, e os ciclos posteriores passaram.

## Cobertura e pendências

- **Testado:** Chrome desktop em modo headless, com emulação de viewports e toque.
- **Não testado:** Firefox, Safari/iOS, aparelhos Android/iPhone reais e tecnologias assistivas reais. A presença de um navegador instalado não foi tratada como evidência de teste.
- **Fora desta etapa:** imagens, RSVP, lista definitiva dos presentes e publicação.
- Na validação inicial, `dist/` e workflow foram preservados; nenhum deploy foi executado.

## Complemento da tarefa 1 — versão aprovada em dist

Após a aprovação da implementação, o usuário autorizou promover a versão para `dist/`. `dist/index.html` agora contém uma cópia byte a byte de `src/index.html`, substituindo “Em construção”; igualdade conferida com `cmp` e SHA-256.

Uma verificação adicional em Chrome confirmou cinco seções, layout correto, modais com Escape/retorno de foco, placeholder sem alteração de URL e ausência de erros de JavaScript a partir da pasta de distribuição:

- 390×844, abertura direta por `file://`: passou.
- 568×320, HTTP local em `/dist/`: passou.
- 1440×900, HTTP local em `/dist/`: passou.

README, PRD, design e plano atualizados para registrar a promoção. Workflow e dependências preservados. Nenhum deploy remoto foi executado.
