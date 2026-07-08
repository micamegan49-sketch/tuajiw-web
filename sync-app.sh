#!/bin/bash
# ซิงค์แอปตัวจิ๋วล่าสุดจาก ~/mom-baby มาไว้ที่ tuajiw.com/app/
# รันทุกครั้งที่อัปเดตแอป แล้ว git add app && commit && push
set -e
cd "$(dirname "$0")"
SRC="$HOME/mom-baby"
rm -rf app && mkdir -p app
cp -R "$SRC/index.html" "$SRC/manifest.json" "$SRC/sw.js" \
      "$SRC/css" "$SRC/js" "$SRC/icons" "$SRC/img" app/
for f in privacy.html support.html; do [ -f "$SRC/$f" ] && cp "$SRC/$f" app/; done
echo "✅ synced app -> ./app/ ($(find app -type f | wc -l | tr -d ' ') ไฟล์)"
