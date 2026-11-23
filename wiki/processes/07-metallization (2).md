---
title: "金屬導線與層間互連"
english_title: "Metallization and Interconnects: The 3D Nanoscale Highway"
category: "processes"
tags: ["金屬連線", "銅製程", "雙鑲嵌製程", "通孔", "CMP", "後段製程"]
sources:
  - "SRC-001"
  - "SRC-002"
last_updated: "2026-11-23"
prerequisites:
  - "../processes/06-doping.md"
related_pages:
  - "../processes/08-packaging-and-testing.md"
  - "../glossary/terms.md"
---

# 金屬導線與層間互連 (Metallization and Interconnects)

> [!NOTE]
> **白話摘要與直覺比喻**  
> **一句話定義**：金屬連線（Metallization）是在完成的數十億個電晶體之上，透過反覆堆疊沉積金屬與絕緣層，打造出縱橫交錯、高達十幾層的立體奈米導線網路，讓訊號與電力得以在各元件間飛速傳遞的工序。  
> **生活化比喻**：如果把剛剛做好的電晶體比喻成大城市地面上的數十億棟摩天大樓，金屬連線就像是在這座城市上方建造的「立體高架橋與高速公路網絡」。最底層的道路又密又窄，連接相鄰的大樓；越往頂層的公路越寬越粗，負責跨越大區域運送大量車流（電力與主時脈訊號），各層之間則有垂直的匝道（通孔 Via）相互貫通。

---

## 核心原理與科學機制

imec (SRC-002) 明確指出：「步驟二至步驟五會重複進行數百次，首先在晶片上構建電晶體，接著打造連接這些電晶體的金屬路徑（metal pathways）。」在現代半導體製程中，這部分被稱為**後段製程（Back-End of Line, BEOL）**。

### 1. 為什麼需要十幾層的金屬導線？
單一顆先進晶片擁有數十億甚至上千億個電晶體。若只在單一平面拉線，晶片面積將大到無法想像，且訊號線路會嚴重打結。因此，工程師在電晶體上方堆疊了 10 到 20 層垂直的金屬互連層：
- **底層導線（Local Interconnects）**：最靠近電晶體，線寬極細（幾十奈米），負責相鄰電晶體間的短距互聯。
- **中層導線（Intermediate Interconnects）**：中等線寬，負責功能模組（如暫存器、邏輯單元）間的通訊。
- **頂層導線（Global Interconnects）**：線條最粗，負責全晶片的供電電源（VDD / GND）分配與全域時脈（Clock）訊號同步。

### 2. 銅雙鑲嵌製程（Dual Damascene Process）

> [!NOTE]
> **待後續權威資料驗證 (NEEDS_REVIEW)**  
> 來源 SRC-002 (imec) 與 SRC-001 (ASML) 直接支持重複沉積、微影與蝕刻以打造連接電晶體之金屬路徑（包含鋁與銅金屬）；關於特定之「雙鑲嵌（Dual Damascene）」製程命名與化學電鍍細節，待後續批次引入金屬互連專門文獻補強驗證。

在早期製程中，金屬導線主要使用鋁（Aluminum）。但隨著線寬急遽微縮，鋁的電阻過大且容易產生電遷移（Electromigration）斷裂，因此自 130 奈米世代起全面改用導電率更高、抗電遷移能力更強的**銅（Copper, Cu）**：
- **挑戰**：銅很難透過傳統反應離子蝕刻（RIE）進行乾蝕刻揮發。
- **創新解法——雙鑲嵌法（Dual Damascene）**：
  1. 先在晶圓表面沉積一層二氧化矽等低介電常數（Low-k）絕緣層。
  2. 利用微影與蝕刻，在絕緣層中挖出水平導線溝槽（Trench）與垂直導電通孔（Via）。
  3. 鍍上一層極薄的鉭（Ta/TaN）阻擋層（防止銅原子擴散滲透進矽基底）。
  4. 利用電鍍（Electroplating）將整條溝槽與通孔完全填滿純銅。
  5. 最後利用 [化學機械拋光（CMP）](../processes/02-wafer-manufacturing.md)，將溝槽外溢出的多餘銅層全部磨平，只留下嵌在絕緣溝槽內的精美銅導線。

---

## 關鍵技術參數與工作條件

- **金屬層數**：現代先進手機與 AI 晶片通常具備 **12 至 18 層金屬連線**。
- **總長度驚人**：指甲大小晶片內部所有奈米級銅導線串聯起來，總長度可長達數十公里甚至上百公里！
- **阻抗與電容延遲（RC Delay）**：導線變細會增加電阻（R），導線靠攏會增加電容（C），降低 RC 延遲是維持晶片高頻率運行的關鍵挑戰。

---

## 上下游製程關聯

- **前置階段**：剛剛完成 [06-摻雜技術](06-doping.md) 構建出底層電晶體元件的前段晶圓（FEOL）。
- **後續製程**：完成頂層金屬襯墊（Bond Pads）鍍金與保護層（Passivation Layer）沉積後，整片晶圓的微觀電路製造即告完工，移出無塵室進入最後的 [08-晶圓封裝與測試](08-packaging-and-testing.md)。

---

## 參考資料來源（Citations）

- `SRC-001`: ASML, *The Basics of Microchips* (2024). [URL](https://www.asml.com/en/technology/all-about-microchips/microchip-basics)
- `SRC-002`: imec, *How Are Microchips Made?* (2024). [URL](https://www.imec-int.com/en/what-we-offer/semiconductor-education-and-workforce-development/microchips/how-are-microchips-made)
