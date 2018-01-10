echo 'deb http://cloud.r-project.org/bin/linux/ubuntu xenial/' >> /etc/apt/sources.list

gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9
gpg -a --export E084DAB9 | apt-key add -

apt update

#gfortran is for caret (kernlab)
apt -y install r-base-core libopenblas-base gfortran

chmod -R 777 /usr/local/lib/R/site-library
