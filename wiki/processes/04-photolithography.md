---
title: "微影技術"
english_title: "Photolithography: Drawing Nanoscale Circuit Patterns"
category: "processes"
tags: ["微影", "光阻", "光罩", "ASML", "DUV", "EUV"]
sources:
  - "SRC-001"
  - "SRC-002"
last_updated: "2026-11-23"
prerequisites:
  - "../processes/03-thin-film-deposition.md"
related_pages:
  - "../processes/05-etching.md"
  - "../concepts/nanoscale-and-moore.md"
  - "../glossary/terms.md"
---

# 微影技術 (Photolithography)

> [!NOTE]
> **白話摘要與直覺比喻**  
> **一句話定義**：微影技術（Photolithography）是利用光化學反應，將設計好的精密電路圖案，透過紫外光曝光精準投影並印製在晶圓感光膠層上的圖形轉印核心製程。  
> **生活化比喻**：想像傳統相館沖洗黑白底片相片，或小時候玩精密投影片：光罩就像是一張包含複雜電路圖案的「底片」，晶圓上塗抹的光阻就像「感光相紙」。微影機台就像一架價值數億美元的高級投影放大機（實際上是等比例縮小投影），當強烈的光芒穿透底片照射到晶圓上，電路圖案就瞬間烙印在感光塗層上了。

---

## 核心原理與科學機制

ASML (SRC-001) 與 imec (SRC-002) 共同確認，微影是半導體製造中最關鍵、技術難度最高、也最昂貴的核心步驟。

### 1. 微影五部曲操作步驟
imec (SRC-002) 將微影流程歸納為標準操作鏈：
1. **光阻塗布（Photoresist Coating）**：將液態的感光性化學樹脂（光阻）滴在高速旋轉的晶圓中央，利用離心力在晶圓表面均勻鋪開一層數十奈米厚的平整薄膜。
2. **軟烤（Soft Bake）**：短暫加熱晶圓以蒸發光阻中的多餘溶劑，使其固化穩定。
3. **對準與曝光（Alignment and Exposure）**：
   - 將包含電路藍圖的光罩（Photomask / Reticle）置於光源與晶圓之間。
   - 高精密光學透鏡系統將光罩上的圖案縮小（通常縮小 4 倍）並精準對準晶圓下方的既有電路。
   - 紫外光（DUV 或 EUV）穿透光罩透光區域，照到晶圓表面的光阻分子。
4. **曝光後加熱與顯影（Post-Exposure Bake & Development）**：
   - 受到光照的光阻化學鍵發生斷裂（正光阻 Positive Resist），變得容易被顯影化學液體溶解。
   - 淋上顯影液（Developer）沖洗，受光照射的區域被溶解除去，未受光的區域則保留下來，形成實體的電路防護遮罩。
5. **硬烤（Hard Bake）**：加溫烘烤加固保留下來的光阻圖案，以抵禦隨後的強酸或電漿蝕刻。

### 2. 光源演進與 ASML 的產業地位
ASML (SRC-001) 指出，晶片線寬越細，所需的曝光光線波長就必須越短（瑞利準則 Rayleigh Criterion $CD = k_1 \frac{\lambda}{NA}$）：
- **深紫外光（Deep Ultraviolet, DUV）**：採用氟化氬（ArF）準分子雷射，波長為 $193 \text{ nm}$，透過浸潤式微影（Immersion Lithography）可推進至 10 奈米節點。
- **極紫外光（Extreme Ultraviolet, EUV）**：ASML 獨家突破開發，波長驟降至 **$13.5 \text{ nm}$**。EUV 光極易被空氣甚至玻璃透鏡吸收，因此必須在高度真空環境下，使用原子級平整的多層鉬矽反射鏡來引導光束，成功實現了 7 奈米、5 奈米、3 奈米乃至更先進晶片的量產。

---

## 關鍵技術參數與工作條件

- **曝光精度（Overlay Accuracy）**：晶圓每層圖案對準誤差必須控制在 **1 奈米至 2 奈米** 以內。
- **機台複雜度**：一台頂級 EUV 微影機重達 180 公噸，包含十萬個零部件，需要數十輛貨車與數架波音 747 貨機運送。

---

## 上下游製程關聯

- **前置階段**：剛剛完成 [03-薄膜沉積技術](03-thin-film-deposition.md) 的晶圓。
- **後續製程**：顯影完成後，晶圓表面已有保護光阻圖案，隨即送入 [05-蝕刻製程](05-etching.md)，將沒有被光阻保護的底層薄膜挖除。

---

## 常見迷思與 FAQ

> **Q1：光罩是一對一貼在晶圓上面曬太陽嗎？**  
> **A1**：不是。光罩懸掛在晶圓上方，由高精密度物鏡組將光罩圖案縮小 4 倍投影到晶圓上；而且微影機採用步進掃描式（Stepper / Scanner），晶圓台高速移動，一格一格地在晶圓上重複曝光出數百個相同的晶片圖案。

---

## 參考資料來源（Citations）

- `SRC-001`: ASML, *The Basics of Microchips* (2024). [URL](https://www.asml.com/en/technology/all-about-microchips/microchip-basics)
- `SRC-002`: imec, *How Are Microchips Made?* (2024). [URL](https://www.imec-int.com/en/what-we-offer/semiconductor-education-and-workforce-development/microchips/how-are-microchips-made)
