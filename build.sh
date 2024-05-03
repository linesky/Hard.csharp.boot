printf "\x1bc\x1b[43;37m building...\n"
dd if=/dev/zero of="new.img" bs=143k count=10
chmod 777 new.img
sudo mkfs.vfat -n 'BLUE' -S 512 -f 2 -F 12 "new.img"
chmod 777 new.img
