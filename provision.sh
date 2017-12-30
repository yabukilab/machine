#Timezone
timedatectl set-timezone Asia/Tokyo

echo 'Acquire::http::Proxy "http://10.100.192.4:3142/";' > /etc/apt/apt.conf.d/02proxy

#apt update

echo "alias ls='ls -F'" >> /home/ubuntu/.bashrc
echo '. ~/.bashrc' >> /home/ubuntu/.bash_profile
chown ubuntu:ubuntu /home/ubuntu/.bash_profile
chown ubuntu:ubuntu /home/ubuntu/.bashrc
