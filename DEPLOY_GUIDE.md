# 套用更新與 GitHub Pages 發布教學（Windows）

## 1. 安全套用

1. 先備份目前 `C:\Users\MB205\Downloads\Sand-to-Silicon-Wiki` 資料夾。
2. 將這份 **補完 ZIP** 解壓縮。ZIP 第一層是 `Sand-to-Silicon-Wiki/`。
3. 把解壓縮後的檔案複製到原本的 **同名專案資料夾**，選擇合併並覆寫同名專案檔。**不要刪除原本的 `.git/`，也不要刪除原本的 `raw/`**。
4. 這份補完 ZIP 未含第三方原始 HTML、`.git/`、臨時打包檔。原本本機六份 `raw/` HTML 應繼續保留。

## 2. 本機先開啟

直接雙擊 `index.html`（根目錄入口），或開啟 `website/index.html`；點「開始互動簡報」進入 `website/slides/index.html`。網站不依賴網路框架、API Key 或 AI 額度。

## 3. 確認 Git 變更再提交

在 Antigravity 的 Terminal 逐行執行：

```powershell
git status
git add .
git diff --cached --check
git diff --cached --stat
git ls-files raw
git commit -m "feat: build semiconductor wiki teaching website"
```

如果 `git ls-files raw` 只顯示 `.gitkeep`，沒有列出第三方下載的 HTML，即符合排除目標。若發現未預期的檔案，先不要提交。

## 4. GitHub Repository / Pages

1. 開啟 GitHub 建立 **Public Repository**，名稱建議 `Sand-to-Silicon-Wiki`（已有 Repository 就用原本的）。
2. 在原本本機專案執行（只有首次連線遠端時才需設定 origin）：

```powershell
git remote -v
# 若尚未設定 origin，改用自己的實際 Repository URL：
git remote add origin https://github.com/你的帳號/Sand-to-Silicon-Wiki.git
git push -u origin main
```

3. GitHub Repository → **Settings** → **Pages** → **Build and deployment**。
4. Source 選擇 **Deploy from a branch**、Branch 選 **main**、Folder 選 **/(root)**，儲存。
5. 因根目錄 `index.html` 會導向 `website/index.html`，網址通常是 `https://你的帳號.github.io/Sand-to-Silicon-Wiki/`。實際網址以 GitHub Pages 顯示為準。

## 5. 交作業前逐項驗收

- 開啟 GitHub Pages 首頁能看到八大製程。
- 進入 Wiki，每個知識頁都能點擊；搜尋欄可篩選。
- 進入簡報，上一頁、下一頁及鍵盤左右鍵正常，12 頁全部可看。
- 至少測試薄膜堆疊、微影、蝕刻、摻雜、封裝步驟與五題小測驗。
- 在「資料來源」看見 SRC-001 至 SRC-006 的官方連結。
- 在「工作流程」看到分層 Graph、小迴圈與人工確認。
- 在「檢查紀錄」看到 C21 的 NEEDS_REVIEW 和修正前後對照。

## 6. 繳交內容參考

標題依老師規定填寫：`學校 學號 系級 姓名 從沙子到晶片`。繳交內文請包含 Wiki 主題、Repository/ Wiki 網址、簡報網址、Graph 說明、真實執行與檢查紀錄、發現 C21 問題後的反思。

**不能將尚未發布的網址寫成已發布，也不能將本次 ChatGPT 協助修補誤標為 Antigravity 執行。**
