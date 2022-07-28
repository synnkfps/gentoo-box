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
mount /dev/sda3 /mnt/gentoo;
echo "Done!";
# to do: ask if it's correct, if not, ask hour minutes, day month and year
echo "System date: $(date) (may be inaccurate)";
echo "cd-ing to /mnt/gentoo";
cd /mnt/boot;
echo "Done! Please download stage3 openrc";

links https://www.gentoo.org/downloads/mirrors/

echo "Input any key to proceed... (press enter)";
read u
echo "What is the name of the stage3 file? (write 'stage' then press tab)";
read stagename
echo "Unpacking stage3...";
tar xpvf $stagename --xattrs-include='*.*' --numeric-owner;
echo "Done!";
