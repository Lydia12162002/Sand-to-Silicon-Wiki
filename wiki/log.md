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
