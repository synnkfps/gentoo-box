# to do: ask if user want default packages or optimized ones 

echo "Emerging world";
emerge --ask --verbose --update --deep --newuse @world;

echo "Nice! Please add the following line to /etc/portage/make.conf;

echo "USE=\"-gtk -gnome qt5 kde dvd alsa cdr\"";
nano -w /etc/portage/make.conf;
echo "USE=\"-gtk -gnome qt5 kde dvd alsa cdr\"";

echo "Setting cpu flags";
emerge --ask app-portage/cpuid2cpuflags;
echo "*/* $(cpuid2cpuflags)" > /etc/portage/package.use/00cpu-flags;

portageq envvar ACCEPT_LICENSE @FREE;
