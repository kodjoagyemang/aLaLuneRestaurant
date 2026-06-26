#!/bin/bash
# ============================================================
# À LA LUNE — Push to GitHub
# Run this once from the alalune/ folder:
#   cd "Website Rebuilds/alalune" && bash push-to-github.sh
# ============================================================

set -e

REPO="https://github.com/kodjoagyemang/aLaLuneRestaurant.git"

echo "Initialising git repository..."
git init
git config user.email "kodjoagyemang@gmail.com"
git config user.name "Kodjo Agyemang"

git remote remove origin 2>/dev/null || true
git remote add origin "$REPO"

git checkout -b main 2>/dev/null || git checkout main

git add -A
git commit -m "feat: initial À La Lune website rebuild

- 5-page static site (index, menu, gallery, reservations, contact)
- Design inspired by ballenacabo.com (dark fine-dining aesthetic)
- Cormorant Garamond + Jost typography
- Fully responsive, mobile hamburger nav
- Gallery lightbox with keyboard navigation
- Tabbed menu system (7 categories)
- Reservation form with success state
- Embedded Google Map
- Scroll-triggered fade-up animations
- All media served from original WordPress CDN URLs
- media/download-media.sh to localise assets"

echo ""
echo "Pushing to GitHub..."
git push -u origin main

echo ""
echo "Done! View at: https://github.com/kodjoagyemang/aLaLuneRestaurant"
