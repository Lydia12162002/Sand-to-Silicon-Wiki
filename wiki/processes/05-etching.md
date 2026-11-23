---
title: "蝕刻製程"
english_title: "Etching: Sculpting Circuitry into Material"
category: "processes"
tags: ["蝕刻", "乾蝕刻", "濕蝕刻", "RIE", "電漿蝕刻", "非等向性"]
sources:
  - "SRC-001"
  - "SRC-002"
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
> **生活化比喻**：想像你在木板上貼了一張印有圖案的防護貼紙（光阻），然後用噴砂機或雕刻刀對著木板猛烈雕琢。被貼紙保護的區域完好無損，而露出來的木板則被徹底挖掉；最後撕掉貼紙，木板上就浮現出線條鮮明的立體浮雕電路。

---

## 核心原理與科學機制

imec (SRC-002) 指出，蝕刻是「透過蝕刻雕琢電路（Sculpting the circuitry through etching）」的核心環節。微影技術僅僅是將圖案印在光阻感光膠上，真正把電路刻入實體矽或金屬薄膜中的是蝕刻。

### 1. 蝕刻的核心流程
1. **圖案暴露**：經微影顯影後的晶圓，表面呈現「有光阻遮蓋」與「裸露無保護」的雙重交錯區域。
2. **化學/物理侵蝕**：將晶圓暴露於特定蝕刻劑中，蝕刻劑專門腐蝕去除裸露區域的材料層（如二氧化矽、多晶矽或金屬）。
3. **光阻剝除（Photoresist Stripping / Ashing）**：當底部材料被挖出預定深度與線寬後，使用氧氣電漿（電漿灰化）或化學溶劑將任務完成的光阻膜徹底洗除乾淨，露出刻好的實體結構。

### 2. 兩大蝕刻技術分類

> [!NOTE]
> **待後續權威資料驗證 (NEEDS_REVIEW)**  
> 來源 SRC-002 (imec) 明確定義蝕刻為「使用化學品移除未受光阻覆蓋材料以雕琢電路」，本頁之非等向性乾蝕刻（RIE 電漿）與等向性濕蝕刻之對比屬於半導體物理常規，但具體電漿選擇比與反應氣體細節待後續引入蝕刻專門設備文獻（如 Lam Research 白皮書）補強精確驗證。

#### (1) 濕蝕刻（Wet Etching）
- **機制**：將晶圓浸泡於液態化學強酸或強鹼槽中（如用氫氟酸 HF 蝕刻二氧化矽）。
- **特點**：屬於**等向性蝕刻（Isotropic Etching）**，化學藥水會朝上下左右各個方向均勻腐蝕，會發生嚴重的「側蝕（Undercut）」，導致刻出來的線條比原本圖案更胖或凹陷。
- **定位**：不適合奈米級先進線路微縮，目前主要用於大面積去除材料或晶圓清洗。

#### (2) 乾蝕刻（Dry Etching / 反應離子蝕刻 RIE）
- **機制**：在真空腔體中通入反應氣體（如含氟或含氯氣體），利用強電場激發產生**電漿（Plasma）**。反應離子在電場加速下，以垂直方向高速轟擊晶圓表面。
- **特點**：屬於**非等向性蝕刻（Anisotropic Etching）**，具備完美的垂直方向性，只向下深挖而不向兩側擴散，能刻出垂直陡峭、深寬比極高的微觀奈米溝槽。
- **定位**：現代先進微晶片不可或缺的主流雕刻刀。

---

## 關鍵技術參數與工作條件

- **蝕刻選擇比（Selectivity）**：蝕刻劑必須極度偏愛目標材料，而不腐蝕光阻及底層材料（選擇比通常要求大於 20:1 甚至 50:1）。
- **關鍵尺寸均勻性（CD Uniformity）**：整片 300 mm 晶圓上的上兆條溝槽寬度誤差必須控制在原子級的數埃（$\text{Å}$）之內。

---

## 上下游製程關聯

- **前置階段**：剛剛完成 [04-微影技術](04-photolithography.md) 顯影出防護遮罩的晶圓。
- **後續製程**：剝除光阻後，晶圓可能送往 [06-摻雜製程](06-doping.md) 注入離子以形成電晶體，或進入金屬沉積填入導線。

---

## 常見迷思與 FAQ

> **Q1：蝕刻會把下面的晶圓整個挖穿嗎？**  
> **A1**：不會。蝕刻深度是由精密的時間控制（Timed Etch）與光學終點檢測系統（Optical Emission Spectroscopy, OES）決定的。當特定材料被完全挖穿、露出底層材料時，電漿發出的光譜顏色會瞬間改變，機台便會在毫秒內停止進氣並關閉電漿。

---

## 參考資料來源（Citations）

- `SRC-001`: ASML, *The Basics of Microchips* (2024). [URL](https://www.asml.com/en/technology/all-about-microchips/microchip-basics)
- `SRC-002`: imec, *How Are Microchips Made?* (2024). [URL](https://www.imec-int.com/en/what-we-offer/semiconductor-education-and-workforce-development/microchips/how-are-microchips-made)
