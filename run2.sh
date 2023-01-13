#mkdir ~/setup
#cd ~/setup
sudo apt install -y uidmap apparmor jq wget curl udisks2 libglib2.0-bin network-manager dbus lsb-release systemd-journal-remote
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

##vnc önce lubuntu
sudo apt install --install-recommends --install-suggests lubuntu-desktop -y
sudo apt install libraspberrypi0 -y
sudo apt install libice6 libsm6 libxtst6 -y
sudo apt install lightdm -y
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
#sudo snap install snapd snap-store chromium
