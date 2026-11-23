---
title: "薄膜沉積技術"
english_title: "Thin Film Deposition: Building Microchip Layers"
category: "processes"
tags: ["薄膜沉積", "CVD", "PVD", "ALD", "PECVD", "ECD", "Lam Research"]
sources:
  - "SRC-001"
  - "SRC-002"
  - "SRC-003"
last_updated: "2026-11-23"
prerequisites:
  - "../processes/02-wafer-manufacturing.md"
related_pages:
  - "../processes/04-photolithography.md"
  - "../glossary/terms.md"
---

# 薄膜沉積技術 (Thin Film Deposition)

> [!NOTE]
> **白話摘要與直覺比喻**  
> **一句話定義**：薄膜沉積（Deposition）是將導電金屬、半導體或絕緣介電質等不同特性的材料，以原子或分子為單位，均勻鍍在晶圓表面形成奈米級超薄保護層或電氣層的工序。  
> **生活化比喻（Lam Research 交通比喻）**：薄膜沉積主要有兩大目的：
> 1. **金屬沉積（Metal Deposition）**：如同在城市中**鋪設允許車輛順暢通行的高速公路**，打造低電阻的導電路徑。
> 2. **介電質沉積（Dielectric Deposition）**：如同在道路旁**架設安全護欄與交通引導障礙物**，將不該通電的地方徹底絕緣，防止訊號漏電與短路。

---

## 核心原理與科學機制

依據 imec (SRC-002) 與全球沉積設備大廠 Lam Research (SRC-003) 的權威技術手冊，微晶片是由數千道製程重複堆疊而成。沉積的核心考量在於材料種類、電氣功能，以及晶圓表面是平坦的（Planar）還是具備深孔與溝槽的立體形貌（Topography）。

### 1. 常見沉積方法（Common Methods）

#### (1) 化學氣相沉積（Chemical Vapor Deposition, CVD）
- **機制**：在高溫反應腔中導入含目標元素的反應性前驅氣體（Precursor Gases）。高溫促使氣體分子分解或發生化學反應，在晶圓表面生成固態薄膜，廢氣副產物則被真空泵抽除。
- **特點**：可沉積導體、半導體與絕緣介電質（如二氧化矽 $\text{SiO}_2$）。階梯覆蓋能力佳，能均勻沉積在平面與立體結構上。

#### (2) 物理氣相沉積（Physical Vapor Deposition, PVD / 濺鍍 Sputtering）
- **機制**：在真空腔內利用高能離子轟擊金屬靶材，以物理撞擊將靶材原子擊出（Sputtering），原子飛越真空並附著在晶圓表面凝結成膜。部分原子可被離子化以施加電場引導方向。
- **特點與限制**：材料適應廣、成本低（無需特殊化學氣體）；但因為原子主要從上方灑落，在立體深孔中會產生**陰影效應（Shadowing Effects）**，導致深孔側壁與底部厚度不均或產生空隙（Voids）。因此 PVD 通常受限於超薄襯層（Liners）或無高低起伏的平面沉積。

#### (3) 電化學沉積（Electrochemical Deposition, ECD）
- **機制**：將晶圓浸入含有金屬陽離子的化學電鍍液中並通電，帶正電的金屬離子受吸引還原沉積在晶圓表面。
- **特點**：類似汽車保險桿鍍鉻的高科技微觀親戚。具備極強的深孔填平能力，能精準在晶片奈米級的極微細縫隙中填充高品質、無孔隙（Void-free）的導電金屬（如銅互連導線）。

---

### 2. CVD 衍生技術與原子層沉積（ALD）

Lam Research (SRC-003) 指出，隨著晶片結構微縮至立體奈米維度，傳統熱 CVD 面臨高溫破壞底層金屬的瓶頸，因而催生了先進衍生技術：

#### (1) 電漿增強化學氣相沉積（Plasma-Enhanced CVD, PECVD）
- 利用電漿（Plasma）中的高能電子來激發並分解前驅氣體，取代單純的熱能。
- **關鍵優勢**：能在**低溫環境**下沉積出高品質薄膜。這對後段製程至關重要，因為過高的溫度會使下層已做好的銅導線熔化或絕緣層劣化。

#### (2) 高密度電漿化學氣相沉積（High-Density Plasma CVD, HDP-CVD）
- 在同一個腔體內同時進行「化學沉積」與「物理氬離子濺射打磨」。
- 藉由濺射不斷削平深槽開口處的過早堆積，實現由下而上的無孔隙深溝填補。

#### (3) 原子層沉積（Atomic Layer Deposition, ALD）
*(本項已由 Lam Research SRC-003 官方文獻完整證實)*
- **自限性表面化學反應（Self-Limiting Reactions）**：
  1. **脈衝注入前驅物 A**：氣體分子進入腔體並與晶圓表面活性基團發生化學吸附（Adsorption）。一旦整個表面被單一層分子佔滿（飽和），反應自動停止（Self-limiting）。
  2. **吹洗（Purge）**：以惰性氣體將腔內多餘的前驅物 A 與未反應氣體徹底排空。
  3. **脈衝注入前驅物 B**：氣體 B 進入並與吸附在表面的前驅物 A 發生反應，生成目標化合物薄膜（如氧化鋁、氧化鉿等高介電質）。
  4. **吹洗（Purge）**：排空副產物與多餘氣體 B。
- **核心優勢**：
  - **原子級精準厚度**：重複上述四步循環，每次循環精確生長單一原子或分子層厚度（約 0.1 奈米）。
  - **優異的保形性（Conformality）**：ALD 具有優異保形性，可在適當製程條件下形成高度均勻薄膜，覆蓋複雜高深寬比溝槽或 3D 立體結構表面。

---

## 關鍵技術參數與工作條件

- **腔體環境**：高真空至超高真空（$10^{-3} \sim 10^{-7} \text{ Torr}$），防止空氣雜質混入薄膜。
- **薄膜厚度控制**：ALD 可實現原子層級（$0.1 \text{ nm}$）精準增厚，全晶圓厚度均勻度誤差小於 1%。
- **製程溫度**：熱 CVD 約 $400^\circ\text{C} \sim 800^\circ\text{C}$；PECVD 則可壓低至 $200^\circ\text{C} \sim 400^\circ\text{C}$。

---

## 上下游製程關聯

- **前置階段**：經過清洗與拋光的 [02-晶圓長晶與切片](02-wafer-manufacturing.md) 裸矽晶圓，或剛完成前一層蝕刻與摻雜的半成品晶圓。
- **後續製程**：沉積好新薄膜的晶圓，隨即送入 [04-微影技術](04-photolithography.md) 塗布光阻與曝光，定義出新一層的電路幾何線路。

---

## 常見迷思與 FAQ

> **Q1：薄膜沉積只在晶圓製造初期做一次嗎？**  
> **A1**：不是。imec (SRC-002) 與 Lam Research (SRC-003) 強調，薄膜沉積與蝕刻在整片晶圓的製造過程中會**循環重複數十次到數百次**！從最底層的電晶體微觀結構，到頂部多達十餘層的金屬互連高速公路，每一層都需要先沉積薄膜，再雕刻成型。

> **Q2：PVD 既然成本低，為什麼不能全面取代 CVD 與 ALD？**  
> **A2**：如 Lam Research (SRC-003) 所指出，PVD 是由上往下的「定向撞擊噴灑」，在立體溝槽中會產生嚴重的陰影效應，無法均勻包覆深孔側壁。唯有化學氣相沉積（CVD）與自限性的原子層沉積（ALD），氣體分子才能在所有微觀角落均勻擴散反應，形成高度均勻且無孔隙的優異保形薄膜。

---

## 參考資料來源（Citations）

- `SRC-001`: ASML, *The Basics of Microchips* (2024). [URL](https://www.asml.com/en/technology/all-about-microchips/microchip-basics)
- `SRC-002`: imec, *How Are Microchips Made?* (2024). [URL](https://www.imec-int.com/en/what-we-offer/semiconductor-education-and-workforce-development/microchips/how-are-microchips-made)
- `SRC-003`: Lam Research, *Deposition Essentials (Semi 101)* (2024). [URL](https://newsroom.lamresearch.com/Deposition-Essentials-Semi-101)
