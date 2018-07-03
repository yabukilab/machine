#Timezone
timedatectl set-timezone Asia/Tokyo

echo 'Acquire::http::Proxy "http://10.100.192.4:3142/";' > /etc/apt/apt.conf.d/02proxy

#apt update

echo "alias ls='ls -F'" >> /home/vagrant/.bashrc
echo "export PS1='\u@\h:\w$ '" >> /home/vagrant/.bashrc
chown vagrant:vagrant /home/vagrant/.bashrc

echo '. ~/.bashrc' >> /home/vagrant/.bash_profile
chown vagrant:vagrant /home/vagrant/.bash_profile

#for instant execution
echo "alias R='R --no-save'" >> /home/vagrant/.bashrc
echo "alias jnote='jupyter notebook --no-browser --ip=0.0.0.0'" >> /home/vagrant/.bashrc
echo "alias jlab='jupyter lab --no-browser --ip=0.0.0.0'" >> /home/vagrant/.bashrc
echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> /home/vagrant/.bash_profile
