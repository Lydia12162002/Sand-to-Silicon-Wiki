# 知識敘述與原始來源對應矩陣 (Source Fidelity Matrix) - Batch 02 更新版

- **檢驗時間**: 2026-11-23 10:43:30
- **檢驗節點**: `C21 (CHECK_COMPILATION - 來源忠實度進階核驗)`
- **分析範圍**: `wiki/` 全數 12 篇核心知識頁面 vs `SRC-001` (ASML), `SRC-002` (imec), `SRC-003` (Lam Research), `SRC-004` (Lam Research)
- **總體狀態判定**: **`NEEDS_REVIEW`**（核心主幹直接支持度大幅提升，成功解決 ALD 與電漿蝕刻/選擇比 2 項問題；剩餘 6 項特定工藝參數維持 NEEDS_REVIEW 待後續批次官方文獻補強）

---

## 一、Batch 01 待查項目修正前後對比（Before vs. After）

| 待查項目編號 | 關鍵技術內容 | Batch 01 判定狀態 | Batch 02 判定狀態 | 最新官方文獻依據與證據位置 |
| :---: | :--- | :---: | :---: | :--- |
| **REV-01** | **原子層沉積 (ALD) 自限性表面反應** | `NEEDS_REVIEW` (來源未提及) | **`PASS`** (直接支持) | **SRC-003 (Lam Research)**: "CVD Variations: Atomic layer deposition (ALD) uses self-limiting surface reactions... Gas A introduced, reacts until saturated, purged; Gas B introduced, reacts to form film, purged... atomic layer by atomic layer." |
| **REV-02** | **乾蝕刻物理/化學機制、離子協同與選擇比** | `NEEDS_REVIEW` (部分支持/機理未提及) | **`PASS`** (直接支持) | **SRC-004 (Lam Research)**: "Etch Mechanisms: Physically (sputtering), Chemically (fluorine bonds to silicon forming volatile SiF4 gas), Ion neutral synergy (Rick Gottscho), Atomic layer etching (ALE), Selectivity (difference in etch rate)." |
| **REV-03** | 西門子製程化學式與 9N~11N 純度 | `NEEDS_REVIEW` | `NEEDS_REVIEW` (維持待查) | Lam Research 主攻蝕刻與沉積設備，未涵蓋多晶矽化學提純化工廠流程，留待後續矽材料專門文獻補強。 |
| **REV-04** | 柴可拉斯基長晶法與晶種拉晶參數 | `NEEDS_REVIEW` | `NEEDS_REVIEW` (維持待查) | 兩批來源皆僅提及熔煉鑄造晶棒，未包含長晶爐專業細節，留待晶圓製造專門文獻補強。 |
| **REV-05** | 化學機械拋光 (CMP) 研磨液與墊機制 | `NEEDS_REVIEW` | `NEEDS_REVIEW` (維持待查) | SRC-003 提及 ECD 金屬填孔與拋光概念，但未詳解 CMP 研磨液化學機械機制，留待後續 CMP 專門文獻補強。 |
| **REV-06** | 離子佈植高壓 (keV) 與快速熱退火 (RTA) | `NEEDS_REVIEW` | `NEEDS_REVIEW` (維持待查) | Lam Research 未涉及離子佈植與高溫退火設備，留待摻雜與熱處理文獻補強。 |
| **REV-07** | 銅雙鑲嵌製程 (Dual Damascene) 工藝命名 | `NEEDS_REVIEW` | `NEEDS_REVIEW` (維持待查) | SRC-003 詳解 ECD 電鍍填補金屬孔隙，但雙鑲嵌特定工藝全流程仍待金屬化文獻進一步對照。 |
| **REV-08** | EUV 13.5 nm / DUV 193 nm 具體光學波長數值 | `NEEDS_REVIEW` | `NEEDS_REVIEW` (維持待查) | Lam 文獻不涉及曝光波長，留待 ASML 專門微影光學白皮書補強。 |

---

## 二、全域知識敘述與原始來源對應矩陣（最新彙編）

| 序號 | Wiki 頁面與核心技術敘述 | 對應來源 ID | 原始文章可定位之章節與原文證據 | 是否直接支持？ | 狀態判定 |
| :---: | :--- | :---: | :--- | :---: | :---: |
| **01** | `concepts/microchip-basics.md`<br/>微晶片是由純矽製成，電晶體充當微型開關控制電流通斷（1 與 0）。 | `SRC-001`<br/>`SRC-002` | **ASML**: "What’s a microchip? ... transistors act as miniature electrical switches that can turn a current on or off." | 是 | **PASS** |
| **02** | `concepts/microchip-basics.md`<br/>矽是半導體，來自二氧化矽沙石，透過摻入磷或硼調節導電度。 | `SRC-001` | **ASML**: "Digital gold: ... silicon is a ‘semiconductor’... increased by mixing it with phosphorus or boron." | 是 | **PASS** |
| **03** | `concepts/microchip-basics.md`<br/>晶片分類：數位 vs 類比；邏輯（CPU/GPU/NPU）、記憶體（DRAM/NAND）、ASIC、SoC。 | `SRC-001` | **ASML**: "‘Flavors’ of chips: ... digital, analog, or mixed... Logic chips, Memory chips, ASICs and SoCs..." | 是 | **PASS** |
| **04** | `concepts/nanoscale-and-moore.md`<br/>奈米是 $10^{-9}$ 米，指甲每秒生長約 1 nm；紅血球 7,000 nm，病毒 100 nm。 | `SRC-001`<br/>`SRC-002` | **ASML**: "red blood cell is 7,000 nm, flu virus is around 100 nm."<br/>**imec**: "It’s roughly how much your nails grow in a single second." | 是 | **PASS** |
| **05** | `concepts/cleanroom-standards.md`<br/>晶片元件 1-100 nm，微塵會破壞電路與良率，必須在高度專門的無塵室生產。 | `SRC-002` | **imec**: "Even the slightest contamination could damage the delicate circuitry... manufacturing process takes place in a highly specialized cleanroom." | 是 | **PASS** |
| **06** | `processes/01-silicon-refining.md`<br/>普通沙石（二氧化矽 Silica sand）經高溫熔化提純並鑄造為大型圓柱晶棒（Ingot）。 | `SRC-001`<br/>`SRC-002` | **ASML**: "silica sand... melted and cast in the form of a large cylinder called an ‘ingot’."<br/>**imec**: "Step 1: Purifying silicon..." | 是 | **PASS** |
| **07** | `processes/02-wafer-manufacturing.md`<br/>圓柱晶棒切片為超薄晶圓（wafer），作為製造微晶片的主要基板（primary substrate）。 | `SRC-001`<br/>`SRC-002` | **ASML**: "This ingot is then sliced into thin wafers."<br/>**imec**: "Step 1: ... sliced into thin slices or wafers that form the primary substrate for building microchips." | 是 | **PASS** |
| **08** | `processes/03-thin-film-deposition.md`<br/>薄膜沉積兩大目的：金屬沉積（鋪設道路）與介電質沉積（設置護欄阻擋漏電）。 | `SRC-003` | **Lam Research**: "Metal deposition: laying roads where cars are allowed to travel; Dielectric deposition: setting up guidelines and barriers to route traffic." | 是 | **PASS** |
| **09** | `processes/03-thin-film-deposition.md`<br/>常見沉積技術：化學氣相沉積（CVD）、物理氣相沉積（PVD/濺鍍限制與陰影效應）、電化學沉積（ECD 填平金屬微孔）。 | `SRC-002`<br/>`SRC-003` | **imec**: "Step 2: Chemical vapor deposition... Physical vapor deposition..."<br/>**Lam**: "Common Methods: CVD uses reactive gases... PVD knock atoms off by sputtering, subject to shadowing effects... ECD void-free metal fill." | 是 | **PASS** |
| **10** | `processes/03-thin-film-deposition.md`<br/>原子層沉積（ALD）自限性表面化學反應、前驅物交替注入；ALD 具有優異保形性，可在適當製程條件下形成高度均勻薄膜。 | `SRC-003` | **Lam Research**: "Atomic layer deposition (ALD) uses self-limiting surface reactions to create extremely thin, uniform films... Gas A, purge, Gas B, purge... atomic scale control." | 是 | **PASS** |
| **11** | `processes/04-photolithography.md`<br/>塗布光敏光阻（photoresist），透過含電路藍圖的光罩（mask/stencil）以紫外光曝光轉移圖案。 | `SRC-002` | **imec**: "Step 3: Drawing circuit patterns through photolithography... photoresist... UV-light through mask or stencil... circuit pattern transferred." | 是 | **PASS** |
| **12** | `processes/04-photolithography.md`<br/>ASML 研發 EUV 微影系統推動微縮，容納更多電晶體。 | `SRC-001` | **ASML**: "ASML’s EUV technology enables the scale of the smallest feature to be reduced even further... more transistors can fit." | 是 | **PASS** |
| **13** | `processes/05-etching.md`<br/>蝕刻本質如石雕雕琢電路（Lam 石雕比喻）；濕蝕刻（等向性、側蝕崩塌） vs 乾蝕刻（非等向性、垂直方向性）。 | `SRC-002`<br/>`SRC-004` | **imec**: "Step 4: Sculpting circuitry through etching."<br/>**Lam**: "carving a statue out of stone—chipping away excess... Wet etch (isotropic)... Dry etch/plasma etch (anisotropic, directional)." | 是 | **PASS** |
| **14** | `processes/05-etching.md`<br/>乾蝕刻物理撞擊（Sputtering）與化學反應（自由基生成氣體 SiF4 脫附）雙機制。 | `SRC-004` | **Lam Research**: "Etch Mechanisms: Physically (ions knock atoms off)... Chemically (fluorine bonds to silicon forming volatile SiF4 gas and leaves surface)." | 是 | **PASS** |
| **15** | `processes/05-etching.md`<br/>離子-中性粒子協同效應（Ion-Neutral Synergy，Rick Gottscho）與原子層蝕刻（ALE）。 | `SRC-004` | **Lam Research**: "Ion neutral synergy (Rick Gottscho): physical and chemical help each other... Atomic layer etching (ALE): self-limiting adsorption, then desorption of modified layer." | 是 | **PASS** |
| **16** | `processes/05-etching.md`<br/>蝕刻選擇比（Selectivity）與深寬比（Aspect Ratio, HAR）。 | `SRC-004` | **Lam Research**: "Selectivity: difference in etch rate between two materials... Aspect ratio: ratio between depth and width." | 是 | **PASS** |
| **17** | `processes/06-doping.md`<br/>摻雜是刻意引入雜質修改矽的電氣特性，創造 P 型與 N 型載子以形成電晶體。 | `SRC-001`<br/>`SRC-002` | **imec**: "Step 5: Doping... introduces p-type and n-type charge carriers, essential for forming transistors."<br/>**ASML**: "mixing it with phosphorus or boron." | 是 | **PASS** |
| **18** | `processes/07-metallization.md`<br/>重複沉積、微影、蝕刻、摻雜循環數百次以構建電晶體與連接導線；使用銅與鋁。 | `SRC-001`<br/>`SRC-002`<br/>`SRC-003` | **imec**: "Steps two to five repeated hundreds of times to build transistors then metal pathways..."<br/>**ASML**: "conductive copper or aluminum."<br/>**Lam**: "Metal deposition creates electrical paths." | 是 | **PASS** |
| **19** | `processes/08-packaging-and-testing.md`<br/>晶圓通過嚴格測試後切成獨立晶片（individual chips），封入保護外殼並連接外部引腳/連接器。 | `SRC-002` | **imec**: "Step 6: Packaging and protecting... cut into small pieces... encased in protective package... attached to external pins." | 是 | **PASS** |
| **20** | `glossary/terms.md`<br/>收錄晶片、電晶體、半導體、EUV、CVD、PVD、ALD、ALE、ECD、PECVD、選擇比、深寬比等 26 項核心術語。 | `SRC-001`<br/>`SRC-002`<br/>`SRC-003`<br/>`SRC-004` | **ASML / imec / Lam**: 官方文獻詞彙表與專題專文全文直接支撐定義與比喻。 | 是 | **PASS** |
| **21** | `processes/01-silicon-refining.md`<br/>西門子製程化學式與 99.9999999% 純度數值 | 無 | 來源未提及具體反應式與 9N 數字 | 否 | **NEEDS_REVIEW** |
| **22** | `processes/02-wafer-manufacturing.md`<br/>柴式長晶命名、晶種拉晶操作條件與 775 $\mu\text{m}$ 數值 | 無 | 來源未提及柴氏專用名詞與 775 $\mu\text{m}$ 數值 | 否 | **NEEDS_REVIEW** |
| **23** | `processes/02-wafer-manufacturing.md`<br/>化學機械拋光（CMP）研磨墊微觀拋光機制 | 無 | 來源未提及 CMP 詳細機械研磨化學腐蝕機制 | 否 | **NEEDS_REVIEW** |
| **24** | `processes/06-doping.md`<br/>離子佈植加速能量（keV）與快速熱退火（RTA）晶格修復流程 | 無 | 來源未提及退火活化流程與加速電壓 | 否 | **NEEDS_REVIEW** |
| **25** | `processes/07-metallization.md`<br/>銅雙鑲嵌製程（Dual Damascene）工藝命名全套流程 | 無 | 來源詳解 ECD 電鍍，但未涵蓋 Damascene 特定工藝全命名 | 否 | **NEEDS_REVIEW** |
| **26** | `concepts/nanoscale-and-moore.md`<br/>EUV 13.5 nm / DUV 193 nm 具體光學波長數值 | 無 | 來源未列出 13.5 nm 與 193 nm 數值對照 | 否 | **NEEDS_REVIEW** |

---

## 三、忠實度矩陣最新統計

- **總分析核心敘述項**: 26 項
- **直接獲官方權威文獻直接支持 (PASS)**: **20 項（佔比 76.9%）**（較 Batch 01 增加 2 項核心重大機理支持）
- **保留為待後續官方文獻補強 (NEEDS_REVIEW)**: **6 項（佔比 23.1%）**（較 Batch 01 減少 2 項）
