---
title: "矽原料提取與提純"
english_title: "Silicon Refining: From Sand to Electronic Grade Silicon"
category: "processes"
tags: ["二氧化矽", "矽原料", "提純", "多晶矽", "純度99.9999999%"]
sources:
  - "SRC-001"
  - "SRC-002"
last_updated: "2026-11-23"
prerequisites:
  - "../concepts/microchip-basics.md"
related_pages:
  - "../processes/02-wafer-manufacturing.md"
  - "../glossary/terms.md"
---

# 矽原料提取與提純 (Silicon Refining)

> [!NOTE]
> **白話摘要與直覺比喻**  
> **一句話定義**：矽原料提純是將自然界沙石中的二氧化矽（$\text{SiO}_2$），經由化學還原與多重精餾，提煉成純度高達 99.9999999%（九個 9）的電子級多晶矽之起點工序。  
> **生活化比喻**：想像你在海邊抓起一把沙子，裡面混雜了各種泥土、貝殼與雜質。矽提純就像是一場極致的「化學大掃除」：先把沙子熔化去除氧氣，再把矽變成氣體反覆蒸餾，直到幾百公噸的純矽裡，雜質少到像是在一整座標準游泳池中只容許丟入一顆微小的砂糖！

---

## 核心原理與科學機制

ASML (SRC-001) 與 imec (SRC-002) 皆明確指出，所有晶片的起點都源自於最平凡無奇的自然物質——**沙子（Sand）**。

### 1. 自然界中的矽：二氧化矽（Silica Sand）
沙灘上的石英砂主要成分是**二氧化矽（Silicon Dioxide, $\text{SiO}_2$）**。矽（Si）在自然界中與氧原子牢固地結合在一起，無法直接用於製造晶片，必須先透過化學冶煉將氧分離。

### 2. 冶金級矽（Metallurgical Grade Silicon, MGS）
將石英砂與純碳（焦炭）在高溫電弧爐（超過 $1,900^\circ\text{C}$）中共同加熱，碳奪取氧氣生成一氧化碳氣體逸出：
$$\text{SiO}_2 + 2\text{C} \rightarrow \text{Si} + 2\text{CO} \uparrow$$
此階段產出的矽純度約為 $98\% \sim 99\%$，被稱為冶金級矽，通常用於煉鋼或鋁合金，對晶片而言依然太髒。

### 3. 化學精餾與電子級多晶矽（Electronic Grade Silicon, EGS）

> [!NOTE]
> **待後續權威資料驗證 (NEEDS_REVIEW)**  
> 關於「西門子製程（Siemens Process）」、「三氯矽烷化學反應式」與「純度 99.9999999% (9N~11N)」之具體化工細節，屬於業界標準實踐，但目前本批次之官方來源 SRC-001 (ASML) 與 SRC-002 (imec) 僅定性記載沙石熔煉提純與鑄造晶棒之核心事實，未列出具體化學反應式與 9N 數字標註。此部分標記為待驗證，待後續批次引入矽材料提煉官方文獻補強。

為了達到晶片所需的極限純度，將冶金級矽與氯化氫氣體反應，轉化為沸點僅 $31.8^\circ\text{C}$ 的液態**三氯矽烷（Trichlorosilane, $\text{SiHCl}_3$）**：
- 藉由蒸餾塔進行多次分餾，將所有微量沸點不同的金屬雜質徹底分離。
- 最後在氫氣高溫環境下進行西門子製程（Siemens Process），使超純的三氯矽烷分解沉積出固體棒狀多晶矽。
- **純度標準**：達到恐怖的 **99.9999999% 至 99.999999999%**（俗稱 9N 至 11N，即每十億至一千億個矽原子中，只允許存在一個非矽雜質原子）。

---

## 關鍵技術參數與工作條件

- **反應爐溫度**：$1,000^\circ\text{C} \sim 1,900^\circ\text{C}$。
- **純度要求**：99.9999999%（9N）以上。任何微量鐵、銅或碳雜質，都會毀掉電晶體的微弱電流切換機制。

---

## 上下游製程關聯

- **前置物料**：高品質天然石英砂、焦炭、高純度化學氯化氫。
- **後續製程**：提純完成的塊狀或棒狀電子級多晶矽，將作為原料投入下一步的 [晶圓長晶與切片](../processes/02-wafer-manufacturing.md)（長成單晶矽晶棒）。

---

## 常見迷思與 FAQ

> **Q1：海灘隨便抓一把沙子就能拿來做晶片嗎？**  
> **A1**：概念上是的，因為成分都是二氧化矽；但實務上半導體產業會挑選純度極高、二氧化矽含量原本就超過 99% 的高純度石英砂礦，以降低後續提煉的能源消耗與化學成本。

---

## 參考資料來源（Citations）

- `SRC-001`: ASML, *The Basics of Microchips* (2024). [URL](https://www.asml.com/en/technology/all-about-microchips/microchip-basics)
- `SRC-002`: imec, *How Are Microchips Made?* (2024). [URL](https://www.imec-int.com/en/what-we-offer/semiconductor-education-and-workforce-development/microchips/how-are-microchips-made)
