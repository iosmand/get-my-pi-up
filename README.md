# get-my-pi-up
ubuntu server 22.04 LTS home lab setup

```
##install ubuntu
sudo apt update
sudo apt full-upgrade -y
#sudo apt autoremove

##raspi-config
sudo apt install raspi-config libsensors-config libsensors5 -y
sudo apt install -y uidmap apparmor jq wget curl udisks2 libglib2.0-bin network-manager dbus lsb-release systemd-journal-remote
#sudo raspi-config #fan
echo 'dtoverlay=gpio-fan,gpiopin=14,temp=45000' | sudo tee -a /boot/firmware/config.txt
echo 'hdmi_force_hotplug=1' | sudo tee -a /boot/firmware/config.txt
echo 'hdmi_group=2' | sudo tee -a /boot/firmware/config.txt
echo 'hdmi_mode=82' | sudo tee -a /boot/firmware/config.txt
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
sudo sed -i -e 's/$/ multipath=off/' /boot/firmware/cmdline.txt
sudo reboot
```

```
#mkdir ~/setup
#cd ~/setup
##get-docker
curl -fsSL https://get.docker.com -o get-docker.sh
DRY_RUN=1
sudo sh ./get-docker.sh
dockerd-rootless-setuptool.sh install


##portainer
#https://pimylifeup.com/raspberry-pi-portainer/
sudo docker run -d -p 9000:9000 -p 9443:9443 -p 8000:8000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest


##install hass
sudo dpkg -i ./hass/os-agent_1.4.1_linux_aarch64.deb
sudo dpkg -i ./hass/supervised-installer/homeassistant-supervised.deb
sudo reboot
```

```
##vnc önce lubuntu
sudo apt install libraspberrypi0 -y
sudo apt install libice6 libsm6 libxtst6 -y
sudo apt install lightdm -y
sudo apt install --install-recommends --install-suggests lubuntu-desktop -y
dirr=$(pwd)
cd /usr/lib/aarch64-linux-gnu
sudo ln libvcos.so /usr/lib/libvcos.so.0
sudo ln libvchiq_arm.so /usr/lib/libvchiq_arm.so.0
sudo ln libbcm_host.so /usr/lib/libbcm_host.so.0
sudo ln libmmal.so /usr/lib/libmmal.so.0
sudo ln libmmal_core.so /usr/lib/libmmal_core.so.0
sudo ln libmmal_components.so /usr/lib/libmmal_components.so.0
sudo ln libmmal_util.so /usr/lib/libmmal_util.so.0
sudo ln libmmal_vc_client.so /usr/lib/libmmal_vc_client.so.0
sudo ln libvcsm.so /usr/lib/libvcsm.so.0
sudo ln libcontainers.so /usr/lib/libcontainers.so.0
cd $dirr
wget https://archive.raspberrypi.org/debian/pool/main/r/realvnc-vnc/realvnc-vnc-server_6.10.1.47571_arm64.deb
sudo dpkg -i realvnc-vnc-server_6.10.1.47571_arm64.deb

sudo systemctl enable vncserver-virtuald.service
sudo systemctl enable vncserver-x11-serviced.service
sudo systemctl start vncserver-virtuald.service
sudo systemctl start vncserver-x11-serviced.service


#https://github.com/mtbiker-s/ubuntu20.10-rpi-install-vnc
#wget https://raw.githubusercontent.com/mtbiker-s/ubuntu20.10-rpi-install-vnc/main/install-real-vnc-server-rpi4-8gb-ubuntu.sh
#wget https://archive.raspberrypi.org/debian/pool/main/r/realvnc-vnc/realvnc-vnc-server_6.10.1.47571_arm64.deb
sudo snap install snap-store chromium
```
