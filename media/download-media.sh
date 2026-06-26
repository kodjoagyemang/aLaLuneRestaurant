#!/bin/bash
# ============================================================
# À LA LUNE — Media Asset Downloader
# Run this script once to download all site images locally.
# Usage: bash download-media.sh
# ============================================================

BASE="https://alalunerestaurant.com/wp-content/uploads"
OUTDIR="$(dirname "$0")"

declare -A FILES=(
  ["Official-Logo.png"]="$BASE/2024/12/Official-Logo.png"
  ["hero-welcome.jpg"]="$BASE/2025/02/a-la-lune-welcome-new.jpg"
  ["about-us.jpg"]="$BASE/2025/02/a-la-lune-about-us.jpg"
  ["reservations-hero.jpg"]="$BASE/2024/12/Lune-Slider_0002_Slide-4.jpg"
  ["dining-ground-floor.jpg"]="$BASE/2024/12/Lune_0001_Option-1-400x400.jpg"
  ["dining-upper-floor.jpg"]="$BASE/2024/12/Lune_0002_Option-2-400x400.jpg"
  ["dining-rooftop.jpg"]="$BASE/2024/12/Lune_0000_Option-3-400x400.jpg"
  ["gallery-01.jpg"]="$BASE/2024/12/la_0000_DSC_7883.jpg"
  ["gallery-02.jpg"]="$BASE/2024/12/la_0001_DSC_7782-1.jpg"
  ["gallery-03.jpg"]="$BASE/2024/12/la_0002_DSC_7771.jpg"
  ["gallery-04.jpg"]="$BASE/2024/12/la_0003_DSC_7757.jpg"
  ["gallery-05.jpg"]="$BASE/2024/12/la_0004_DSC_7749.jpg"
  ["gallery-06.jpg"]="$BASE/2024/12/la_0005_DSC_7738.jpg"
  ["gallery-07.jpg"]="$BASE/2024/12/la_0006_DSC_7733.jpg"
  ["gallery-08.jpg"]="$BASE/2024/12/la_0007_DSC_7730.jpg"
  ["gallery-09.jpg"]="$BASE/2024/12/la_0008_DSC_7725.jpg"
  ["gallery-10.jpg"]="$BASE/2024/12/la_0009_DSC_7716.jpg"
  ["gallery-11.jpg"]="$BASE/2024/12/la_0010_DSC_7711.jpg"
  ["gallery-12.jpg"]="$BASE/2024/12/la_0011_DSC_7709.jpg"
  ["gallery-13.jpg"]="$BASE/2024/12/la_0012_DSC_7690.jpg"
  ["gallery-14.jpg"]="$BASE/2024/12/la_0013_DSC_7687.jpg"
  ["gallery-15.jpg"]="$BASE/2024/12/la_0014_DSC_7673.jpg"
  ["gallery-16.jpg"]="$BASE/2024/12/la_0015_DSC_7648.jpg"
)

echo "Downloading À La Lune media assets..."
echo ""

SUCCESS=0
FAIL=0

for FILENAME in "${!FILES[@]}"; do
  URL="${FILES[$FILENAME]}"
  DEST="$OUTDIR/$FILENAME"

  if curl -s -L --max-time 30 -o "$DEST" "$URL"; then
    SIZE=$(du -sh "$DEST" 2>/dev/null | cut -f1)
    echo "  ✓  $FILENAME  ($SIZE)"
    ((SUCCESS++))
  else
    echo "  ✗  $FILENAME  — FAILED"
    ((FAIL++))
  fi
done

echo ""
echo "Done: $SUCCESS downloaded, $FAIL failed."
echo ""
echo "After running this script, update image src paths in the HTML"
echo "from the full WordPress URL to the local path: media/<filename>"
echo ""
echo "Example:"
echo "  Before: https://alalunerestaurant.com/wp-content/uploads/2024/12/Official-Logo.png"
echo "  After:  media/Official-Logo.png"
