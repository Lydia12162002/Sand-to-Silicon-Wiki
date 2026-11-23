document.addEventListener('DOMContentLoaded',()=>{const b=document.getElementById('menuToggle'),n=document.getElementById('globalNav');if(b&&n)b.addEventListener('click',()=>{let open=n.classList.toggle('open');b.setAttribute('aria-expanded',String(open));});const q=document.getElementById('wikiSearch');if(q)q.addEventListener('input',()=>{let v=q.value.trim().toLowerCase();document.querySelectorAll('[data-search]').forEach(e=>{e.hidden=!e.dataset.search.toLowerCase().includes(v);});});});

// Wiki 頁面如由投影片進入，顯示「返回原投影片」並保留 Wiki 站內導覽的來源頁碼。
document.addEventListener('DOMContentLoaded', () => {
  const main = document.querySelector('.wiki-main');
  if (!main) return;
  const fromSlide = new URLSearchParams(window.location.search).get('fromSlide');
  if (!fromSlide || !/^\d{1,2}$/.test(fromSlide)) return;
  const page = Number(fromSlide);
  if (page < 1 || page > 12) return;

  // 使用原站已存在的「互動簡報」導覽連結推算路徑，兼容本機與 GitHub Pages 子路徑。
  const navLink = document.querySelector('.global-nav a[href*="slides/index.html"]');
  if (!navLink) return;
  const backUrl = new URL(navLink.getAttribute('href'), window.location.href);
  backUrl.searchParams.set('slide', String(page));

  const back = document.createElement('a');
  back.className = 'wiki-return-slide';
  back.href = backUrl.href;
  back.textContent = `← 返回互動簡報第 ${String(page).padStart(2, '0')} 頁`;
  back.setAttribute('aria-label', `返回原本的互動簡報第 ${page} 頁`);
  main.insertBefore(back, main.firstChild);

  // 若使用者繼續閱讀其他 Wiki 頁面，維持相同的原始投影片返回位置。
  document.querySelectorAll('a[href]').forEach(link => {
    const href = link.getAttribute('href');
    if (!href || href.startsWith('#')) return;
    let destination;
    try { destination = new URL(href, window.location.href); } catch (_) { return; }
    if (destination.origin !== window.location.origin) return;
    if (!destination.pathname.includes('/wiki/') || !destination.pathname.endsWith('.html')) return;
    destination.searchParams.set('fromSlide', String(page));
    link.href = destination.href;
  });
});
