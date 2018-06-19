version="3-5.2.0"

apt update

#Anaconda3 5.0.1
if [ ! -e "/vagrant/Anaconda$version-Linux-x86_64.sh" ]; then
  cd /vagrant
  wget -q "https://repo.continuum.io/archive/Anaconda$version-Linux-x86_64.sh"
fi
su -l -c "bash /vagrant/Anaconda$version-Linux-x86_64.sh -b -p /home/vagrant/anaconda3" vagrant
