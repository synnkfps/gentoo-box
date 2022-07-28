# set portage config
mkdir --parents /mnt/gentoo/etc/portage/repos.conf;
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf;
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/;

echo "Done! ;
mount --types proc /proc /mnt/gentoo/proc;
mount --rbind /sys /mnt/gentoo/sys;
mount --make-rslave /mnt/gentoo/sys;
mount --rbind /dev /mnt/gentoo/dev;
mount --make-rslave /mnt/gentoo/dev;
mount --bind /run /mnt/gentoo/run;
mount --make-slave /mnt/gentoo/run 

echo "Done! Chrooting...";
chroot /mnt/gentoo /bin/bash;
source /etc/profile;
export PS1="(chroot) ${PS1}";

echo "Mount
mount /dev/sda1 /boot
