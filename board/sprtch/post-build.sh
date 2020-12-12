#!/bin/sh

set -u
set -e

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
	grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab ||
		sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
fi

wpa_passphrase "$(pass sprtch_home_ssid)" "$(pass sprtch_home_pass)" >>"${TARGET_DIR}/etc/wpa_supplicant.conf"
wpa_passphrase "$(pass sprtch_sprtch_ssid)" "$(pass sprtch_sprtch_pass)" >>"${TARGET_DIR}/etc/wpa_supplicant.conf"
