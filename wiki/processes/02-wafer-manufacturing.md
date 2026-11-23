---
title: "晶圓長晶與切片"
english_title: "Wafer Manufacturing: Ingot Pulling, Slicing and Polishing"
category: "processes"
tags: ["單晶矽", "晶棒", "柴式長晶", "晶圓切片", "CMP拋光"]
sources:
  - "SRC-001"
  - "SRC-002"
last_updated: "2026-11-23"
prerequisites:
  - "../processes/01-silicon-refining.md"
related_pages:
  - "../processes/03-thin-film-deposition.md"
  - "../glossary/terms.md"
---

# 晶圓長晶與切片 (Wafer Manufacturing)

> [!NOTE]
> **白話摘要與直覺比喻**  
> **一句話定義**：晶圓製造是將雜亂無序的多晶矽融化，拉引生長成原子排列整齊的巨大圓柱形單晶矽棒（Ingot），再切成薄如紙張、表面平整如鏡的圓形矽片（Wafer）之製程。  
> **生活化比喻**：想像製作一條極長且內部紋理完全一致的高級壽司捲。長晶就像是把融化的糖漿依據一顆微小的晶種旋轉慢慢拉出均勻圓柱；切片就像用精密極細的雷射鋸，把壽司捲切成厚度不到 1 毫米的極薄圓片；最後拋光到像鏡子一樣，甚至連一顆細菌凹凸都摸不出來。

---

## 核心原理與科學機制

依據 ASML (SRC-001) 與 imec (SRC-002) 的說明，晶圓是製造數百顆微晶片的主要基板（Primary Substrate）：

### 1. 柴可拉斯基法長晶（Czochralski Method / 柴式長晶）

> [!NOTE]
> **待後續權威資料驗證 (NEEDS_REVIEW)**  
> 來源 SRC-001 (ASML) 與 SRC-002 (imec) 記載將純矽熔化並鑄造為大型圓柱晶棒（Ingot）後切片為晶圓（Wafer）；關於「柴可拉斯基法（Czochralski Method）」之專利命名、晶種拉拔操作條件與 775 微米等具體規格，待後續批次引入長晶專業文獻補強精確驗證。

提純後的電子級多晶矽具有許多晶界（Grain Boundaries），電子的移動會受到阻礙。為了製造晶片，必須轉化為單一晶格方向的**單晶矽（Single-Crystal Silicon）**：
- **熔融高溫**：將高純度多晶矽置於石英坩堝內，加熱至高於矽熔點的 $1,420^\circ\text{C}$ 使其完全熔化。
- **晶種誘導（Seed Crystal）**：將一根已知精確晶向的微小晶種浸入熔矽表面。
- **緩慢旋轉拉起**：晶種與坩堝以相反方向緩緩旋轉，並以每小時數毫米的極慢速度向上拉拔。液態矽沿著晶種的原子排列迅速凝固，生長成直徑 300 毫米（12 吋）、重達數百公斤的巨大圓柱形**矽晶棒（Silicon Ingot）**。

### 2. 滾圓與切片（Ingot Grinding & Wire Slicing）
- **外徑研磨**：生長出來的晶棒直徑稍有不均，先將其外圓打磨修整成標準 300 mm 圓柱體，並磨出定位平邊（Flat）或凹口（Notch）。
- **金屬線鋸切割（Wire Sawing）**：使用高速運轉的高張力超細鋼線或鑽石線鋸，搭配冷卻切削液，將矽晶棒精準鋸切成厚度約 775 微米（$\mu\text{m}$，約 0.775 毫米）的圓形薄片。

### 3. 邊緣研磨、研磨與化學機械拋光（CMP）
- **倒角（Chamfering）**：將晶圓邊緣磨圓，防止後續搬運時破裂產生碎屑。
- **化學機械平坦化拋光（Chemical Mechanical Polishing, CMP）**：使用奈米級二氧化矽研磨液與專用拋光墊，在化學腐蝕與機械打磨的雙重作用下，將晶圓表面拋光成近乎完美的原子級鏡面。

---

## 關鍵技術參數與工作條件

- **晶棒直徑規格**：主流為 300 mm（12 吋），早期亦有 200 mm（8 吋）及 150 mm（6 吋）。
- **厚度標準**：300 mm 晶圓標準厚度約為 $775 \pm 20 \ \mu\text{m}$。
- **表面粗糙度（Surface Roughness）**：拋光後表面起伏小於 0.1 奈米（相當於數個原子直徑）。

---

## 上下游製程關聯

- **前置階段**：接收 [01-矽原料提取與提純](01-silicon-refining.md) 產出之電子級高純度多晶矽。
- **後續製程**：光滑潔淨的單晶矽晶圓，將送入無塵室晶圓代工廠（Fab），正式進入 [03-薄膜沉積技術](03-thin-film-deposition.md) 與微影循環。

---

## 常見迷思與 FAQ

> **Q1：為什麼晶圓一定是圓形的？**  
> **A1**：因為柴氏長晶爐是透過「旋轉向上拉拔」的方式長出晶棒，液體表面張力與離心力自然形成了旋轉對稱的圓柱體。雖然圓形在後續切成方形晶片時邊緣會浪費一些角落（邊緣晶粒 Die），但圓形受熱均勻且應力最對稱，是目前長晶的最穩定物理型態。

---

## 參考資料來源（Citations）

- `SRC-001`: ASML, *The Basics of Microchips* (2024). [URL](https://www.asml.com/en/technology/all-about-microchips/microchip-basics)
- `SRC-002`: imec, *How Are Microchips Made?* (2024). [URL](https://www.imec-int.com/en/what-we-offer/semiconductor-education-and-workforce-development/microchips/how-are-microchips-made)
