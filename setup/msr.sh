apt update

#gfortran is for caret (kernlab)
apt -y install build-essential gfortran

#Microsoft R Open 3.4.2
if [ ! -e '/vagrant/microsoft-r-open-3.4.2.tar.gz' ]; then
  cd /vagrant
  wget -q https://mran.blob.core.windows.net/install/mro/3.4.2/microsoft-r-open-3.4.2.tar.gz
fi
tar zxf /vagrant/microsoft-r-open-3.4.2.tar.gz
cd microsoft-r-open
./install.sh -au
cd ..
rm -rf microsoft-r-open

chmod -R 777 /opt/microsoft/ropen/3.4.2/lib64
