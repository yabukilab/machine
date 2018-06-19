version="3.5.0"

apt update

#gfortran is for caret (kernlab)
apt -y install build-essential gfortran

# https://github.com/Microsoft/microsoft-r-open/issues/34#issuecomment-371030682
wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb \
  && dpkg -i /tmp/libpng12.deb \
  && rm /tmp/libpng12.deb

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
