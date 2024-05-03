printf "\x1bc\x1b[43;37m building...\n"
sudo mkdir /mnt/new
mount -t vfat -o loop "new.img" "/mnt/new"
nautilus --browser "/mnt/new"
umount /mnt/new
