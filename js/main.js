/* ============================
   À LA LUNE — Main JS
   ============================ */

/* ---------- Nav: scroll + mobile ---------- */
(function () {
  const nav = document.querySelector('.site-nav');
  const toggle = document.querySelector('.nav-toggle');
  const drawer = document.querySelector('.nav-drawer');
  const overlay = document.querySelector('.nav-overlay');
  const drawerClose = document.querySelector('.drawer-close');

  if (nav) {
    window.addEventListener('scroll', () => {
      nav.classList.toggle('scrolled', window.scrollY > 40);
    });
    // Mark active link
    const links = nav.querySelectorAll('.nav-links a');
    links.forEach(l => {
      if (l.href === location.href) l.classList.add('active');
    });
  }

  function openDrawer() {
    drawer?.classList.add('open');
    overlay?.classList.add('show');
    document.body.style.overflow = 'hidden';
  }
  function closeDrawer() {
    drawer?.classList.remove('open');
    overlay?.classList.remove('show');
    document.body.style.overflow = '';
  }
  toggle?.addEventListener('click', openDrawer);
  drawerClose?.addEventListener('click', closeDrawer);
  overlay?.addEventListener('click', closeDrawer);
})();

/* ---------- Hero BG lazy-load ---------- */
(function () {
  const heroBg = document.querySelector('.hero-bg[data-src]');
  if (!heroBg) return;
  const img = new Image();
  img.onload = () => {
    heroBg.style.backgroundImage = `url('${heroBg.dataset.src}')`;
    heroBg.classList.add('loaded');
  };
  img.src = heroBg.dataset.src;
})();

/* ---------- Fade-up on scroll ---------- */
(function () {
  const items = document.querySelectorAll('.fade-up');
  if (!items.length) return;
  const io = new IntersectionObserver(
    (entries) => entries.forEach(e => {
      if (e.isIntersecting) { e.target.classList.add('visible'); io.unobserve(e.target); }
    }),
    { threshold: 0.12 }
  );
  items.forEach(el => io.observe(el));
})();

/* ---------- Menu tabs ---------- */
(function () {
  const catBtns = document.querySelectorAll('.menu-cat-btn');
  const sections = document.querySelectorAll('.menu-section');
  if (!catBtns.length) return;

  catBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      catBtns.forEach(b => b.classList.remove('active'));
      sections.forEach(s => s.classList.remove('active'));
      btn.classList.add('active');
      const target = document.getElementById(btn.dataset.target);
      if (target) target.classList.add('active');
    });
  });
})();

/* ---------- Gallery lightbox ---------- */
(function () {
  const lb = document.querySelector('.lightbox');
  if (!lb) return;
  const lbImg = lb.querySelector('img');
  const lbClose = lb.querySelector('.lb-close');
  const lbPrev = lb.querySelector('.lb-prev');
  const lbNext = lb.querySelector('.lb-next');
  const items = Array.from(document.querySelectorAll('.gm-item img, .gallery-grid .g-item img'));
  let current = 0;

  function open(index) {
    current = index;
    lbImg.src = items[index].src;
    lb.classList.add('open');
    document.body.style.overflow = 'hidden';
  }
  function close() {
    lb.classList.remove('open');
    document.body.style.overflow = '';
  }
  function prev() { open((current - 1 + items.length) % items.length); }
  function next() { open((current + 1) % items.length); }

  items.forEach((img, i) => {
    img.parentElement.addEventListener('click', () => open(i));
  });
  lbClose?.addEventListener('click', close);
  lbPrev?.addEventListener('click', prev);
  lbNext?.addEventListener('click', next);
  lb.addEventListener('click', e => { if (e.target === lb) close(); });
  document.addEventListener('keydown', e => {
    if (!lb.classList.contains('open')) return;
    if (e.key === 'Escape') close();
    if (e.key === 'ArrowLeft') prev();
    if (e.key === 'ArrowRight') next();
  });
})();

/* ---------- Reservation form (basic steps) ---------- */
(function () {
  const form = document.querySelector('.res-form');
  if (!form) return;
  form.addEventListener('submit', e => {
    e.preventDefault();
    const success = form.querySelector('.form-success');
    if (success) {
      form.style.display = 'none';
      success.style.display = 'block';
    }
  });
})();
