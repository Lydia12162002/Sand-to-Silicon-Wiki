---
title: "摻雜技術與電晶體構建"
english_title: "Doping: Introducing Electrical Properties to Form Transistors"
category: "processes"
tags: ["摻雜", "離子佈植", "P型半導體", "N型半導體", "電晶體"]
sources:
  - "SRC-001"
  - "SRC-002"
last_updated: "2026-11-23"
prerequisites:
  - "../processes/05-etching.md"
related_pages:
  - "../processes/07-metallization.md"
  - "../concepts/microchip-basics.md"
  - "../glossary/terms.md"
---

# 摻雜技術與電晶體構建 (Doping)

> [!NOTE]
> **白話摘要與直覺比喻**  
> **一句話定義**：摻雜（Doping）是在純矽晶體中刻意打入極微量的特定雜質原子（如硼或磷），改變局部區域的導電性質與載子類型，從而創造出能夠通斷電流的「電晶體」之核心工序。  
> **生活化比喻**：想像純淨的蒸餾水原本是不導電的。但只要在水裡加入幾滴墨水或少許鹽巴，原本不導電的水立刻變得能夠導電！摻雜就像用一把高科技的「原子機關槍（離子佈植機）」，精準把特定的外來原子射入矽晶體中，讓原本純淨中庸的矽，局部變成帶正電或帶負電的微型開關零件。

---

## 核心原理與科學機制

ASML (SRC-001) 與 imec (SRC-002) 皆強調，矽之所以被稱為「半導體」，關鍵就在於能夠透過摻雜調節導電度：

### 1. 純矽的晶格結構
純矽原子外層有 4 個價電子，彼此以穩固的共價鍵晶格結合。在室溫下，純矽中幾乎沒有自由移動的電子，因此導電能力很差，接近絕緣體。

### 2. 兩大摻雜類型（P 型與 N 型半導體）
藉由引入週期表中鄰近矽的元素，打破電子平衡：
- **N 型半導體（Negative-type）**：
  - **摻入雜質**：磷（Phosphorus, P）或砷（Arsenic, As）等第 15 族（五價）元素。
  - **機制**：五價元素提供 5 個外層電子，其中 4 個與矽結合，多出 1 個多餘電子自由移動。多餘的「自由電子（Free Electrons）」帶負電，成為主要導電載子。
- **P 型半導體（Positive-type）**：
  - **摻入雜質**：硼（Boron, B）等第 13 族（三價）元素。
  - **機制**：三價元素只有 3 個外層電子，與周圍 4 個矽原子結合時會缺少 1 個電子，產生一個帶正電的「電洞（Hole）」。周圍電子跳入電洞，形成正電荷移動的導電效果。

### 3. 電晶體（MOSFET）的運作基石
當 P 型半導體與 N 型半導體在晶圓中相鄰結合時，便形成了著名的 **PN 接面（PN Junction）**。
在最常見的金屬-氧化物-半導體場效電晶體（MOSFET）中：
- 兩側分別是富含電子的 N 型區域，稱為**源極（Source）**與**汲極（Drain）**。
- 中間隔著一塊 P 型通道，上方鍍有超薄的絕緣二氧化矽與控制金屬**閘極（Gate）**。
- 當閘極施加正電壓時，吸引電子在 P 型通道表面聚集形成導電通道，電流順暢通過源極與汲極（電晶體導通，代表「1」）；移去電壓時通道消失，電流切斷（代表「0」）。

### 4. 離子佈植（Ion Implantation）與高溫退火（Thermal Annealing）

> [!NOTE]
> **待後續權威資料驗證 (NEEDS_REVIEW)**  
> SRC-001 (ASML) 與 SRC-002 (imec) 直接支持摻入硼（三價形成正載子 P 型）或磷（五價形成負載子 N 型）以調節矽導電度並構建電晶體；關於「離子佈植機之加速高壓能量」與「快速熱退火（RTA）晶格修復與高溫活化」步驟，待後續批次引入摻雜設備專門文獻補強驗證。

- **離子佈植**：在真空環境下將摻雜氣體電離，利用高壓電場將硼或磷離子加速至數萬到數十萬電子伏特（keV），像砲彈一樣高速轟入晶圓表面未受光阻遮蓋的特定區域。
- **高溫快速退火（Rapid Thermal Annealing, RTA）**：離子的高速撞擊會打碎原本整齊的矽晶格。佈植完成後，將晶圓短暫加熱至 $1,000^\circ\text{C}$ 數秒鐘，讓矽原子重新排列修復晶格損傷，並促使摻雜原子嵌入晶格活化（Activation）。

---

## 關鍵技術參數與工作條件

- **摻雜濃度（Doping Concentration）**：通常在 $10^{15} \sim 10^{20} \ \text{atoms/cm}^3$ 之間（每幾千到幾百萬個矽原子中摻入 1 個雜質原子），控制精度達到 ppb（十億分之一）等級。
- **佈植深度**：由加速電壓精確控制在數奈米至數微米深度。

---

## 上下游製程關聯

- **前置階段**：經過 [04-微影技術](04-photolithography.md) 與 [05-蝕刻製程](05-etching.md) 定義出摻雜窗口的晶圓。
- **後續製程**：電晶體基礎單元構建完畢後，隨即進入 [07-金屬導線與互連](07-metallization.md)，建立連接數十億個電晶體的立體高速公路。

---

## 參考資料來源（Citations）

- `SRC-001`: ASML, *The Basics of Microchips* (2024). [URL](https://www.asml.com/en/technology/all-about-microchips/microchip-basics)
- `SRC-002`: imec, *How Are Microchips Made?* (2024). [URL](https://www.imec-int.com/en/what-we-offer/semiconductor-education-and-workforce-development/microchips/how-are-microchips-made)
