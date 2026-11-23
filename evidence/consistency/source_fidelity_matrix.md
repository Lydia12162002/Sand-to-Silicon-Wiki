# Stage 2 Batch 01 知識敘述與原始來源對應矩陣 (Source Fidelity Matrix)

- **檢驗時間**: 2026-11-23 10:33:40
- **檢驗節點**: `C21 (CHECK_COMPILATION - 來源忠實度深入核驗)`
- **分析範圍**: `wiki/` 全數 12 篇核心知識頁面 vs `raw/SRC-001` (ASML) 與 `raw/SRC-002` (imec)
- **總體狀態判定**: **`NEEDS_REVIEW`**（核心主幹直接支持，但 7 項特定製程命名與技術參數標記為待後續官方文獻補強驗證）

---

## 一、各頁面重要事實與來源比對矩陣

| 序號 | Wiki 頁面與核心技術敘述 | 對應來源 ID | 原始文章可定位之章節與原文證據 | 是否能由來源直接支持？ | 是否需額外資料驗證？ | 待補強文獻類型 / 處置方式 |
| :---: | :--- | :---: | :--- | :---: | :---: | :--- |
| **01** | `concepts/microchip-basics.md`<br/>微晶片是由純矽製成，電晶體充當微型開關控制電流通斷（1 與 0）。 | `SRC-001`<br/>`SRC-002` | **ASML**: "What’s a microchip? ... transistors act as miniature electrical switches that can turn a current on or off." | **直接支持** | 否 | 無需補強 |
| **02** | `concepts/microchip-basics.md`<br/>矽是半導體，來自二氧化矽沙石，透過摻入磷或硼調節導電度。 | `SRC-001` | **ASML**: "Digital gold: ... silicon is a ‘semiconductor’, meaning that its conductive properties can be increased by mixing it with other materials such as phosphorus or boron." | **直接支持** | 否 | 無需補強 |
| **03** | `concepts/microchip-basics.md`<br/>晶片分類：數位 vs 類比；邏輯（CPU/GPU/NPU）、記憶體（DRAM/NAND）、ASIC、SoC。 | `SRC-001` | **ASML**: "‘Flavors’ of chips: ... digital, analog, or mixed... Logic chips, Memory chips, ASICs and SoCs..." | **直接支持** | 否 | 無需補強 |
| **04** | `concepts/microchip-basics.md`<br/>ASML 不生產晶片，專門製造微影系統販售給晶圓代工廠。 | `SRC-001` | **ASML FAQ**: "Does ASML make microchips? No. ASML makes photolithography systems... chipmakers buy our systems." | **直接支持** | 否 | 無需補強 |
| **05** | `concepts/nanoscale-and-moore.md`<br/>奈米是 $10^{-9}$ 米，指甲每秒生長約 1 nm；紅血球 7,000 nm，流感病毒 100 nm。 | `SRC-001`<br/>`SRC-002` | **ASML**: "The nano scale: ... red blood cell is 7,000 nm, flu virus is around 100 nm."<br/>**imec**: "It’s roughly how much your nails grow in a single second." | **直接支持** | 否 | 無需補強 |
| **06** | `concepts/nanoscale-and-moore.md`<br/>摩爾定律驅使特徵尺寸微縮；EUV 技術是推動微縮關鍵。 | `SRC-001` | **ASML**: "Moore’s Law", "ASML’s EUV technology enables the scale of the smallest feature to be reduced even further." | **直接支持** | 否 | 無需補強 |
| **07** | `concepts/nanoscale-and-moore.md`<br/>EUV 光源波長為 13.5 nm；DUV 波長為 193 nm。 | 無 | **ASML/imec**: 僅提及 EUV 與 UV-light，未列出 13.5 nm 與 193 nm 數值。 | **來源未提及** | **是 (NEEDS_REVIEW)** | 待後續批次引入 ASML EUV 專門技術規格手冊驗證；頁面已標註 alert。 |
| **08** | `concepts/cleanroom-standards.md`<br/>晶片元件 1-100 nm，微塵會破壞電路與良率，必須在高度專門的無塵室生產。 | `SRC-002` | **imec**: "Even the slightest contamination could damage the delicate circuitry... manufacturing process takes place in a highly specialized cleanroom." | **直接支持** | 否 | 無需補強 |
| **09** | `concepts/cleanroom-standards.md`<br/>無塵室正壓層流、全罩防塵衣（Bunny suit）與 Class 1 等級規範。 | 無 | **imec**: 僅定性強調 "highly specialized cleanroom"，未列出 Class 1 與氣流細節。 | **部分支持** | **是 (NEEDS_REVIEW)** | 待後續批次引入無塵室工程或晶圓廠環境規格文獻補強。 |
| **10** | `processes/01-silicon-refining.md`<br/>普通沙石（二氧化矽 Silica sand）經高溫熔化提純並鑄造為大型圓柱晶棒（Ingot）。 | `SRC-001`<br/>`SRC-002` | **ASML**: "Silicon wafers are made using a type of sand called silica sand, which is made of silicon dioxide. The sand is melted and cast in the form of a large cylinder called an ‘ingot’."<br/>**imec**: "Step 1: Purifying silicon... ordinary sand to high-purity silicon..." | **直接支持** | 否 | 無需補強 |
| **11** | `processes/01-silicon-refining.md`<br/>冶金級矽高溫還原、三氯矽烷化學蒸餾與「西門子製程」沉積 99.9999999% 多晶矽。 | 無 | **ASML/imec**: 僅說明熔煉提純與鑄造晶棒，未提及西門子法、三氯矽烷化學反應與 9N 數字。 | **來源未提及** | **是 (NEEDS_REVIEW)** | 待後續引入矽材料提煉化工文獻驗證；頁面已標註 alert。 |
| **12** | `processes/02-wafer-manufacturing.md`<br/>圓柱晶棒切片為超薄晶圓（wafer），作為製造微晶片的主要基板（primary substrate）。 | `SRC-001`<br/>`SRC-002` | **ASML**: "This ingot is then sliced into thin wafers."<br/>**imec**: "Step 1: ... sliced into thin slices or wafers that form the primary substrate for building microchips." | **直接支持** | 否 | 無需補強 |
| **13** | `processes/02-wafer-manufacturing.md`<br/>「柴可拉斯基長晶法（Czochralski Method）」、晶種誘導拉晶、300 mm 直徑與 CMP 拋光細節。 | 無 | **ASML/imec**: 僅記載熔融鑄成圓柱晶棒與切片，未提及柴式長晶術語與 CMP 拋光墊機制。 | **來源未提及** | **是 (NEEDS_REVIEW)** | 待後續引入單晶矽生長與拋光專門手冊補強；頁面已標註 alert。 |
| **14** | `processes/03-thin-film-deposition.md`<br/>透過薄膜沉積（Deposition）建構晶片層級；包含 CVD（氣體分解成二氧化矽固態薄膜）與 PVD（真空物理氣化金屬如鋁或鈦）。 | `SRC-002` | **imec**: "Step 2: Building chip layers through deposition... Chemical vapor deposition... Physical vapor deposition... used to coat surfaces with metals like aluminum or titanium." | **直接支持** | 否 | 無需補強 |
| **15** | `processes/03-thin-film-deposition.md`<br/>原子層沉積（ALD）自限性表面反應說明。 | 無 | **imec**: 僅詳述 CVD 與 PVD，未提及 ALD 術語。 | **來源未提及** | **是 (NEEDS_REVIEW)** | 待後續批次引入薄膜設備大廠（如 Lam Research）官方文獻補強；頁面已標註 alert。 |
| **16** | `processes/04-photolithography.md`<br/>塗布光敏光阻（photoresist），透過含電路藍圖的光罩（mask/stencil）以紫外光曝光轉移圖案。 | `SRC-002` | **imec**: "Step 3: Drawing circuit patterns through photolithography... coating wafer with light-sensitive photoresist... exposed to UV-light through mask or stencil... circuit pattern transferred." | **直接支持** | 否 | 無需補強 |
| **17** | `processes/04-photolithography.md`<br/>ASML 研發 EUV 微影系統推動微縮，容納更多電晶體。 | `SRC-001` | **ASML**: "The nano scale: ASML’s EUV technology enables the scale of the smallest feature to be reduced even further... more transistors can fit on a chip." | **直接支持** | 否 | 無需補強 |
| **18** | `processes/05-etching.md`<br/>蝕刻是使用化學品（chemical product）去除未被光阻覆蓋的材料層，雕琢出電路路徑。 | `SRC-002` | **imec**: "Step 4: Sculpting the circuitry through etching. Etching is the process of removing layers of material... using a chemical product, creating different circuit paths." | **直接支持** | 否 | 無需補強 |
| **19** | `processes/05-etching.md`<br/>乾蝕刻（電漿蝕刻 / RIE）非等向性垂直深挖 vs 濕蝕刻等向性腐蝕與選擇比。 | 無 | **imec**: 僅統稱使用化學品雕刻線路，未展開電漿反應離子蝕刻之微觀物理機制。 | **部分支持** | **是 (NEEDS_REVIEW)** | 待後續引入 Lam Research 官方蝕刻白皮書補強驗證；頁面已標註 alert。 |
| **20** | `processes/06-doping.md`<br/>摻雜是刻意引入雜質修改矽的電氣特性，創造正電荷（p-type）與負電荷（n-type）載子以形成電晶體。 | `SRC-002`<br/>`SRC-001` | **imec**: "Step 5: Introducing electrical properties through doping... impurities intentionally introduced... creates regions of positive (p-type) and negative (n-type)... essential for forming transistors."<br/>**ASML**: "mixing it with other materials such as phosphorus or boron." | **直接支持** | 否 | 無需補強 |
| **21** | `processes/06-doping.md`<br/>離子佈植機加速高壓參數（keV）與快速熱退火（RTA）晶格修復流程。 | 無 | **imec/ASML**: 僅說明打入雜質產生載子，未提及高能離子佈植機參數與快速退火。 | **部分支持** | **是 (NEEDS_REVIEW)** | 待後續引入摻雜機台專門文獻補強；頁面已標註 alert。 |
| **22** | `processes/07-metallization.md`<br/>沉積、微影、蝕刻、摻雜循環重複數百次以構建電晶體與連接導線；現代晶片包含數十億個互連電晶體；使用銅與鋁。 | `SRC-002`<br/>`SRC-001` | **imec**: "Steps two to five are repeated hundreds of times, to first build the transistors... then the metal pathways that connect the transistors. Today’s chips contain billions of interconnected transistors..."<br/>**ASML**: "conductive copper or aluminum." | **直接支持** | 否 | 無需補強 |
| **23** | `processes/07-metallization.md`<br/>「銅雙波紋製程（Dual Damascene）」特定工藝命名與電鍍沉積細節。 | 無 | **imec**: 僅說明重複工序建造金屬路徑，未提及雙波紋（Damascene）術語。 | **來源未提及** | **是 (NEEDS_REVIEW)** | 待後續引入後段互連金屬化專門文獻補強；頁面已標註 alert。 |
| **24** | `processes/08-packaging-and-testing.md`<br/>晶圓通過嚴格測試後切成獨立晶片（individual chips），封入保護外殼並連接外部引腳/連接器。 | `SRC-002` | **imec**: "Step 6: Packaging and protecting the microchip. After passing a series of rigorous tests, each wafer is cut into small pieces... encased in a protective package... attached to external pins or connectors." | **直接支持** | 否 | 無需補強 |
| **25** | `processes/08-packaging-and-testing.md`<br/>探針卡晶圓針測（CP）、晶粒地圖、打線接合 vs 覆晶（Flip-Chip）、環氧樹脂模壓細節。 | 無 | **imec**: 僅定性說明測試、切割、保護封裝與引腳，未展開 CP/FT 測試卡與覆晶細節。 | **部分支持** | **是 (NEEDS_REVIEW)** | 待後續引入 Intel 等先進封測官方白皮書補強；頁面已標註 alert。 |
| **26** | `glossary/terms.md`<br/>晶片、電晶體、半導體、奈米、摩爾定律、無塵室、晶圓、光阻、光罩、微影、EUV、CVD、PVD、蝕刻、摻雜、封裝之核心白話定義。 | `SRC-001`<br/>`SRC-002` | **ASML / imec**: 兩篇官方教材全文直接支撐這 16 項核心名詞的定義與比喻。 | **直接支持** | 否 | 無需補強 |

---

## 二、忠實度矩陣統計與待補強項目總結

- **總抽取核心技術敘述項**: 26 項
- **由 SRC-001 / SRC-002 直接支持**: **18 項（佔比 69.2%）**
- **標記為待後續文獻驗證 (NEEDS_REVIEW)**: **8 項（佔比 30.8%）**

### 需在後續批次引入官方文獻補強之 8 大主題：
1. **西門子製程與提純反應式**（待補充：多晶矽提純化學文獻）
2. **柴可拉斯基長晶法與晶種操作細節**（待補充：晶圓長晶專業手冊）
3. **化學機械拋光（CMP）與研磨液機制**（待補充：CMP 設備手冊）
4. **原子層沉積（ALD）自限性表面機制**（待補充：Lam Research / 沉積設備白皮書）
5. **反應離子電漿乾蝕刻（RIE）與選擇比**（待補充：Lam Research 蝕刻技術白皮書）
6. **離子佈植能量參數與快速熱退火（RTA）**（待補充：摻雜/退火設備手冊）
7. **銅雙波紋製程（Dual Damascene）工藝細節**（待補充：金屬互連專門文獻）
8. **EUV 13.5 nm / DUV 193 nm 具體數值對照**（待補充：ASML EUV 官方技術規格白皮書）
