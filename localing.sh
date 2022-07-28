echo "Select á locale";
ls /usr/share/zoneinfo;
read local

echo "$local" > /etc/timezone

locale-gen;

# to do: ask the rest of the locale handbook Page
 echo "Run kernel.sh";
