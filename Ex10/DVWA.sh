docker --version
sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

groups

sudo usermod -aG docker $USER
newgrp docker

groups

docker ps

docker run --rm -it -p 80:80 vulnerables/web-dvwa
