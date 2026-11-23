# AGENTS.md - Sand-to-Silicon LLM Wiki 指南與操作手冊

本文件為所有在此專案中運行的 AI Agent（以下簡稱 Agent）之最高操作準則。後續所有資料攝入（Ingest）、Wiki 維護（Wiki Maintenance）、一致性檢驗（Lint）、簡報生成（Slide Generation）以及流程排程，皆必須嚴格遵守本規範。

---

## 一、專案目標與核心原則

### 1.1 專案願景
將「從沙子到晶片：半導體製造」的繁複高科技知識，轉化為結構清晰、互相串連、通俗易懂的 **LLM Wiki**，並以此知識庫為事實基準，產出互動式 HTML 教學簡報，最終發布於 GitHub Pages。

### 1.2 Andrej Karpathy LLM Wiki 模式
本專案採用 Andrej Karpathy 提出的 LLM Wiki 概念（[Andrej Karpathy - LLM Wiki Blueprint Gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)）：
- **知識編譯器模式**：LLM 不是臨時對話的產物，而是將不可變原始文檔（Raw Sources）編譯並持續更新至純文字 Markdown Wiki 的常駐編譯器。
- **知識複利（Knowledge Compounding）**：隨著文獻增加，知識庫透過交叉引用（Cross-referencing）與版本紀錄增量累積，不重複自原始資料拼湊。
- **分層解耦**：
  1. `raw/`：原始文獻儲存層（唯讀、不可變）。
  2. `wiki/`：LLM 編譯知識庫（結構化、原子化 Markdown）。
  3. `website/`：終端展示層（靜態網站與互動簡報）。

### 1.3 核心紀律（紅線）
1. **絕對真實性**：嚴禁虛構數據、假造來源、或無中生有捏造執行成功報告（PASS）。
2. **局部修正原則**：當任一節點或檢查失敗時，僅能對有問題的節點、檔案進行局部修正（Local Patch），嚴禁無差別清除並重新生成整個專案。
3. **保留資料邊界（嚴格區分入庫前與入庫後）**：
   - **入庫前**：從權威官方管道下載或擷取原始文字與資料，確保內容純淨、無雜訊。
   - **入庫後**：一旦存入 `raw/` 即成為不可變原始檔（Immutable Raw Source），計算 SHA256 並登記於 `sources/manifest.json`，嚴禁直接修改、覆寫或刪除。所有衍生的觀點、白話解說與結構化內容均只能撰寫至 `wiki/`。
4. **Git 提交限制與人工確認關卡**：Agent 僅負責檔案的變更與檢查，**嚴禁自行執行 `git commit`**；未經人工同意，不得自動進入下一階段（如開始 Ingest），所有關鍵階段切換均須等待人類審核並由人類提交 Git Commit。

---

## 二、目標讀者與文字風格規範

1. **目標讀者**：
   - 零半導體基礎的一般大眾、國高中學生、非理工科系學習者。
2. **語言與用詞**：
   - 全文使用**繁體中文（台灣習慣用語）**，如「晶圓」、「微影」、「蝕刻」、「摻雜」、「封裝」。
   - **英文專業術語保留**：專有名詞首次出現必須保留英文全稱與縮寫，如「極紫外光微影（Extreme Ultraviolet Lithography, EUV）」。
   - **白話生活化比喻（Metaphors）**：首次出現抽象概念時，必須提供直覺比喻。例如：
     - *微影*：類似傳統沖洗相片或精密投影片印刷，用光將電路圖案印在感光塗層上。
     - *蝕刻*：類似雕刻刀或化學防蝕刻雕，將未被保護的區域挖掉，形成立體凹槽。
     - *摻雜*：像是在純水中加入幾滴墨水改變導電性，在純矽晶體中打入雜質原子。
     - *薄膜沉積*：如同以原子為單位噴漆，精準鍍上一層奈米級保護膜或導電膜。

---

## 三、Wiki 結構與 Markdown Frontmatter 規範

所有 `wiki/` 底下的頁面均採用標準 Markdown，並於文件最上方包含 YAML Frontmatter。

### 3.1 目錄分類標準
- `wiki/concepts/`：物理、化學、半導體能帶等底層核心概念（如能隙、純度 99.9999999% 的定義）。
- `wiki/processes/`：八大核心製造流程獨立頁面（矽原料、晶圓製造、薄膜沉積、微影、蝕刻、摻雜、金屬連線、封測）。
- `wiki/equipment/`：關鍵高科技機台與設備架構（如 EUV 微影機、RIE 反應離子蝕刻機、長晶爐等）。
- `wiki/glossary/`：專有名詞對照表、縮寫釋義與易混淆概念釐清。

### 3.2 頁面標準 Frontmatter 格式
```markdown
---
title: "頁面繁體中文標題"
english_title: "English Title"
category: "concepts | processes | equipment | glossary"
tags: ["關鍵字1", "關鍵字2"]
sources:
  - "SOURCE_ID_001"
  - "SOURCE_ID_002"
last_updated: "YYYY-MM-DD"
prerequisites:
  - "../concepts/prerequisite-page.md"
related_pages:
  - "../processes/related-process.md"
---
```

### 3.3 內容區塊結構建議
1. **白話摘要（TL;DR / Analogy）**：一句話白話定義 + 生活比喻。
2. **核心原理與科學機制**：步驟化說明、物理/化學反應原理。
3. **關鍵設備與參數**：工作條件（溫度、真空度、奈米級精度）。
4. **上下游製程關聯**：前置製程是什麼？完成後交由何種製程？
5. **常見迷思與 FAQ**：釐清初學者容易誤解之處。
6. **參考資料來源（Citations）**：指向 `sources/manifest.json` 對應的資料來源。

---

## 四、Agent 核心操作流程（Standard Operating Procedures）

### 4.1 Ingest（分批資料攝入流程）
為符合嚴謹工程與教學實踐原則，資料攝入採**分批進行（Batch Ingest）**模式（每批次引入 1～2 篇權威資料），以降低單次異動風險並便於人類逐步審查與 Commit。

當後續被指派將權威資料（如 ASML, Intel, Lam Research, imec 官方技術手冊或白皮書）引入專案時，每批次必須遵循以下步驟：
1. **入庫前擷取與驗證**：從官方來源獲取技術文獻，確保內容真實、無農場文雜訊。
2. **入庫並固化（Immutable Storage）**：將原始文字/PDF 放置於 `raw/` 目錄。一旦入庫即不可變更或覆寫。
3. **登錄 Manifest**：在 `sources/manifest.json` 中登記：
   - `id`: 唯一識別碼（如 `ASML_EUV_BASICS_2024`）
   - `title`: 資料標題
   - `author_organization`: 來源機構（如 ASML）
   - `url_or_filepath`: 來源網址或檔案路徑
   - `verification_date`: 驗證日期
   - `checksum`: 原始檔案雜湊值（SHA256）
4. **概念提取與比對**：
   - 檢索 `wiki/` 現有頁面，判斷應新增獨立頁面或是擴充現有頁面。
5. **增量編譯頁面與維護連結**：
   - 寫入或修訂 Markdown 內容，維護雙向連結，加入白話比喻。
6. **登記 Wiki 變更紀錄**：
   - 於 `wiki/log.md` 結尾新增一筆記錄，載明更新時間、對應來源、修改之頁面與變更重點。
7. **更新入口索引**：
   - 同步檢視並更新 `wiki/index.md`，維持目錄架構完整。
8. **執行每批檢查（Batch Ingest Check）**：
   - 檢驗本批來源真實性、Checksum、Manifest 與 Wiki 更新結果。
9. **暫停並等待人工審核（Human Approval Gate）**：
   - 每一批通過後**必須暫停**，等待人類檢查確認並執行 Git Commit 後，方可進入下一批。
10. **最終覆蓋率檢查（Final Coverage Check）**：
    - 當累計攝入 6～8 篇權威文獻後，驗證八大製造流程是否已完整覆蓋。

### 4.2 Query（問答與檢索流程）
1. 優先以 `wiki/` 知識庫為依據進行檢索與綜合。
2. 若知識庫尚未涵蓋，應明確告知「目前 Wiki 尚未編譯此主題」，並可指引需要 ingest 哪類資料，不可盲目臆測。
3. 回答時應明確標註引用之 Wiki 頁面檔案路徑。

### 4.3 Lint（一致性與品質檢查流程）
每次 Wiki 發生實質變更後，Agent 必須執行 Lint 檢查，並將結果輸出至 `evidence/lint/`：
1. **死連結檢查（Broken Link Detection）**：檢查所有 Markdown 檔案中的相對連結 `[...](...)`，確保目標檔案真實存在。
2. **孤立頁面檢查（Orphan Page Detection）**：確認每個頁面均有被 `wiki/index.md` 或其他頁面引用。
3. **術語一致性比對**：確保全專案專有名詞（如 EUV、ALD 等）翻譯與拼寫一致。
4. **初學者友善度檢驗**：檢查首次出現之專有名詞是否有白話說明與生活比喻。
5. **來源追溯檢查**：確認每個頁面 Frontmatter 之 sources 均於 `sources/manifest.json` 有登錄。

### 4.4 Presentation Generation（簡報生成流程 - 未來階段規範）
1. 必須以 `wiki/` 內容為唯一知識輸入源。
2. 生成 10～12 頁純前端（HTML/CSS/JS）互動簡報，放置於 `website/slides/`。
3. 簡報需包含：
   - 視覺化漸進動畫（CSS 轉場或 SVG 動畫）
   - 可互動點擊展開說明的製程示意圖
   - 閱讀進度條與鍵盤快捷鍵（`←` / `→` / `Space`）
   - 每一關鍵章節附帶 1～2 題初學者互動小測驗（點擊即時反饋解析）

---

## 五、分層 Workflow Graph 與錯誤處理原則

專案執行依循 `workflow/graph.md` 所定義之具備局部小迴圈的有向工作流程圖（Directed Workflow Graph with Localized Cycles）。

> [!IMPORTANT]
> **規格與實際執行之區分**：`workflow/graph.md` 為系統的**設計規格與執行藍圖**，流程圖的存在絕不等於所有節點已經實際執行完畢。各階段（Ingest、Query、Lint、Slides）皆必須依照順序推進，並提出可被查驗的真實執行證據。
> 
> **人工確認關卡（Human Approval Gate）**：
> 初始化流程規範為：`N01 初始化` ➔ `C01 檢查` ➔ `HUMAN_APPROVAL` ➔ `人工 Git Commit` ➔ `下一階段`。未經人類明確授權與完成 Commit 前，Agent 嚴禁自動跨越至下一階段（如自動開始 Ingest）。

### 5.1 檢查節點與狀態定義
每個關鍵步驟完成後，必須經過對應的獨立檢查節點（Inspection Node）：
- `PASS`：所有檢驗項目均符合標準，允許前進至下一節點或等待人工確認。
- `FAIL`：發現不符合項目（如死連結、名詞不一致、遺漏來源等），觸發局部修正小迴圈。
- `NEEDS_REVIEW`：連續重試達上限（3 次），或遇到重大知識衝突、指令矛盾，立即停止並請求人類介入。

### 5.2 局部修正與小迴圈（Local Loop）機制
```text
[執行節點] ───> [檢查節點] ──PASS──> [HUMAN_APPROVAL / 下一節點]
      ▲              │
      │             FAIL (Retry < 3)
      └──[局部修正]───┘
```
1. **最大重試次數**：單一檢查節點失敗後，局部修正小迴圈**最多允許 3 次嘗試**（RetryCount: 1, 2, 3）。
2. **實質重新執行與查驗**：每次局部修正後，**必須重新執行與該問題相關之必要操作及檢查，嚴禁僅直接將狀態竄改為 PASS**。
3. **修正歷程完整記錄**：每一次修正嘗試，均必須在 `logs/execution_log.md` 忠實記錄：
   - 發生錯誤的節點 (Failed Node)
   - 錯誤原因 (Error Reason)
   - 修正前內容 (Before Fix)
   - 修正動作 (Fix Action)
   - 修正後結果 (After Fix Result)
   - 重試次數 (Retry Count)
   - 實際驗證證據 (Actual Verification Evidence)
4. **升級停止條件**：若連續 3 次修正後仍未判定為 `PASS`，狀態自動轉為 `NEEDS_REVIEW`，流程即刻中斷並輸出問題診斷報告，等待人類確認。
5. **嚴禁事項**：不可因為局部錯誤而刪除整個 `wiki/` 或重設專案。

---

## 六、真實執行紀錄規範（Audit Logging）

每次 Agent 執行任何重要節點動作（包括初始化、分批 Ingest、Lint、局部修正等），均必須於 `logs/execution_log.md` 留下真實紀錄。

> [!NOTE]
> **紀錄作業規範**：本專案日誌採追加寫入（Append-only）之工作規範，並透過 Git 嚴格追蹤版本異動與變更歷程；嚴禁人為隱瞞錯誤或造假紀錄（一般純文字 Markdown 檔案在技術上並非密碼學不可竄改，因此以 Git 歷程與實際產出的證據檔案為核驗基準）。

每一筆日誌紀錄包含以下核心欄位：
1. **Timestamp**（執行時間，ISO-8601 或本地時間戳記）
2. **Node**（執行的 Workflow 節點名稱）
3. **Input**（該節點接收的輸入參數、檔案路徑或來源）
4. **Output**（該節點產生的成果、異動檔案列表）
5. **Status**（`PASS` / `FAIL` / `NEEDS_REVIEW`）
6. **RetryCount**（當前迴圈重試次數，0～3）
7. **ErrorReason**（若 FAIL，具體說明錯誤細節；PASS 則填 `None`）
8. **FixApplied**（包含修正前、修正動作、修正後之說明；無則填 `None`）
9. **EvidencePath**（對應的檢驗證據檔案路徑，如 `evidence/lint/...`）
