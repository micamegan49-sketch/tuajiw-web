#!/bin/bash
# ซิงค์แอปตัวจิ๋วล่าสุดจาก ~/mom-baby มาเป็นหน้าแรกของ tuajiw.com (root)
# รันทุกครั้งที่อัปเดตแอป แล้ว git add -A && commit && push
set -e
cd "$(dirname "$0")"
SRC="$HOME/mom-baby"
# ลบไฟล์แอปเก่าที่ root (เก็บ CNAME/.nojekyll/ios/sync-app.sh/.git ไว้)
rm -rf css js icons img index.html manifest.json sw.js privacy.html support.html
cp -R "$SRC/index.html" "$SRC/manifest.json" "$SRC/sw.js" \
      "$SRC/css" "$SRC/js" "$SRC/icons" "$SRC/img" .
for f in privacy.html support.html; do [ -f "$SRC/$f" ] && cp "$SRC/$f" .; done
echo "✅ synced app -> tuajiw.com (root) — $(find css js icons img index.html manifest.json sw.js -type f 2>/dev/null | wc -l | tr -d ' ') ไฟล์"
