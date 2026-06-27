#!/bin/bash
# ============================================================
# À LA LUNE — Download dish images
# Run from the alalune/media/dishes/ folder:
#   cd "Website Rebuilds/alalune/media/dishes" && bash download-dish-images.sh
# ============================================================

DIR="$(cd "$(dirname "$0")" && pwd)"

download() {
  local name="$1"
  local url="$2"
  echo "Downloading $name..."
  curl -L -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)" \
    --referer "${url%/*}/" \
    -o "$DIR/$name" "$url" && echo "  ✓ $name" || echo "  ✗ Failed: $name"
}

download "tuna-tartare.jpg" \
  "https://images.services.kitchenstories.io/lJiC4A0DR2kqBBYcYD6k6it5G6M=/3840x0/filters:quality(85)/images.kitchenstories.io/recipeImages/R1417-photo-final-1.jpg"

download "beef-carpaccio.jpg" \
  "https://tryhiddengems.com/wp-content/uploads/2019/01/BeefCarpaccio_TheLobbyRestaurant3-1.jpg"

download "escargots.jpg" \
  "https://www.saveur.com/uploads/2014/03/photo-doaa-elkady_food-styling_thu-buser_Escargot_V-scaled.jpg"

# ── Manual downloads needed ──────────────────────────────────
# These three require you to save the image manually from the browser:
#
# french-onion-soup.jpg  → https://www.seriouseats.com/french-onion-soup-recipe
#   (right-click the main dish photo → Save Image As → french-onion-soup.jpg)
#
# salmon-gravlax.jpg     → https://www.nytimes.com/2020/02/18/magazine/salmon-gravlax-recipe.html
#   (right-click the main dish photo → Save Image As → salmon-gravlax.jpg)
#
# burrata.jpg            → https://www.tripadvisor.in/Restaurant_Review-g154999-d710157-Reviews-La_Regina-Niagara_on_the_Lake_Ontario.html
#   (find the burrata photo in the gallery → right-click → Save Image As → burrata.jpg)
# ─────────────────────────────────────────────────────────────

echo ""
echo "Done. Files saved to: $DIR"
ls -lh "$DIR"/*.jpg 2>/dev/null || true
