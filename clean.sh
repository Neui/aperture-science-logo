#!/bin/sh

. ./config.sh

rm -f -- "$OUT.png" "$OUT_GLOW.png"
rm -f -- "$OUT_16_PREFIX$OUT$OUT_16_POSTFIX.png"
rm -f -- "$OUT_16_PREFIX$OUT_GLOW$OUT_16_POSTFIX.png"
rm -f -- "$THEME_PLYMOUTH"
rm -f -- *.png *.svg *.jpg *.jpeg *.plymouth
