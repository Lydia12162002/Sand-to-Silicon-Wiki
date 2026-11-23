---
title: "無塵室與半導體製造環境"
english_title: "Cleanroom Standards and Semiconductor Manufacturing Environment"
category: "concepts"
tags: ["無塵室", "潔淨度", "空氣過濾", "晶圓良率", "HEPA"]
sources:
  - "SRC-001"
  - "SRC-002"
last_updated: "2026-11-23"
prerequisites:
  - "../concepts/nanoscale-and-moore.md"
related_pages:
  - "../processes/02-wafer-manufacturing.md"
  - "../processes/04-photolithography.md"
---

# 無塵室與半導體製造環境 (Cleanroom Standards and Environment)

> [!NOTE]
> **白話摘要與直覺比喻**  
> **一句話定義**：無塵室（Cleanroom）是嚴格控制空氣中微塵粒子數量、溫度、濕度與氣流速度的高科技封閉廠房，是所有晶片製造必不可少的庇護所。  
> **生活化比喻**：在一般房間裡，陽光透過窗戶照進來時，能看見無數灰塵在空中飛舞。如果把一顆電晶體比喻成一隻螞蟻，一粒微塵就相當於一棟從天而降的十層高樓！如果不把這些灰塵徹底清空，晶片在製造過程中就會立即短路報廢。因此，無塵室比醫院手術室還要乾淨數千到數萬倍。

---

## 核心原理與科學機制

依據 imec (SRC-002) 的強調，晶片製造是在 1 至 100 奈米的極限維度下進行。在這樣的奈米尺度下，任何微小的環境污染都會造成災難性的破壞：

### 1. 為什麼微塵是晶片的致命殺手？
- **斷路與短路**：在 [微影](../processes/04-photolithography.md) 或 [蝕刻](../processes/05-etching.md) 製程中，若有一顆 0.5 微米（即 500 奈米）的灰塵落在晶圓上，它就會遮擋光線，導致電路圖案破洞（斷路）或搭接（短路），使整顆晶片徹底失效。
- **化學污染**：空氣中的鹽分、金屬離子、人體皮屑與油汙，會改變純矽的局部半導體特性（非預期摻雜）。

### 2. 無塵室的控管機制
- **正壓與層流氣流（Laminar Flow）**：乾淨空氣從天花板的超高效濾網（HEPA / ULPA）自上而下均勻吹拂，並由地板孔洞吸出，維持微弱的「正壓」，確保開門時空氣只向外流出，外界髒空氣無法滲入。
- **全套防塵衣（Bunny Suit）**：人類是無塵室中最大的污染源（每分鐘脫落數萬個皮屑細胞與飛沫）。工程師必須全身穿著防靜電全罩式無塵衣、配戴護目鏡、口罩、手套與無塵鞋，經過高速吹氣室（Air Shower）去除體表微塵後方能進入。
- **溫濕度恆定**：溫度波動會引起晶圓與金屬光罩的熱脹冷縮（即使微小膨脹幾奈米，就會造成多層微影圖案對準失誤），因此無塵室必須維持恆溫恆濕。

---

## 關鍵技術指標

- **潔淨度等級（Cleanroom Class）**：
  - 醫院手術室：通常為 Class 1,000 至 10,000（每立方英尺空氣中直徑大於 0.5 微米的微粒少於 1,000～10,000 顆）。
  - 先進晶圓廠微影核心區：達到 **Class 1 甚至更嚴格**（每立方英尺空氣中直徑大於 0.5 微米的微粒不得超過 1 顆）。

---

## 上下游製程關聯

- **貫穿全程**：從 [晶圓長晶與切片](../processes/02-wafer-manufacturing.md) 到 [金屬導線連線](../processes/07-metallization.md)，所有的晶圓前端製程（Front-End of Line, FEOL）與後端連線（Back-End of Line, BEOL）皆必須在無塵室內完成，直到 [晶圓封裝與測試](../processes/08-packaging-and-testing.md) 封入保護外殼後，才能移出一般環境。

---

## 常見迷思與 FAQ

> **Q1：無塵室裡面是真空（沒有空氣）的嗎？**  
> **A1**：不是。無塵室內部充滿著極度乾淨且過濾後的正常空氣，工程師可以正常呼吸。只有在特定製程機台內部（如 ASML 的 EUV 微影曝光腔體、PVD 金屬沉積腔體），為了避免光線被空氣分子吸收或金屬氧化，才會抽成高度真空（Vacuum）。

---

## 參考資料來源（Citations）

- `SRC-001`: ASML, *The Basics of Microchips* (2024). [URL](https://www.asml.com/en/technology/all-about-microchips/microchip-basics)
- `SRC-002`: imec, *How Are Microchips Made?* (2024). [URL](https://www.imec-int.com/en/what-we-offer/semiconductor-education-and-workforce-development/microchips/how-are-microchips-made)
