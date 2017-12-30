apt update

#for caret (kernlab)
apt -y install gfortran

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

mkdir -p /home/ubuntu/R/x86_64-pc-linux-gnu-library/3.3
echo "alias R='R --no-save'" >> /home/ubuntu/.bashrc

#Jupyter notebook for R
apt install -y build-essential zlib1g-dev libssl-dev
ln -s /bin/sed /usr/bin/sed

echo "install.packages('devtools')" | /usr/bin/R --slave --no-save
#echo "devtools::install_github('IRkernel/IRkernel')" | /usr/bin/R --slave --no-save#ERROR!
echo "devtools::install_git('git://github.com/IRkernel/IRkernel.git')" | /usr/bin/R --slave --no-save
chown -R ubuntu:ubuntu /home/ubuntu/R
su -l -c 'PATH=/home/ubuntu/anaconda3/bin:$PATH echo "IRkernel::installspec()" | /usr/bin/R --slave --no-save' ubuntu
su -l -c 'jupyter notebook --generate-config -y' ubuntu
echo "c.NotebookApp.token = 'pass'" >> /home/ubuntu/.jupyter/jupyter_notebook_config.py
echo "alias jn='jupyter notebook --no-browser --ip=0.0.0.0'" >> /home/ubuntu/.bashrc
