#/bin/sh

THEME_NAME="Aperture Science Logo"
THEME_NAMEF="aperture-science-logo"
THEME_DESC="Aperture Science Logo"
# Plymouth expects to be themename/themename.plymouth, for some reason...
THEME_PLYMOUTH="$THEME_NAMEF.plymouth"
THEME_SCRIPT="$THEME_NAMEF.script"
THEME_GRUB="$THEME_NAMEF.grub"
# For now, use PWD for the theme dir
THEME_DIR="$PWD"
PLYMOUTH_DIR=""

for DIR in "$PLYMOUTH_THEMES" "/usr/share/plymouth/themes" \
	"/lib/plymouth/themes"; do
	test -d "$DIR" && PLYMOUTH_DIR="$DIR"
done

THEME_PLYMOUTH="$(basename "$THEME_DIR").plymouth"



OUT="bg"
OUT_GLOW="$OUT""_glow"

OUT_16_PREFIX=""
OUT_16_POSTFIX="_16"

LOGO_URL='https://upload.wikimedia.org/wikipedia/commons/e/ee/Aperture_Science.svg'
LOGO="$(basename "$LOGO_URL")"
