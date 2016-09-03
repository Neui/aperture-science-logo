#!/bin/sh

. ./config.sh

if [ "$(id -u)" != "0" ]; then
	echo "It looks like you aren't running this as root."
	echo "You may need to be root to correctly install this."
fi


if [ -z "$PLYMOUTH_DIR" ]; then
	echo "Couldn't find plymouth theme dir. " \
		"Things might not install correctly."
	echo "Set PLYMOUTH_THEMES to the correct folder."
fi

./gen.sh

# Add this theme to the update-alternatives thingy
if command -v update-alternatives >/dev/null 2>&1; then
	if [ -z "$PLYMOUTH_DIR" ]; then
		echo "Because of missing plymouth theme dir," \
			" can't install via update-alternatives."
	else
		update-alternatives --install "$PLYMOUTH_DIR/default.plymouth" \
			default.plymouth "$THEME_DIR/$THEME_PLYMOUTH" 100 && \
		echo "To select the theme, run (sudo)" \
			"update-alternatives --config default.plymouth" && \
		echo "And then run (sudo) update-initramfs -u -k all"
	fi
fi

# Maybe replace the default.plymouth with our version, in case
# update-alternatives doesn't exists.
# What about default.grub?..

echo "You may now use ./apply.sh to use it if you are lazy."
