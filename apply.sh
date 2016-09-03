#!/bin/sh

. ./config.sh

if [ "$(id -u)" != "0" ]; then
	echo "It looks like you aren't running this as root."
	echo "You may need to be root to correctly install this."
fi

if command -v update-alternatives >/dev/null 2>&1; then
	# Lets try to autoselect this!
	UA_NUM="$(echo | update-alternatives --config default.plymouth \
		| grep "$THEME_DIR/$THEME_PLYMOUTH" | cut -d " " -f3)"
	echo "$UA_NUM" | update-alternatives --config default.plymouth
	echo "$UA_NUM"
fi

update-initramfs -u -k all
update-grub
