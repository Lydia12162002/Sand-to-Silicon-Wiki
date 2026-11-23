# Sand to Silicon Wiki (從沙子到晶片：半導體製造 LLM Wiki)

本專案旨在建立一個以 **「從沙子到晶片：半導體製造」** 為核心主題的 **LLM 驅動知識庫（LLM Wiki）**，並以此知識庫為單一事實來源（Single Source of Truth），後續製作具備互動效果、動畫、小測驗與流暢說明的 HTML 教學簡報，最終部署於 GitHub Pages。

---

## 專案緣起與核心構想：Karpathy LLM Wiki Pattern

傳統的 RAG（檢索增強生成）架構通常在使用者發問時，才即時切片、搜尋原始文檔（Raw Chunks）並臨時拼湊回答，每次查詢都要重頭理解資料，知識無法跨文檔有效累積。

本專案參考 **Andrej Karpathy 提出的 LLM Wiki 構想**（[GitHub Gist: 442a6bf555914893e9891c11519de94f](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)）：
1. **將 LLM 視為知識編譯器（Compiler）**：AI Agent 負責將不可變的原始資料（Raw Sources）編譯成結構化、原子化、具有雙向超連結的 Markdown Wiki 頁面。
2. **知識複利累積（Knowledge Compounding）**：每次引入新文獻或資料時，Agent 增量更新對應的概念、設備與製程頁面，維護全局索引與變更紀錄，而不是拋棄式對話。
3. **人類與 AI 職責分工**：人類負責挑選高信度的權威來源與制定檢驗規則；AI 負責維護 Wiki 網狀結構、驗證事實一致性與產出視覺化教學教材。

---

## 目標讀者與教學範疇

- **目標讀者**：完全沒有半導體背景的初學者（國高中生、文科背景或非工程領域的一般大眾）。
- **語言規範**：以**繁體中文（台灣習慣用語）**為主，保留關鍵英文術語（如 Photolithography, ALD, CMP 等）；所有英文術語首次出現時均需搭配白話比喻。
- **涵蓋範圍**：
  1. 矽原料提取與提純（砂石到電子級多晶矽）
  2. 晶圓製造（長晶、切片、研磨、拋光）
  3. 薄膜沉積（CVD, PVD, ALD）
  4. 微影技術（光阻塗布、曝光、顯影、DUV 與 EUV）
  5. 蝕刻製程（乾蝕刻、濕蝕刻、RIE、等向性與非等向性）
  6. 摻雜製程（離子佈植、高溫熱擴散）
  7. 金屬連線（銅雙鑲嵌製程、金屬層與通孔）
  8. 封裝與測試（晶圓針測、切割、打線、覆晶、2.5D/3D 先進封裝、成品測試）

---

## 系統目錄架構

```text
Sand-to-Silicon-Wiki/
├── .gitignore               # Git 忽略設定（排除暫存、金鑰與本機環境）
├── README.md                # 專案總覽、架構說明與執行指南
├── AGENTS.md                # AI Agent 規範、操作指南與決策手冊
├── raw/                     # 原始資料存放區（唯讀不可變）
│   ├── articles/            # 論文、官方白皮書與技術文章
│   └── transcripts/         # 影音逐字稿與訪談內容
├── sources/                 # 資料來源中繼資料與清單 (manifest.json)
├── wiki/                    # LLM 編譯與維護的核心知識庫
│   ├── index.md             # Wiki 知識入口與全局概念索引
│   ├── log.md               # Wiki 增量更新紀錄日誌
│   ├── concepts/            # 基本物理、化學與半導體基礎概念
│   ├── processes/           # 八大關鍵製程詳細專頁
│   ├── equipment/           # 關鍵機台設備（如微影機、蝕刻機等）
│   └── glossary/            # 專有名詞辭典與白話對照表
├── workflow/                # 執行流程圖、節點規範與檢驗邏輯
│   └── graph.md             # 分層 Workflow Graph 與失敗返回邏輯
├── logs/                    # 真實執行紀錄與稽核軌跡
│   └── execution_log.md     # 具備 PASS/FAIL/NEEDS_REVIEW 的真實紀錄
├── evidence/                # 驗證證據保存區
│   ├── lint/                # 連結、格式與孤立頁面檢查結果
│   └── consistency/         # 來源一致性比對報告
└── website/                 # 成果網站與教學簡報（未來發布至 GitHub Pages）
    ├── assets/              # 簡報圖檔、樣式與互動腳本
    └── slides/              # 10～12 頁互動式 HTML 簡報
```

---

## 專案執行階段規劃

| 階段 | 階段名稱 | 目前狀態 | 重點工作項目 |
| :--- | :--- | :---: | :--- |
| **Stage 1** | **專案初始化** | **執行中** | 建立目錄骨架、規範文檔（AGENTS.md、README.md）、Graph 定義、執行日誌範本。 |
| **Stage 2** | **分批權威資料攝入 (Batch Ingest)** | 待啟動 | 分批引入（每批 1～2 篇）來自 ASML, Intel, Lam Research, imec 之官方資料，驗證入庫、更新 Wiki 並經人工審查 Commit，累計 6～8 篇完成製程覆蓋。 |
| **Stage 3** | **Wiki 知識編譯與擴展** | 待啟動 | 依序生成概念、製程、設備與詞彙頁面，串接雙向超連結，維護 `wiki/log.md`。 |
| **Stage 4** | **全域 Lint 與一致性校驗** | 待啟動 | 檢查死連結、白話比喻準確度、術語一致性，產出 `evidence/` 證據。 |
| **Stage 5** | **互動 HTML 簡報生成** | 待啟動 | 依據 Wiki 萃取 10～12 頁簡報，加入互動元件、動畫與小測驗。 |
| **Stage 6** | **GitHub Pages 發布** | 待啟動 | 整合 Wiki、簡報、Graph 與紀錄，建置靜態網站並發布。 |

---

## 執行規範摘要

- **不可編造事實**：任何知識點必須能回溯至 `sources/manifest.json` 與 `raw/` 原始檔案。
- **局部修正原則**：遇檢查失敗時，優先針對錯誤節點或檔案進行局部修正，不無條件重跑整個專案。
- **保留原始與衍生界線**：`raw/` 永不修改；所有整理後的見解與頁面皆位於 `wiki/`。
- **版本控制控制**：所有 Git 提交均由人類確認後執行，Agent 不擅自 commit。
