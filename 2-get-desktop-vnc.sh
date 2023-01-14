##vnc önce lubuntu
sudo apt install libraspberrypi0 -y
sudo apt install libice6 libsm6 libxtst6 -y
sudo apt install lightdm -y
sudo apt install lubuntu-desktop -y
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
