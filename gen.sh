#/bin/sh

. ./config.sh

# Generate .plymouth
echo "[Plymouth Theme]" > "$THEME_PLYMOUTH"
echo "Name=$THEME_NAME" >> "$THEME_PLYMOUTH"
echo "Description=$THEME_DESC" >> "$THEME_PLYMOUTH"
echo "ModuleName=script" >> "$THEME_PLYMOUTH"
echo "" >> "$THEME_PLYMOUTH"
echo "[script]" >> "$THEME_PLYMOUTH"
echo "ImageDir=$THEME_DIR" >> "$THEME_PLYMOUTH"
echo "ScriptFile=$THEME_DIR/$THEME_SCRIPT" >> "$THEME_PLYMOUTH"

# Generate logo
wget -q "$LOGO_URL" -O "$LOGO"

convert "$LOGO" -background transparent -gravity center -extent 110% "$OUT.png"
convert "$OUT.png" \( -gamma 1.9 -blur 0x10 \) \
		"$OUT.png" -composite "$OUT_GLOW.png"
#composite -gravity center "$OUT.png" "$OUT_GLOW.png" "$OUT_GLOW.png"

for FILE in "$OUT" "$OUT_GLOW"; do
	convert "$FILE.png" +dither -colors 65536 \
		"$OUT_16_PREFIX$FILE$OUT_16_POSTFIX.png"
done
