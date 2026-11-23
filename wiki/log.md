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
