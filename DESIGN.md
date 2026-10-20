# Design System — Casamento Tatiana & Tiago
**Data do Evento:** 20 de Fevereiro de 2027  
**Versão:** 1.0.0  

---

## 1. Fundações (Design Tokens)

Valores básicos e imutáveis extraídos diretamente da identidade visual dos convites.

### 1.1 Paleta de Cores

*   **Cor Primária (`--color-primary`): Terracotta / Vermelho Queimado (`#9E3C29` / `#A34833`)**
    *   *Quando usar:* Em elementos de alta ênfase, botões principais de ação (CTA), ícones principais, títulos em destaque, divisores e linhas ornamentais.
*   **Cor Secundária (`--color-secondary`): Marrom Escuro / Sépia (`#4A3530`)**
    *   *Quando usar:* Textos corridos de corpo (body text), parágrafos informativos e legendas que exigem legibilidade e contraste adequado sobre o fundo claro.
*   **Cor Terciária / Accent (`--color-tertiary`): Rosa Magenta, Coral e Verde Oliva (`#D12365`, `#E06D41`, `#5A6B47` aproximados)**
    *   *Quando usar:* Exclusivamente nas ilustrações florais e detalhes gráficos de apoio (assets botânicos). Não utilizar em textos longos para garantir acessibilidade.
*   **Cor de Fundo - Slide Normal (`--bg-default`): Creme Suave / Marfim (`#FDF9F2`)**
    *   *Quando usar:* Em todos os slides padrão com fundo sólido texturizado ou liso.
*   **Cor de Fundo - Foto / Overlay (`--bg-photo-overlay`): Camada translúcida escura / quente**
    *   *Quando usar:* Em slides de fundo com foto (ex: Slide 5), combinando com textos em branco para contraste.

### 1.2 Tipografia

*   **Família Primária (Display / Cursive):** Fonte manuscrita/script elegante (ex: *Parisienne*, *Great Vibes* ou similar).
    *   *Uso:* Nomes dos noivos ("Tatiana & Tiago") e frases de destaque afetivas ("Será um prazer ter você conosco!").
*   **Família Secundária (Heading / Body):** Fonte Serifada Clássica (ex: *Cormorant Garamond*, *Playfair Display*).
    *   *Uso:* Títulos em caixa alta (ex: "NOSSO GRANDE DIA", "LOCAL", "CONFIRME SUA PRESENÇA") e textos descritivos.
*   **Escala Modular:**
    *   **H1 (Display Cursive):** 36px - 42px (Nomes dos noivos)
    *   **H2 (Heading Caps):** 18px - 22px (Títulos de seção)
    *   **Body (Texto Corrente):** 14px - 16px (Informações, datas, endereços)
    *   **Caption:** 12px (Detalhes menores)

### 1.3 Ativos Visuais (Assets & Ilustrações Florais)

*   **Regra de Imagens de Topo:** Exatamente **1 (uma) unidade** de arranjo floral posicionado no canto superior (geralmente esquerdo/direito ou ocupando a borda superior) por seção/slide padrão para emoldurar a página.
*   **Regra de Imagens de Rodapé:** Exatamente **1 (uma) unidade** de arranjo floral denso posicionado na base inferior (rodapé) de cada slide padrão.
*   **Ícones:** Ícones minimalistas em linha ou preenchidos na cor primária (`--color-primary`), como calendário, localizador (pin), alianças e presente.

---

## 2. Biblioteca de Componentes

### 2.1 Botões (Buttons)
*   **Primary Button (`.btn-primary`):**
    *   *Background:* Cor Primária (`#9E3C29`)
    *   *Texto/Ícone:* Branco (`#FFFFFF`), centralizados com ícone à esquerda (ex: "ABRIR NO MAPA", "CONFIRMAR PRESENÇA").
    *   *Formato:* Cantos arredondados (border-radius suave), largura fluida ou fixa centralizada.
    *   *Estados:*
        *   *Default:* `#9E3C29` com texto branco.
        *   *Hover:* Tom ligeiramente mais escuro do terracotta.
        *   *Active/Pressed:* Redução de opacidade ou escala leve.

### 2.2 Elementos Estruturais e Divisores
*   **Divisor Ornamental:** Linha horizontal fina na cor primária contendo um ícone de coração centralizado (`♥`), utilizada para separar blocos de conteúdo textual.

---

## 3. Padrões de Contexto de Slides

### 3.1 Slides Normais (Fundo Sólido)
*   **Tokens Aplicados:**
    *   `background-color`: `#FDF9F2` (Creme Suave)
    *   `text-color`: `#4A3530` (Marrom Sépia) para corpo e `#9E3C29` (Terracotta) para títulos.
    *   `assets`: Obrigatório o uso do arranjo floral no topo e no rodapé.

### 3.2 Slides com Fundo de Foto (Photo Background)
*   **Tokens Aplicados:**
    *   `background-image`: Foto real do casal (ex: pôr do sol na praia).
    *   `overlay`: Película escura/quente com opacidade controlada para garantir legibilidade.
    *   `text-color on photo`: Branco (`#FFFFFF`) para nomes e datas, e Terracotta (`#9E3C29`) para títulos em destaque, mantendo o arranjo floral apenas no rodapé para emoldurar a foto sem poluir o centro.

---

## 4. Acessibilidade e Paridade de Código

*   **Contraste:** O uso de textos em marrom escuro ou branco sobre fundos creme e fotos com overlay atende aos critérios mínimos de leitura.
*   **Responsividade:** O layout em formato de coluna única vertical (inspirado em convites verticais) deve adaptar-se de forma fluida para dispositivos mobile e desktop (centralizado em container tipo card vertical).