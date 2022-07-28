# ask user

@echo "preparing disks, do you want to use the Gentoo Handbook settings?"

read opt
option=echo "$option" | tr "[:upper:]"

if [ "$option" == "y" ]; then
fdisk /dev/sda # to do
elif [ "$option" == "n"]; then
fdisk /dev/sda # to do
fi

echo "Finished fdisk task. Applying filesystems...";
mkfs.vfat -F 32 /dev/sda1;
mkfs.ext4 /dev/sda3;
echo "Done! Activating swap...";
swapon /dev/sda2;
mkswap /dev/sda2;
echo "Done! Mounting boot";
echo "Run mount_stage.sh";
