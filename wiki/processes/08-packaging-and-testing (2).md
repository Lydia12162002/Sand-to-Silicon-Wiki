---
title: "晶圓封裝與測試"
english_title: "Packaging and Testing: Protecting and Interfacing the Microchip"
category: "processes"
tags: ["封裝", "晶圓測試", "針測", "切割", "打線", "覆晶", "散熱"]
sources:
  - "SRC-001"
  - "SRC-002"
  - "SRC-006"
last_updated: "2026-11-23"
prerequisites:
  - "../processes/07-metallization.md"
related_pages:
  - "../concepts/microchip-basics.md"
  - "../glossary/terms.md"
---

# 晶圓封裝與測試 (Packaging and Testing)

> [!NOTE]
> **白話摘要與直覺比喻**  
> **一句話定義**：封裝與測試（Packaging and Testing）是先在整片晶圓上精準篩檢出合格的晶片，然後將晶圓切割成數百顆獨立微小晶粒，再為每顆脆弱晶粒穿上堅固的防護裝甲，並引出外部金屬引腳以供主機板焊接通訊的終端工序。  
> **生活化比喻**：想像你在超大張烤盤上烤出了幾百塊精緻細膩的微型餅乾。首先，你要用放大鏡和品檢針挑出烤焦或有裂縫的壞餅乾（晶圓測試）；接著用高精密刀片把餅乾一塊塊完美切開（晶圓切割）；最後把每塊餅乾裝進密封防潮、防撞耐摔的獨立精美鐵盒裡，並在盒子外面接出兩排金屬插頭（封裝與引腳），讓它可以直接插進電腦的主機板上使用。

---

## 核心原理與科學機制

依據 imec (SRC-002) 的步驟六「封裝與保護微晶片（Packaging and protecting the microchip）」，剛從晶圓廠完工的晶片是一塊佈滿數十億個微型電晶體的矽薄片，極其脆弱且無法直接連接外界電子產品，必須歷經四大步驟完成轉化：

### 1. 晶圓針測（Wafer Sort / Chip Probing, CP）
- **機制**：整片晶圓在被切割之前，先被送入自動化針測機台。
- **探針卡測試**：使用帶有幾千根顯微金屬探針的探針卡（Probe Card），輕觸晶片表面的微小金屬接墊（Bond Pads），施加測試信號向量，檢驗每一顆晶粒（Die）的邏輯與電氣功能是否完全正常。
- **晶粒地圖（Wafer Map）**：測試系統自動在電腦中標記出合格晶粒（Good Die）與不良晶粒（Bad Die），確保後續只對良品進行高成本的封裝工序。

### 2. 晶圓切割（Wafer Dicing / Sawing）
- **機制**：將通過測試的晶圓背面貼在具有彈性的切割膠帶（Dicing Tape）上，固定於金屬環框中。
- **切割方式**：使用轉速高達每分鐘數萬轉、刀刃鍍有超細金剛石（鑽石刀）的精密晶圓切割機，或超快雷射隱形切割技術，沿著晶片之間的預留街道（Scribe Lines / Street）將整片晶圓切割成數百至數千顆獨立的微小裸晶粒（Bare Die）。

### 3. 晶片打線與覆晶封裝（Die Attach, Wire Bonding & Flip-Chip）
- **固晶（Die Attach）**：真空吸嘴抓取合格晶粒，使用環氧樹脂或銀膠黏著固定在導線架（Leadframe）或封裝基板（Package Substrate）上。
- **電氣互連**：
  - **傳統打線接合（Wire Bonding）**：使用比頭髮細數倍的超細金線、銅線或鋁線，透過超音波震動與熱壓，將晶片表面襯墊逐一焊接至外部引腳。
  - **覆晶封裝（Flip-Chip）**：先進製程採用覆晶技術，直接在晶片襯墊上植入微小錫球（Solder Bumps），翻轉晶片朝下直接對準基板焊接，大幅縮短導線長度，提供更高的頻寬與散熱效能。

### 4. 模壓封裝保護與散熱（Encapsulation & Heat Spreader）
- **環氧樹脂模壓（Molding）**：注入環氧樹脂模塑料（Epoxy Molding Compound, EMC）將裸晶與金線完全包覆固化，提供絕緣、防潮、防氧化與抗機械衝擊的物理防護。
- **散熱蓋（Heat Spreader）**：在高效能 CPU/GPU 晶片頂部加裝金屬散熱蓋（IHS），將運算時產生的大量廢熱傳導至外界散熱風扇或水冷系統。

### 5. 終檢測試（Final Test, FT）
封裝完成後，晶片在不同工作溫度（極寒 $-40^\circ\text{C}$ 至高溫 $100^\circ\text{C}$）與高頻時脈下接受最後一輪嚴格的綜合電氣與可靠度測試，通過者才打上雷射標籤包裝出廠。

---

## 關鍵技術指標與工作條件

- **晶圓良率（Yield）**：合格晶片佔整片晶圓所有晶片數量的百分比，是半導體廠獲利能力最核心的商業命脈。
- **散熱功耗（TDP）**：現代高效能旗艦晶片功耗可超過 200 至 400 瓦特，封裝熱阻（Thermal Resistance）成為效能瓶頸。

---

## 上下游製程關聯

- **前置階段**：剛剛完成 [07-金屬導線與層間互連](07-metallization.md) 的整片 12 吋成品晶圓。
- **後續出廠**：通過最終測試的成品微晶片，送往電子製造服務廠（EMS，如鴻海等），焊接組裝到智慧型手機、筆電、伺服器或電動車的主機板（PCB）上，正式走入人類現代生活。

---

## 常見迷思與 FAQ

> **Q1：整片晶圓割開後，如果有一半晶片是壞的，整片晶圓都要報廢嗎？**  
> **A1**：不需要。晶圓針測（CP）會精確記錄每一顆晶片的座標，切割後不良品會被直接捨棄，只有良品才會進入封裝。只要合格晶粒的收入能覆蓋製造晶圓的成本，生產就能維持獲利。

---

## 參考資料來源（Citations）

- `SRC-001`: ASML, *The Basics of Microchips* (2024). [URL](https://www.asml.com/en/technology/all-about-microchips/microchip-basics)
- `SRC-002`: imec, *How Are Microchips Made?* (2024). [URL](https://www.imec-int.com/en/what-we-offer/semiconductor-education-and-workforce-development/microchips/how-are-microchips-made)


### Batch 03：Intel 官方的封裝與測試六個階段（SRC-006）

Intel 的 *How Silicon Die Become Chip Packages* 將組裝與測試概括成以下六個階段（並不是指所有封裝產品都採完全相同的流程）：

1. **Chip Attach（晶粒固定）**：將晶粒及所需元件放置在封裝基板上。
2. **Epoxy（樹脂填隙）**：在晶粒與基板之間注入樹脂，減少空隙並分攤機械應力。
3. **Lid Attach（散熱蓋裝配）**：使用熱介面材料與散熱蓋協助散熱。
4. **Burn-in（老化篩選）**：使用較嚴格的電壓與溫度條件進行可靠性篩選。
5. **Test（電性測試）**：確認晶片功能及電性表現。
6. **Process Platform Validation（平台情境驗證）**：模擬客戶端使用條件與系統環境。

這六階段補充了前面 imec 對封裝與保護的概述；特定封裝數值或其他技術細節若缺乏個別來源，仍應保留待查狀態。

- `SRC-006`：[Intel — How Silicon Die Become Chip Packages](https://www.intel.com/content/www/us/en/newsroom/tech101/manufacturing/how-silicon-die-become-chip-packages.html)
