#Timezone
timedatectl set-timezone Asia/Tokyo

echo 'Acquire::http::Proxy "http://10.100.192.4:3142/";' > /etc/apt/apt.conf.d/02proxy

#apt update

echo "alias ls='ls -F'" >> /home/ubuntu/.bashrc
echo "alias R='R --no-save'" >> /home/ubuntu/.bashrc
echo "alias jn='jupyter notebook --no-browser --ip=0.0.0.0'" >> /home/ubuntu/.bashrc
chown ubuntu:ubuntu /home/ubuntu/.bashrc

echo '. ~/.bashrc' >> /home/ubuntu/.bash_profile
echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> /home/ubuntu/.bash_profile
chown ubuntu:ubuntu /home/ubuntu/.bash_profile

echo "options(repos = 'https://cloud.r-project.org/')" >> /home/ubuntu/.Rprofile
chown ubuntu:ubuntu /home/ubuntu/.Rprofile
