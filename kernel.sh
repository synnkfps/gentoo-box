echo "Chrooting";
env-update && source /etc/profile && export PS1="(chroot) ${PS1}";

echo "Installing firmware and sources";
emerge --ask sys-kernel/linux-firmware && emerge --ask sys-kernel/gentoo-sources;
