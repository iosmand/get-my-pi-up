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
