# Wiki 歷程日誌 (Wiki Changelog)

本文件依循 Andrej Karpathy 的 LLM Wiki 規範，為只允許追加（Append-only）的 Wiki 變更紀錄日誌。每當 AI Agent 執行資料攝入、頁面新增、內容修訂或衝突修正時，均必須在此記錄變更歷程。

---

## 變更紀錄格式說明

每次更新記錄包含下列欄位：
- **日期時間 (Timestamp)**: `YYYY-MM-DD HH:MM:SS` (當地時間)
- **操作類型 (Action)**: `INIT` (初始化), `INGEST` (資料攝入), `UPDATE` (內容擴充/修正), `LINT_FIX` (結構修復)
- **資料來源代碼 (Source ID)**: 對應於 `sources/manifest.json` 的來源 ID；若為結構調整則填 `INTERNAL` 或 `SYSTEM`
- **影響檔案 (Target Files)**: 受影響的 Markdown 檔案列表
- **更新摘要 (Summary)**: 具體說明白話內容、概念增修或修正之重點

---

## 歷程紀錄列表

### [2026-11-18 14:38:00] - 專案知識庫初始化 (Stage 1)
- **操作類型**: `INIT`
- **資料來源代碼**: `SYSTEM_INIT`
- **影響檔案**:
  - `wiki/index.md`
  - `wiki/log.md`
- **更新摘要**:
  - 建立 Wiki 知識入口首頁 (`wiki/index.md`)，涵蓋半導體製造八大旅程地圖與四層分類架構（concepts, processes, equipment, glossary）。
  - 建立 Wiki 歷程日誌 (`wiki/log.md`) 作為未來知識編譯之追蹤基準。
  - 目前尚未攝入外部原始資料，待 Stage 2 引入權威來源後開始依序編譯實體頁面。

### [2026-11-23 10:25:00] - 第一批權威資料攝入與 Wiki 知識編譯 (Stage 2 - Batch 01)
- **操作類型**: `INGEST`
- **資料來源代碼**: `SRC-001` (ASML), `SRC-002` (imec)
- **影響檔案**:
  - `sources/manifest.json` (登錄兩篇來源中繼資料與真實 SHA256)
  - `wiki/concepts/microchip-basics.md` (新增微晶片與積體電路基礎)
  - `wiki/concepts/nanoscale-and-moore.md` (新增奈米微觀尺度與摩爾定律)
  - `wiki/concepts/cleanroom-standards.md` (新增無塵室環境標準)
  - `wiki/processes/01-silicon-refining.md` (新增矽原料提取與提純)
  - `wiki/processes/02-wafer-manufacturing.md` (新增晶圓長晶與切片)
  - `wiki/processes/03-thin-film-deposition.md` (新增薄膜沉積技術)
  - `wiki/processes/04-photolithography.md` (新增微影技術與 EUV)
  - `wiki/processes/05-etching.md` (新增蝕刻製程)
  - `wiki/processes/06-doping.md` (新增摻雜技術與電晶體構建)
  - `wiki/processes/07-metallization.md` (新增金屬導線與層間互連)
  - `wiki/processes/08-packaging-and-testing.md` (新增晶圓封裝與測試)
  - `wiki/glossary/terms.md` (新增核心術語與生活比喻辭典)
  - `wiki/index.md` (更新首頁導覽，串接所有實體頁面連結)
- **更新摘要**:
  - 正式攝入 ASML 與 imec 官方第一手教學文獻，驗證 Checksum 並固化於 `raw/` 與 `sources/manifest.json`。
  - 完整編譯半導體基礎概念、無塵室環境及八大核心製造流程，全面保留英文專業術語（IC, EUV, CVD, PVD, RIE, MOSFET, CMP 等）並附帶直觀生活化比喻。
  - 完成所有 Markdown 頁面之 YAML Frontmatter、來源標記、前置條件與相關頁面雙向串連。

### [2026-11-23 10:43:00] - 第二批權威資料攝入與 Wiki 專業深化 (Stage 2 - Batch 02)
- **操作類型**: `INGEST`
- **資料來源代碼**: `SRC-003` (Lam Research), `SRC-004` (Lam Research)
- **影響檔案**:
  - `sources/manifest.json` (登錄 Lam Research 兩篇文獻與真實 SHA256)
  - `wiki/processes/03-thin-film-deposition.md` (擴充 ALD 自限性反應、PECVD 低溫優勢、ECD 電鍍填孔)
  - `wiki/processes/05-etching.md` (擴充乾蝕刻物理/化學機制、Ion-Neutral Synergy 協同效應、ALE 原子層蝕刻、選擇比與深寬比)
  - `wiki/glossary/terms.md` (新增 ALD, ALE, Ion-Neutral Synergy, ECD, PECVD, Selectivity, Aspect Ratio 等 7 項術語)
  - `wiki/index.md` (更新導航索引與來源列表)
- **更新摘要**:
  - 成功引入半導體薄膜沉積與蝕刻設備龍頭 Lam Research 官方技術文獻，完成 SHA256 驗證並登記於 Manifest。
  - 正式解決 Batch 01 中標記為 NEEDS_REVIEW 的「原子層沉積（ALD）」與「乾蝕刻 RIE 物理/化學/選擇比機制」，提供完整的第一手官方文獻證據，狀態成功提升為 PASS。
  - 保留 6 項非 Lam Research 範疇的待查項目（如西門子法、柴式長晶、CMP、退火、銅雙鑲嵌製程命名與 EUV 波長數值），持續標註為 NEEDS_REVIEW 待後續批次官方資料補強。

### [2026-11-23 10:50:00] - Batch 02 提交前局部修正：ALD 保形性精確化與銅雙鑲嵌術語統一 (Local Patch)
- **操作類型**: `LOCAL_PATCH`
- **影響檔案**:
  - `wiki/processes/03-thin-film-deposition.md`
  - `wiki/processes/07-metallization.md`
  - `wiki/glossary/terms.md`
  - `wiki/index.md`
- **更新摘要**:
  - 修正 ALD 保形性敘述：由宣稱「100% 完美保形」修訂為符合 Lam Research SRC-003 原文之「ALD 具有優異保形性，可在適當製程條件下形成高度均勻薄膜」，避免對所有製程作絕對宣稱。
  - 統一技術用語：將「銅雙波紋製程」全面修正為台灣半導體產業標準術語「銅雙鑲嵌製程（Dual Damascene）」。
