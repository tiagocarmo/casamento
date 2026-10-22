# Assets — Plano 2

**Publicação da v2:** os 14 arquivos de `src/assets/florals/` são espelhados em `dist/assets/florals/`, sem transformação adicional; o inventário abaixo descreve as mesmas peças em ambas as pastas.

## Origens e tratamento

Os originais de `/home/tiago-carmo/PESSOAL/casamento/slides-bg/1.jpeg` a `5.jpeg` foram usados como alvos de edição. Permaneceram intactos; os mesmos arquivos estão em `slides-bg/` neste repositório.

A remoção de fundo usou a ferramenta **imagegen, modo nativo**, com `transparent_background=true`, em cinco edições independentes. Os PNGs intermediários foram mantidos no diretório de imagens geradas do Codex; somente as peças finais consumidas pelo convite estão em `src/assets/florals/`. Não foi usado CLI/API alternativo.

Na exportação, pixels de alpha inferior a 8/255 foram zerados para retirar ruído quase invisível do fundo. As metades superior/inferior dos fundos 1, 2, 3 e 5 foram recortadas pela caixa de alpha. No fundo 4, os quatro grupos conectados foram isolados antes do recorte, preservando as folhas dos dois arranjos inferiores que ocupam coordenadas próximas sem cortar suas pontas.

As 12 peças iniciais são limitadas a 640×640, ou 900×850 nas faixas do fechamento, sem ampliar a resolução original. A revisão final acrescenta duas variantes exclusivas do desktop, recompostas com imagegen a partir do estilo das faixas anteriores. Exportação WebP com qualidade 88 e canal alpha preservado. Os 12 arquivos iniciais permanecem idênticos, conferidos por SHA-256.

## Peças finais

| Arquivo | Original | Recorte no PNG gerado (x0,y0,x1,y1) | Dimensões | Bytes |
|---|---|---|---|---|
| [1-top-left.webp](../src/assets/florals/1-top-left.webp) | 1.jpeg | (0, 0, 771, 628) | 640×521 | 117276 |
| [1-bottom-right.webp](../src/assets/florals/1-bottom-right.webp) | 1.jpeg | (115, 955, 937, 1678) | 640×563 | 146598 |
| [2-top-right.webp](../src/assets/florals/2-top-right.webp) | 2.jpeg | (445, 0, 937, 592) | 492×592 | 58782 |
| [2-bottom-left.webp](../src/assets/florals/2-bottom-left.webp) | 2.jpeg | (0, 919, 800, 1678) | 640×607 | 140882 |
| [3-top-right.webp](../src/assets/florals/3-top-right.webp) | 3.jpeg | (574, 0, 937, 555) | 363×555 | 52638 |
| [3-bottom-left.webp](../src/assets/florals/3-bottom-left.webp) | 3.jpeg | (0, 1190, 651, 1679) | 640×481 | 99994 |
| [4-top-left.webp](../src/assets/florals/4-top-left.webp) | 4.jpeg | (0, 0, 374, 376) | 374×376 | 35982 |
| [4-top-right.webp](../src/assets/florals/4-top-right.webp) | 4.jpeg | (460, 0, 937, 507) | 477×507 | 86974 |
| [4-bottom-left.webp](../src/assets/florals/4-bottom-left.webp) | 4.jpeg | (0, 1139, 437, 1678) | 437×539 | 67808 |
| [4-bottom-right.webp](../src/assets/florals/4-bottom-right.webp) | 4.jpeg | (382, 1199, 937, 1678) | 555×479 | 97672 |
| [5-top.webp](../src/assets/florals/5-top.webp) | 5.jpeg | (0, 0, 937, 501) | 900×481 | 143126 |
| [5-bottom.webp](../src/assets/florals/5-bottom.webp) | 5.jpeg | (0, 946, 937, 1678) | 900×703 | 174106 |
| [5-top-desktop.webp](../src/assets/florals/5-top-desktop.webp) | 5-top.webp, referência de estilo | (0, 49, 1278, 332), antes da redução/recorte final | 800×77 | 47874 |
| [5-bottom-desktop.webp](../src/assets/florals/5-bottom-desktop.webp) | 5-bottom.webp, referência de estilo | (0, 386, 2061, 749), antes da redução/recorte final | 800×91 | 58498 |

**Total final: 14 peças, 1.328.210 bytes**, aproximadamente **1,33 MB**; meta de até 1,5 MB atendida. As 12 peças iniciais somam 1.221.838 bytes e as duas novas somam 106.372 bytes.

Todos os WebP são RGBA, possuem pixels transparentes e opacos e foram conferidos sobre creme. O exemplo JPEG com quadriculado não integra os assets.

## Faixas exclusivas do desktop

Duas novas gerações em **imagegen nativo**, `transparent_background=true`, classificadas como `style-transfer`. Os WebP anteriores foram usados como referências de estilo e cor, sem alteração dos arquivos. Os florais foram recompostos como fileiras horizontais de flores menores, com proporções naturais.

Os PNGs nativos estão em `/home/tiago-carmo/.codex/generated_images/01a164eb-8de6-78b2-9e88-6ef34a167515/`:

- Topo: `exec-cb264a8c-6f34-4341-889e-12b2adeaccb2.png`, 1278×1230.
- Base: `exec-b2c9b0db-8c1b-40ba-80c8-9a69368ea68e.png`, 2061×763.

Após zerar alpha inferior a 8/255, recortar pela caixa de alpha e reduzir **uniformemente** para 800px de largura:

| Peça | Tamanho após redução uniforme | Recorte final nessa imagem |
|---|---|---|
| Topo desktop | 800×177 | (0, 46, 800, 123) → 800×77 |
| Base desktop | 800×141 | (0, 50, 800, 141) → 800×91 |

O recorte vertical é deliberado, sem achatamento ou alongamento das flores. Ambas as peças têm alpha de 0 a 255 e arte em todas as 800 colunas, sem margens laterais transparentes inteiras. O CSS aplica as máscaras suaves de transição para creme. Consumo somente a partir de 768px, em 100% da largura útil da seção.

## Prompts usados

Os cinco pedidos classificaram a edição como `background-extraction`, restringiram a alteração à remoção do papel, solicitaram alpha real e preservação de composição, proporções, cores, flores e folhagem, sem texto, novos elementos ou quadriculado.

### 1.jpeg

Use case: background-extraction. Edit target: the attached original floral wedding background 1.jpeg. Remove ONLY the entire cream/beige paper background, including all paper visible between leaves and petals, and make those areas genuinely transparent (alpha=0). Preserve the existing illustrated flowers and foliage as closely as possible: the large upper-left corner bouquet and the lower-right corner bouquet, their position, composition, proportions, saturated burgundy/magenta, coral/orange flowers and olive leaves. Keep the two bouquets separated by a large completely transparent central area. Portrait composition. Clean antialiased natural edges, no cream halo, no shadows outside the original artwork. No new flowers, no text, no frame, no checkerboard, no white/beige rectangle. Output true transparency suitable for decorative web background layers.

### 2.jpeg

Use case: background-extraction. Edit target: attached original floral wedding background 2.jpeg. Remove ONLY the entire cream/beige paper background, including gaps between stems and petals, and output genuine alpha transparency there. Preserve the original watercolor/botanical illustration as closely as possible: small bouquet cropped into the UPPER RIGHT corner, large bouquet in the LOWER LEFT corner, separated by a large empty fully transparent center. Keep their composition, relative positions, natural proportions, magenta/burgundy and coral/orange blossoms, olive leaves and fine stems. Crisp natural antialiased cutout edges, no beige or white halo. No new objects, no text, no white/beige canvas, no checkerboard. Portrait composition, web decoration assets.

### 3.jpeg

Use case: background-extraction. Edit target: attached original floral wedding background 3.jpeg. Remove only ALL cream paper background, also between stems and petals, producing actual alpha transparency. Preserve the original illustrated flowers/foliage, composition, natural shapes, colors and relative positions: small orange/coral/olive bouquet in the UPPER RIGHT corner and a wider coral/magenta/olive bouquet in the LOWER LEFT corner. Large fully transparent central gap. Keep botanical painting detail, no redesign, no additional flowers, no text or shadows, no beige/white halo and no checkerboard. Clean antialiased transparent edges. Portrait web-decoration asset.

### 4.jpeg

Use case: background-extraction. Edit target: attached floral wedding background 4.jpeg. Remove only the cream paper background everywhere, including all negative spaces within the bouquets, to create GENUINE TRANSPARENT ALPHA. Preserve all FOUR original separate corner arrangements, in the same places and proportions: upper-left smaller bouquet, upper-right larger bouquet with dangling berries, lower-left bouquet with berries, lower-right bouquet. The entire large central area must be transparent. Preserve the original botanical painting, saturated magenta/burgundy, coral/orange petals and olive foliage without redesign. Clean antialiased edges without beige fringe or painted checkerboard. No added flowers, text, shadows, white or beige fill. Portrait decorative cutouts for a web invitation.

### 5.jpeg

Use case: background-extraction. Edit target: attached floral wedding background 5.jpeg. Remove ONLY ALL white/cream paper from the background and all gaps within the foliage, leaving genuinely transparent alpha pixels. Preserve the existing lush UPPER floral garland and LOWER floral garland, their exact arrangement and position as closely as possible, original proportions and botanical painting detail, vibrant magenta/burgundy, coral and orange flowers and olive green leaves. The large center must be COMPLETELY TRANSPARENT. No couple photo, no people, no text, no new elements, no checkerboard, no white/beige rectangle, no surrounding shadow or pale halo. Clean antialiased natural cutout edges. Portrait transparent web decoration, two separated horizontal floral bands.

## Prompts das variantes desktop

### Topo desktop

Use case: style-transfer. Asset type: transparent TOP floral border for an elegant wedding invitation on desktop. Input image 1 is the original botanical artwork STYLE AND COLOR REFERENCE, not a canvas to preserve. Create a NEW very wide, very shallow continuous horizontal garland for a final 800 by 77 pixel strip (aspect ratio 10.39:1). Recompose the flowers as a row of MANY SMALL naturally proportioned blossoms across the ENTIRE width, not a few giant cropped flowers and not a compressed or stretched copy. Preserve the reference's detailed painted botanical look, saturated burgundy/magenta, coral, peach, orange blossoms, a few subtle lilac details, olive foliage and tiny berries. Attach the dense garland to the TOP edge, with the flowers filling the full width all the way to both left and right canvas edges; the lower edge is organic and tapers gently into GENUINELY TRANSPARENT alpha with fine leaves and natural petal edges. The narrow floral row itself should have roughly 12 to 16 blossom faces across its width, keeping round petals and natural shapes. All background and gaps are true alpha transparency. No beige/white/black paper, no colored rectangle, no checkerboard, no text, people, photo, frame, watermark or shadows. Output a panoramic thin floral band at the requested aspect ratio; if the output canvas must be taller, leave fully transparent space above/below the single thin band so it can be cropped without flattening flowers. The final strip will span an 800px website column at only 77px height.

### Base desktop

Use case: style-transfer. Asset type: transparent BOTTOM floral border for an elegant wedding invitation on desktop. Input image 1 is the original botanical artwork STYLE AND COLOR REFERENCE, not a canvas to preserve. Create a NEW very wide, very shallow continuous horizontal garland for a final 800 by 91 pixel strip (aspect ratio 8.79:1). Recompose the flowers as a row of MANY SMALL naturally proportioned blossoms across the ENTIRE width, not giant corner bouquets and not a squeezed or stretched copy. Preserve the reference's detailed painted botanical look, saturated burgundy/magenta, coral, peach, orange blossoms, a few subtle lilac details, olive foliage and tiny berries. Attach the dense garland to the BOTTOM edge, with floral artwork reaching the full width to both left and right edges; the upper edge is organic, airy and gently tapers into GENUINELY TRANSPARENT alpha with fine leaves and petal edges. Roughly 12 to 16 small round blossom faces along the width, natural proportions, subtle irregularity and no tall central bouquet. All background and gaps are true alpha transparency. No beige/white/black paper, no colored rectangle, no checkerboard, no text, people, photo, frame, watermark or shadows. Output a panoramic thin floral band at the requested aspect ratio; if the output canvas must be taller, leave fully transparent space above/below the single thin band so it can be cropped without flattening flowers. The final strip will span an 800px website column at only 91px height.

## Identidade dos originais

| Original | SHA-256 |
|---|---|
| 1.jpeg | `05c28b0c4d7c74e382b372ec4ca9d8a6e25ddca641258b05f38cc82202fa1258` |
| 2.jpeg | `3121ab00624e5fd1b24a3a946c9da452ad2096e6ddf25a0cf62efc9fe33c9ad2` |
| 3.jpeg | `853394aaef309cec9df534b5edbea14542eb9f5bf7bd168c383fb4767903b509` |
| 4.jpeg | `a53eb312ffb98d067677c26cb5fc409e800af88083bcf6782a2da620a3206d5a` |
| 5.jpeg | `e5c59fc39659ea1ac2cc2edf553f6050001f3f2849fbb5aba40a62073c36c39c` |
