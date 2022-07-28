6echo "Chrooting";
env-update && source /etc/profile && export PS1="(chroot) ${PS1}";

echo "Installing firmware and sources";
emerge --ask sys-kernel/linux-firmware && emerge --ask sys-kernel/gentoo-sources;

eselect kernel set 1;
emerge --ask sys-apps/pciutils;

cd /usr/src/linux;
make menuconfig;

make && make modules_install;
make install;

echo "What is the name of your kernel folder?";
read kernel_f

find /lib/modules/$kernel_f/ -type f -iname '*.o' -or -iname '*.ko' | less


# to do: write fstab, hostname
emerge --ask net-misc/dhcpcd && emerge --ask --noreplace net-misc/netifrc;

rc-update add dhcpcd default;
rc-service dhcpcd start;

systemctl enable --now dhcpcd;

# to do: set network, hosts
# add to boot
cd /etc/init.d;
ln -s net.lo net.eth0;
rc-update add net.eth0 default;

passwd;
systemctl preset-all;

emerge --ask app-admin/sysklogd;
rc-update add sysklogd default;

# ask if user uses uefi or gpt 
emerge --ask --verbose sys-boot/grub;
echo 'GRUB_PLATFORMS="efi-64"' >> /etc/portage/make.conf;



