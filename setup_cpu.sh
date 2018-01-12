echo 'Installing Docker!'

apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu artful stable"
apt update
apt install -y docker-ce

systemctl enable docker

echo 'Docker installed!'
