sudo fdisk /dev/sdb
# n, p, <enter>, <enter>
sudo mkfs.ext4 /dev/sdb1
sudo echo "/dev/sdb1 /data ext4 defaults 0 0" >> /etc/fstab
sudo systemctl deamon-reload
sudo mount -a