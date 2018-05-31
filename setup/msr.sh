version="3.4.4"

apt update

#gfortran is for caret (kernlab)
apt -y install build-essential gfortran

#Microsoft R Open
if [ ! -e /vagrant/microsoft-r-open-$version.tar.gz ]; then
  cd /vagrant
  wget -q https://mran.blob.core.windows.net/install/mro/$version/microsoft-r-open-$version.tar.gz
fi
tar zxf /vagrant/microsoft-r-open-$version.tar.gz
cd microsoft-r-open
./install.sh -au
cd ..
rm -rf microsoft-r-open

chmod -R 777 /opt/microsoft/ropen/$version/lib64
