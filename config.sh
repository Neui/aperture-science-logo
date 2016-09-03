#/bin/sh

THEME_NAME="aperture-sience-logo"
THEME_DESC="Aperture Sience Logo"
THEME_PLYMOUTH="$THEME_NAME.plymouth"
THEME_SCRIPT="$THEME_NAME.script"
THEME_GRUB="$THEME_NAME.grub"
# For now, use PWD for the theme dir
THEME_DIR="$PWD"
PLYMOUTH_DIR=""

for DIR in "$PLYMOUTH_THEMES" "/usr/share/plymouth/themes" \
	"/lib/plymouth/themes"; do
	test -d "$DIR" && PLYMOUTH_DIR="$DIR"
done



OUT="bg"
OUT_GLOW="$OUT""_glow"

OUT_16_PREFIX=""
OUT_16_POSTFIX="_16"

LOGO_URL='https://upload.wikimedia.org/wikipedia/commons/e/ee/Aperture_Science.svg'
LOGO="$(basename "$LOGO_URL")"
