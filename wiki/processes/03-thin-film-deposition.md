---
title: "薄膜沉積技術"
english_title: "Thin Film Deposition: Building Microchip Layers"
category: "processes"
tags: ["薄膜沉積", "CVD", "PVD", "化學氣相沉積", "物理氣相沉積"]
sources:
  - "SRC-001"
  - "SRC-002"
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
> **生活化比喻**：想像為模型玩具噴漆，但這是一把精確到「單個分子層級」的超級噴槍。晶片需要好幾十層樓高的立體結構，每一層樓的地板可能是導電的金屬層，牆壁可能是防止漏電的絕緣層；薄膜沉積就像是在晶圓上一層層精準鋪設極薄的地板與牆壁。

---

## 核心原理與科學機制

imec (SRC-002) 說明，晶片製造的第二步驟即為「透過沉積構建晶片層級（Building chip layers through deposition）」。依據沉積材料（金屬、介電質氧化物、氮化物）與物理化學機制的不同，主要採用兩大核心沉積技術：

### 1. 化學氣相沉積（Chemical Vapor Deposition, CVD）
- **機制**：將含有目標元素的前驅反應氣體（Precursor Gases）導入反應腔體中。在高溫或電漿激發下，氣體分子在晶圓表面發生化學裂解或重組反應，生成一層堅固均勻的固態薄膜，副產物氣體則被抽真空排氣帶走。
- **代表應用**：生長高品質的二氧化矽（$\text{SiO}_2$）絕緣層、氮化矽保護層或多晶矽閘極。
- **優勢**：階梯覆蓋能力（Step Coverage）極佳，能均勻填滿微小的溝槽與深孔。

### 2. 物理氣相沉積（Physical Vapor Deposition, PVD / 濺鍍 Sputtering）
- **機制**：在高度真空腔體內，利用物理手段（如高能量氬離子電漿轟擊金屬靶材），將目標金屬原子「物理擊出」並濺射蒸發，隨後冷凝並附著在晶圓表面形成金屬薄膜。
- **代表應用**：沉積鋁（Al）、鈦（Ti）、銅（Cu）等金屬導線與擴散阻擋層。
- **優勢**：薄膜純度極高，結合力強，特別適合高熔點金屬。

### 3. 原子層沉積（Atomic Layer Deposition, ALD - 進階衍生）

> [!NOTE]
> **待後續權威資料驗證 (NEEDS_REVIEW)**  
> SRC-002 (imec) 權威支持化學氣相沉積（CVD）與物理氣相沉積（PVD）之機制與應用；「原子層沉積（ALD）」之自限性表面反應說明屬於先進製程延伸，待後續批次引入薄膜沉積設備大廠（如 Lam Research）官方白皮書補強驗證。

在更先進的奈米節點中，採用自限性化學表面反應（Self-Limiting Surface Reaction），一次僅沉積單層原子厚度（約 0.1 奈米），達到極致的厚度精準控制。

---

## 關鍵技術參數與工作條件

- **腔體環境**：高真空至超高真空（$10^{-3} \sim 10^{-7} \text{ Torr}$），防止空氣雜質混入薄膜。
- **薄膜厚度控制**：從數十奈米到數個原子層厚度，全晶圓厚度均勻度誤差小於 1%。

---

## 上下游製程關聯

- **前置階段**：經過清洗與拋光的 [02-晶圓長晶與切片](02-wafer-manufacturing.md) 裸矽晶圓，或剛完成前一層蝕刻與摻雜的半成品晶圓。
- **後續製程**：沉積好新薄膜的晶圓，隨即送入 [04-微影技術](04-photolithography.md) 塗布光阻與曝光，定義出新一層的電路幾何線路。

---

## 常見迷思與 FAQ

> **Q1：薄膜沉積只在晶圓製造初期做一次嗎？**  
> **A1**：不是。imec (SRC-002) 強調，薄膜沉積、微影、蝕刻與摻雜這套組合步驟，在整片晶圓的製造過程中會**循環重複數十次到數百次**！從最底層的電晶體微觀結構，到中層的觸點，再到頂部多達十餘層的金屬互連高速公路，每一層都需要先沉積薄膜，再雕刻成型。

---

## 參考資料來源（Citations）

- `SRC-001`: ASML, *The Basics of Microchips* (2024). [URL](https://www.asml.com/en/technology/all-about-microchips/microchip-basics)
- `SRC-002`: imec, *How Are Microchips Made?* (2024). [URL](https://www.imec-int.com/en/what-we-offer/semiconductor-education-and-workforce-development/microchips/how-are-microchips-made)
