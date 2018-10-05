# プロキシサーバ

スクレイピング用のプロキシサーバである。

## インストール

```bash
sudo apt install -y /vagrant/squid/*.deb

echo 'export http_proxy=localhost:3128' >> ~/.bashrc
echo 'export https_proxy=localhost:3128' >> ~/.bashrc
source ~/.bashrc
```

## 動作確認

```bash
wget https://ja.wikipedia.org/wiki/湯川秀樹
```

次のように表示されればよい。

```
vagrant@ubuntu-bionic:~$ wget https://ja.wikipedia.org/wiki/湯川秀樹
--2018-07-10 13:28:50--  https://ja.wikipedia.org/wiki/%E6%B9%AF%E5%B7%9D%E7%A7%80%E6%A8%B9
Resolving localhost (localhost)... 127.0.0.1
Connecting to localhost (localhost)|127.0.0.1|:3128... connected.
Proxy request sent, awaiting response... 200 OK
Length: 184559 (180K) [text/html]
Saving to: ‘湯川秀樹’

湯川秀樹                      100%[=================================================>] 180.23K   557KB/s    in 0.3s

2018-07-10 13:28:55 (557 KB/s) - ‘湯川秀樹’ saved [184559/184559]
```

## 補足：構築方法

このdebファイルは、次のように構築した。

```bash
sudo apt update

sudo apt install -y devscripts build-essential fakeroot libssl1.0-dev libldap2-dev libpam0g-dev libdb-dev cdbs libsasl2-dev debhelper libcppunit-dev libkrb5-dev comerr-dev libcap2-dev libecap3-dev libexpat1-dev libxml2-dev pkg-config libnetfilter-conntrack-dev nettle-dev libgnutls28-dev dh-apparmor

apt source squid

cd squid3-3.5.27/

sed -i 's/--with-default-user=proxy/--with-default-user=proxy --with-openssl --enable-ssl --enable-ssl-crtd/' debian/rules

./configure

debuild -us -uc -b

cd ..
```
