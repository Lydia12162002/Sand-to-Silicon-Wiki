---
title: "半導體核心術語與生活化比喻辭典"
english_title: "Semiconductor Glossary: Key Terms and Beginner Metaphors"
category: "glossary"
tags: ["術語辭典", "英文縮寫", "白話比喻", "半導體入門"]
sources:
  - "SRC-001"
  - "SRC-002"
last_updated: "2026-11-23"
prerequisites: []
related_pages:
  - "../concepts/microchip-basics.md"
  - "../concepts/nanoscale-and-moore.md"
  - "../index.md"
---

# 半導體核心術語與生活化比喻辭典 (Semiconductor Glossary)

本辭典彙整自 ASML (SRC-001) 與 imec (SRC-002) 官方教材中出現之關鍵專有名詞，提供繁體中文標準翻譯、英文全稱與縮寫，並附帶生活化白話比喻，協助零基礎讀者迅速掌握核心概念。

---

## 核心術語清單（依製程與概念分類）

### 一、基本概念與物理單位

| 繁體中文術語 | 英文全稱與縮寫 | 生活化比喻 / 白話定義 | 關聯頁面 |
| :--- | :--- | :--- | :--- |
| **微晶片 / 積體電路** | Microchip / Integrated Circuit (IC) | **微型立體都市**：在指甲大小的矽片上，密布著數十億個微型開關與導線的高科技大腦。 | [微晶片基礎](../concepts/microchip-basics.md) |
| **電晶體** | Transistor | **奈米電燈開關**：利用微弱電壓控制通斷的電子開關，開為「1」、關為「0」，無機械移動件。 | [微晶片基礎](../concepts/microchip-basics.md) |
| **半導體** | Semiconductor | **能屈能伸的水閘**：導電度介於導體與絕緣體之間，能透過微量摻雜隨心所欲控制導電性能的材料。 | [微晶片基礎](../concepts/microchip-basics.md) |
| **奈米** | Nanometer (nm, $10^{-9}\text{ m}$) | **指甲每秒生長長度**：十億分之一米。1 毫米等於一百萬奈米；人類紅血球約 7,000 奈米。 | [奈米尺度](../concepts/nanoscale-and-moore.md) |
| **摩爾定律** | Moore's Law | **行李箱翻倍魔術**：每隔約 18～24 個月，晶片上容納的電晶體數量翻倍，運算能力提升且價格下降。 | [奈米尺度](../concepts/nanoscale-and-moore.md) |
| **無塵室** | Cleanroom | **終極無塵避風港**：控制落塵量比醫院手術室乾淨萬倍的廠房，防止微塵砸毀奈米電路。 | [無塵室環境](../concepts/cleanroom-standards.md) |

---

### 二、晶片架構與功能分類

| 繁體中文術語 | 英文全稱與縮寫 | 生活化比喻 / 白話定義 | 關聯頁面 |
| :--- | :--- | :--- | :--- |
| **邏輯晶片** | Logic Chip | **運算大腦**：負責處理資訊與執行邏輯運算的晶片，如電腦 CPU、影像 GPU、AI 運算 NPU。 | [微晶片基礎](../concepts/microchip-basics.md) |
| **記憶體晶片** | Memory Chip | **資料倉庫與工作檯**：儲存數位資訊的晶片，分為快速斷電消失的 DRAM 與永久保存的 NAND Flash。 | [微晶片基礎](../concepts/microchip-basics.md) |
| **系統單晶片** | System-on-a-Chip (SoC) | **全功能瑞士刀**：將 CPU、GPU、通訊晶片與記憶體整合在單一小晶片內（如智慧型手機處理器）。 | [微晶片基礎](../concepts/microchip-basics.md) |
| **特殊應用晶片** | Application-Specific IC (ASIC) | **專職特工**：專為單一重複性任務（如條碼掃描、加密演算法）量身定制的高效率晶片。 | [微晶片基礎](../concepts/microchip-basics.md) |

---

### 三、八大核心製程技術

| 繁體中文術語 | 英文全稱與縮寫 | 生活化比喻 / 白話定義 | 關聯頁面 |
| :--- | :--- | :--- | :--- |
| **二氧化矽** | Silicon Dioxide ($\text{SiO}_2$, Silica Sand) | **晶片的純淨泥土**：普通石英沙的主要成分，經過高溫化學冶煉可提純出純矽。 | [01-矽原料提取](../processes/01-silicon-refining.md) |
| **矽晶棒** | Ingot | **高科技壽司長捲**：經由柴式長晶爐旋轉拉出的巨大單晶矽圓柱體。 | [02-晶圓製造](../processes/02-wafer-manufacturing.md) |
| **晶圓** | Wafer | **奈米畫布 / 鏡面薄餅**：將矽晶棒切片並拋光成表面粗糙度小於 0.1 奈米的超平整圓片。 | [02-晶圓製造](../processes/02-wafer-manufacturing.md) |
| **薄膜沉積** | Deposition | **原子級微觀噴漆**：以氣體化學反應（CVD）或物理撞擊濺鍍（PVD）在晶圓表面鍍上奈米薄膜。 | [03-薄膜沉積](../processes/03-thin-film-deposition.md) |
| **微影技術** | Photolithography | **極限相片沖洗**：用光阻、紫外光與光罩縮小投影，將奈米電路藍圖印在感光塗層上的核心工序。 | [04-微影技術](../processes/04-photolithography.md) |
| **極紫外光微影** | Extreme Ultraviolet Lithography (EUV) | **極短波長奈米刻刀**：ASML 獨家研發波長僅 13.5 nm 的光源系統，突破先進製程微縮瓶頸。 | [04-微影技術](../processes/04-photolithography.md) |
| **光阻** | Photoresist | **感光防護膠**：塗布在晶圓表面、被紫外光照射後化學性質改變的感光材料。 | [04-微影技術](../processes/04-photolithography.md) |
| **光罩** | Photomask / Reticle | **電路模板底片**：鍍有不透光鉻金屬的超純石英玻璃板，承載放大的原始電路設計藍圖。 | [04-微影技術](../processes/04-photolithography.md) |
| **蝕刻** | Etching | **微觀精準雕刻刀**：用電漿（乾蝕刻）或化學酸液（濕蝕刻）將未被光阻保護的區域挖掉雕琢成立體線路。 | [05-蝕刻製程](../processes/05-etching.md) |
| **摻雜** | Doping | **點石成金的滴墨法**：用離子佈植機將微量硼（P型）或磷（N型）原子高速轟入矽晶格，建立電晶體。 | [06-摻雜技術](../processes/06-doping.md) |
| **金屬連線** | Metallization / Interconnects | **十層立體高架公路**：利用雙波紋銅製程與導電通孔，將底層數十億個電晶體互聯成完整電路網絡。 | [07-金屬導線](../processes/07-metallization.md) |
| **晶圓針測** | Wafer Probing / Wafer Sort (CP) | **嚴苛品檢針**：用顯微探針卡在晶圓切割前測試每顆晶粒的電氣訊號，標註不良品。 | [08-晶圓封裝](../processes/08-packaging-and-testing.md) |
| **封裝** | Packaging | **穿戴防護裝甲與引腳**：將晶片切開後裝進耐撞耐溫的絕緣外殼，並拉出金屬接腳供主機板焊接。 | [08-晶圓封裝](../processes/08-packaging-and-testing.md) |

---

## 參考資料來源（Citations）

- `SRC-001`: ASML, *The Basics of Microchips* (2024). [URL](https://www.asml.com/en/technology/all-about-microchips/microchip-basics)
- `SRC-002`: imec, *How Are Microchips Made?* (2024). [URL](https://www.imec-int.com/en/what-we-offer/semiconductor-education-and-workforce-development/microchips/how-are-microchips-made)
