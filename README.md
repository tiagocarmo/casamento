# Tatiana & Tiago

Convite digital de casamento para **20 de fevereiro de 2027, às 16h**, no **Monarca Casarão**, em Belo Horizonte – MG.

A primeira etapa implementa o convite completo **sem imagens**, em um único HTML com CSS e JavaScript internos. A identidade usa creme e terracota, Cormorant Garamond, Parisienne e ícones SVG inline.

## Abrir localmente

Abra [`src/index.html`](src/index.html) diretamente no navegador. Não é necessário instalar dependências ou executar build. As fontes do Google são opcionais: sem conexão, o navegador usa fontes do sistema e preserva o layout e as interações.

Para servir por HTTP, na raiz do repositório:

```bash
python3 -m http.server 8000 --bind 127.0.0.1
```

Acesse [o convite local](http://127.0.0.1:8000/src/). Para abrir uma seção específica, acrescente `?slide=1` até `?slide=5` à URL.

## Como funciona

- **Retrato, abaixo de 768px:** carrossel de cinco slides; botões, indicadores, swipe horizontal, setas e PageUp/PageDown. Conteúdo longo tem rolagem interna.
- **Paisagem ou largura a partir de 768px:** cinco seções em uma página vertical, centralizada em até 800px.
- Girar ou redimensionar a tela preserva a seção em leitura.
- Localização e presentes abrem modais com fechamento por botão, Escape ou fundo; o foco retorna ao acionador.
- Sem JavaScript, os textos continuam disponíveis em fluxo vertical; navegação interativa e modais exigem JavaScript.

## Estrutura

```text
src/index.html          Convite em desenvolvimento, sem imagens
plans/1-plan.md          Plano aprovado da tarefa 1
plans/1-validation.md    Resultados e limites da validação
TASKS.md                Tarefas numeradas e links para seus planos
PRD.md                  Requisitos da etapa atual e evoluções futuras
DESIGN.md               Identidade e componentes implementados
slides/                 Mockups para referência futura
slides-bg/              Imagens reservadas para a tarefa 2
dist/index.html         Cópia aprovada do convite, pronta para publicação
.github/workflows/      Workflow existente de publicação
```

Consulte as [tarefas](TASKS.md), o [plano 1](plans/1-plan.md), a [validação](plans/1-validation.md), o [PRD](PRD.md) e o [design](DESIGN.md).

## Limites desta etapa

- O botão **Confirmar presença** é um placeholder sem ação. Não existe confirmação, cadastro ou registro de convidados.
- O link de presentes `https://noivos.casar.com` é **provisório** e precisa ser substituído antes da publicação.
- Não há fotos, florais ou arquivos de imagem carregados pelo convite.
- Não há backend, persistência, cookies, analytics ou coleta de dados de convidados. Google Fonts faz requisições externas de fontes; mapa e presentes abrem por ação do usuário.
- O convite usa `noindex`; isso não constitui controle de acesso.

## Validação

A matriz contempla smartphones pequenos e grandes, retrato e paisagem, tablets e desktop, além de teclado, toque emulado, modais, rotação, zoom, fontes indisponíveis e redução de movimento. Os resultados e a cobertura real de navegadores estão no [registro de validação](plans/1-validation.md).

Não foi adicionada infraestrutura ou dependência de testes ao projeto.

## Publicação

Após a aprovação da tarefa 1, o convite de `src/index.html` foi copiado para `dist/index.html`, substituindo a página “Em construção”. Os dois arquivos são idênticos. É possível conferir a versão de distribuição em [dist/index.html](dist/index.html).

O workflow existente continua publicando `dist/` em pushes para `main` ou execução manual. `npm run deploy` também publica essa pasta; não é um comando de preview. A promoção para `dist/` não executou deploy remoto nem alterou o workflow.

Nas próximas alterações, manter `src/` como fonte e promover a versão aprovada para `dist/` antes da publicação.
