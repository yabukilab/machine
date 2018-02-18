#Anaconda3 5.0.1
if [ ! -e '/vagrant/Anaconda3-5.1.0-Linux-x86_64.sh' ]; then
  cd /vagrant
  wget -q https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh
fi
su -l -c 'bash /vagrant/Anaconda3-5.1.0-Linux-x86_64.sh -b -p /home/vagrant/anaconda3' vagrant
