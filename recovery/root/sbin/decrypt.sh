#!/sbin/sh

# Setup mount point for firmware
if [ ! -d "/firmware" ]; then
	mkdir "/firmware"
	chown system:system "/firmware"
	chmod 0771 "/firmware"
fi

# Mount fimrware for decrypt
if [ ! -d "/firmware/image" ]; then
	mount -t vfat -o ro,shortname=lower,uid=1000,gid=1000,dmask=227,fmask=337 /dev/block/platform/msm_sdcc.1/by-name/modem /firmware
fi

/sbin/qseecomd
