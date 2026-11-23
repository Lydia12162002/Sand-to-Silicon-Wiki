---
title: "蝕刻製程"
english_title: "Etching: Sculpting Circuitry into Material"
category: "processes"
tags: ["蝕刻", "乾蝕刻", "濕蝕刻", "RIE", "電漿蝕刻", "ALE", "Lam Research"]
sources:
  - "SRC-001"
  - "SRC-002"
  - "SRC-004"
last_updated: "2026-11-23"
prerequisites:
  - "../processes/04-photolithography.md"
related_pages:
  - "../processes/06-doping.md"
  - "../processes/07-metallization.md"
  - "../glossary/terms.md"
---

# 蝕刻製程 (Etching)

> [!NOTE]
> **白話摘要與直覺比喻**  
> **一句話定義**：蝕刻（Etching）是利用化學腐蝕液或高能量反應電漿，精準挖除晶圓表面未受光阻保護的多餘材料，從而將二維平面圖案雕刻成立體奈米電路凹槽的關鍵工序。  
> **生活化比喻（Lam Research 石雕比喻）**：微影技術只是在石頭上畫草稿，而蝕刻就像**拿著鑿子雕刻大理石雕像**——將所有多餘無用的石頭精準鑿除，顯露出隱藏在內部結構細膩的傳世傑作（3D 立體電路）。

---

## 核心原理與科學機制

依據 imec (SRC-002) 與全球蝕刻設備龍頭 Lam Research (SRC-004) 的官方權威指南，微影技術只是將電路圖案印在有機光阻膠上，而蝕刻則是真正將電路「雕琢（Sculpting）」進矽晶圓、介電質或金屬材料中的決定性步驟。

### 1. 兩大蝕刻技術分類（Etch Categories）

#### (1) 濕蝕刻（Wet Etching）
- **機制**：將晶圓浸入液態化學藥水槽中，利用純化學液相溶解去除未保護材料。
- **特點**：屬於**等向性蝕刻（Isotropic Etching）**，化學液體會朝上下左右所有方向等速腐蝕，造成明顯的橫向側蝕（Undercut）。
- **局限**：在微觀奈米尺度下，側蝕會導致相鄰線路崩塌或圖案失真（Pattern Collapse），因此在先進製程中主要退居用於大面積材料剝除、晶圓表面清潔與平坦結構。

#### (2) 乾蝕刻（Dry Etching / 電漿蝕刻 Plasma Etching）
*(本項已由 Lam Research SRC-004 官方文獻完整證實)*
- **機制**：在真空腔體中通入反應氣體，利用射頻電場（RF）激發產生高活性**電漿（Plasma）**。
- **特點**：具備高度**非等向性（Anisotropic / Directionality）**，能受電場導引垂直向下高速深挖，形成直立陡峭的微觀垂直側壁，是現代 AI 晶片、FinFET、GAA 電晶體與 3D NAND 高深寬比結構的核心工具。

---

### 2. 乾蝕刻的微觀去除機制（Etch Mechanisms）

Lam Research (SRC-004) 將電漿乾蝕刻的底層物理化學反應拆解為三大核心途徑：

#### (1) 物理撞擊機制（Physically / 濺射 Sputtering）
- 高能量帶正電的離子（如 $\text{Ar}^+$）在電場加速下垂直轟擊晶圓表面。
- 離子以純物理動能撞擊晶格，將表面原子「物理撞飛」（Sputter off）。
- **優缺點**：垂直方向性極強；但缺乏材料專一性（選擇比差），且容易對晶圓表面產生微觀物理撞擊損傷。

#### (2) 化學反應機制（Chemically / 自由基反應）
- 電漿中解離出極具化學反應活性的中性自由基（Radical species，如氟自由基 $\text{F}^*$ 或氯自由基 $\text{Cl}^*$）。
- 自由基擴散至晶圓表面與目標原子結合，生成具備揮發性（Volatile）的氣態分子副產物。例如：4 個氟原子與 1 個矽原子反應生成**四氟化矽氣體（$\text{SiF}_4$）**：
  $$\text{Si} + 4\text{F}^* \rightarrow \text{SiF}_4 \uparrow$$
- 生成的氣體副產物脫離表面（Desorption），隨即被強大真空泵抽離腔體。
- **優缺點**：化學選擇比極高（只與特定材料反應）；但自由基擴散無方向性，呈等向性。

#### (3) 離子-中性粒子協同效應（Ion-Neutral Synergy）
- **科學突破**：由 Lam Research 前技術長 Rick Gottscho 命名之半導體物理核心原理。
- **運作模式**：在電漿腔體內，物理離子轟擊與化學自由基反應**協同發生**：
  1. 垂直入射的高能離子撞擊晶圓底部，提供化學鍵斷裂所需的活化能（Activation Energy），打破底層結構。
  2. 中性自由基立刻與受到活化的表面原子劇烈反應，生成氣體副產物脫附排出。
  3. 未被垂直離子轟擊的垂直側壁則維持鈍化保護，不受化學侵蝕。
- **成果**：實現了超高蝕刻速率、極高材料選擇比，以及原子級完美的垂直直壁輪廓。

#### (4) 原子層蝕刻（Atomic Layer Etching, ALE）
- 與原子層沉積（ALD）成對應的極限微縮雕刻刀：
  1. **化學吸附（Adsorption）**：反應氣體進入腔體，與晶圓最表面單層原子發生自限性化學反應，將表面改質。
  2. **吹洗排空**：排空多餘未吸附氣體。
  3. **解吸脫附（Desorption）**：以微弱低能離子轟擊或活化劑，精確只使那層被改質的單原子層轉化為氣態脫附排出。
- 實現以**單原子層**為單位的極限材料剝離。

---

## 關鍵技術參數與評價指標

- **蝕刻選擇比（Selectivity）**：目標材料蝕刻速率與遮罩（光阻/硬光罩）或底層停止層蝕刻速率的比值。高選擇比能確保光阻在電路刻完前不會被提前耗盡。
- **深寬比（Aspect Ratio, AR）**：垂直深度與開口寬度的比率。3D NAND 垂直孔道需要達到超過 40:1 至 60:1 的極限高深寬比（High Aspect Ratio, HAR）精準蝕刻。
- **腔體技術架構**：感應耦合電漿（ICP，高自由基密度）與電容耦合電漿（CCP，高能量離子加速）。

---

## 上下游製程關聯

- **前置階段**：剛剛完成 [04-微影技術](04-photolithography.md) 顯影出防護遮罩的晶圓。
- **後續製程**：完成蝕刻並剝除剩餘光阻後，晶圓隨即送往 [06-摻雜技術](06-doping.md) 注入離子以構建電晶體，或進入薄膜沉積填補導電金屬。

---

## 常見迷思與 FAQ

> **Q1：蝕刻會把下面的晶圓整個挖穿嗎？**  
> **A1**：不會。現代蝕刻腔體配備先進光學終點檢測系統（OES）與高選擇比終止層（Etch Stop Layer）。當目標材料刻穿並暴露出底層時，電漿發出的特徵光譜顏色會瞬間劇變，機台會在數毫秒內透過軟體智慧自動停止進氣並熄滅電漿。

---

## 參考資料來源（Citations）

- `SRC-001`: ASML, *The Basics of Microchips* (2024). [URL](https://www.asml.com/en/technology/all-about-microchips/microchip-basics)
- `SRC-002`: imec, *How Are Microchips Made?* (2024). [URL](https://www.imec-int.com/en/what-we-offer/semiconductor-education-and-workforce-development/microchips/how-are-microchips-made)
- `SRC-004`: Lam Research, *Etch Essentials: The Building Blocks of AI Era Microchips (Semi 101)* (2024). [URL](https://newsroom.lamresearch.com/etch-essentials-semiconductor-manufacturing)
