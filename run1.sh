##install ubuntu
sudo apt update
sudo apt full-upgrade -y
#sudo apt autoremove

##raspi-config
sudo apt install raspi-config libsensors-config libsensors5 -y
#sudo raspi-config #fan
#sudo nano /boot/firmware/config.txt #son satır derece ayarı

##set swap
####https://linuxhint.com/increase-swap-raspberry-pi/
#sudo apt install dphys-swapfile
#sudo nano /etc/dphys-swapfile
#CONF_SWAPFACTOR=1	
#CONF_MAXSWAP=8192
#sudo dphys-swapfile swapon

#https://linuxhint.com/add-swap-space-ubuntu-22-04/
sudo swapon --show
sudo fallocate -l 8G /var/swap
ls -lh /var/swap
sudo chmod 600 /var/swap
ls -lh /var/swap
sudo mkswap /var/swap
sudo swapon /var/swap
sudo swapon --show
sudo cp /etc/fstab /etc/fstab.bak
echo '/var/swap none swap sw 0 0' | sudo tee -a /etc/fstab
cat /proc/sys/vm/swappiness
cat /proc/sys/vm/vfs_cache_pressure
#sudo sysctl vm.swappiness=20
#sudo sysctl vm.vfs_cache_pressure=40
#echo 'vm.swappiness=20' | sudo tee -a /etc/sysctl.conf
#echo 'vm.vfs_cache_pressure=40' | sudo tee -a /etc/sysctl.conf


##remove multipath
#https://waldorf.waveform.org.uk/2022/making-jammy-less-dodgy.html
#sudo sed -i -e 's/$/ multipath=off/' /boot/firmware/cmdline.txt
#sudo reboot
