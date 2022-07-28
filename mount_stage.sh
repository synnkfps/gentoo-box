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
echo "Done! ";

# to do: portage make.conf 

mirrorselect -i -o >> /mnt/gentoo/etc/portage/make.conf;
echo "Thank you! boot.sh ";
