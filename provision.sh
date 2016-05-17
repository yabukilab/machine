#Timezone
timedatectl set-timezone Asia/Tokyo

apt-get update

#MySQL
MYSQL_ROOT_PASS="pass"
echo "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASS" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASS" | debconf-set-selections
apt-get -y install mysql-server

#phpMyAdmin
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password $MYSQL_ROOT_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password ''" | debconf-set-selections
apt-get -y install phpmyadmin
sudo php5enmod mcrypt

#display PHP errors
sed -i -e 's/display_errors = Off/display_errors = On/' /etc/php5/apache2/php.ini
service apache2 restart

#others
apt-get -y install git jq
apt-get -y autoremove
