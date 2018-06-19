apt update

apt install -y libssl-dev libcurl4-openssl-dev zlib1g-dev
ln -s /bin/sed /usr/bin/sed

echo "install.packages('devtools')" | R --slave
#echo "devtools::install_github('IRkernel/IRkernel')" | R --slave # Error on MS R Open
echo "devtools::install_git('git://github.com/IRkernel/IRkernel.git')" | R --slave
su -l -c 'echo "IRkernel::installspec()" | R --slave' vagrant
su -l -c 'jupyter notebook --generate-config -y' vagrant
echo "c.NotebookApp.token = 'pass'" >> /home/vagrant/.jupyter/jupyter_notebook_config.py

#JupyterLab
/home/vagrant/anaconda3/bin/conda install -c conda-forge jupyterlab -y

mkdir -p /vagrant/jupyter
