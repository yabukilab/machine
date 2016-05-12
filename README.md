# 研究室公式仮想マシン

## 準備

必要なソフトウェアをChocolateyでインストールする（参照：[計算機環境の構築](https://github.com/yabukilab/main/blob/master/%E8%A8%88%E7%AE%97%E6%A9%9F%E7%92%B0%E5%A2%83%E3%81%AE%E6%A7%8B%E7%AF%89.md)）。

```
c:
cd /
mkdir vagrant
cd vagrant
git clone https://github.com/yabukilab/machine.git
```

## 起動

```
c:
cd /vagrant/machine
vagrant up
```

`vagrant`コマンドが使えない場合，PATHを有効にするために，コマンドプロンプトを立ち上げ直す。Windowsを再起動してもいい。

あとは[計算機環境の構築](https://github.com/yabukilab/main/blob/master/%E8%A8%88%E7%AE%97%E6%A9%9F%E7%92%B0%E5%A2%83%E3%81%AE%E6%A7%8B%E7%AF%89.md)のとおり。

## やり直したいときは

```
c:
cd /vagrant/machine
vagrant destroy
cd ..
rmdir /S /Q machine
```

## やっていること

`Vafrantfile`で以下の設定を行っている。

* ホストのhttp://localhost/ へのアクセスを，ゲストのhttp://localhost/ へのアクセスにする。（ホスト側でFirewallを通過できるようにする必要がある。）
* ゲストのドキュメントルート（`/var/www/html`）を`c:/vagrant/machine/html`にする。
* 初めての`vagrant up`や，停止時の`vagrant up --provision`で`provision.sh`を実行する。

`provision.sh`で以下を実行している。

* Apache2, MySQL, phpMyAdminをインストールする。
* MySQLのrootのパスワードを`pass`にする。

## やっていないこと

### タイムゾーンの設定

次のコマンドで起動するダイアログで，Asia→Tokyoとする。
```
sudo dpkg-reconfigure tzdata
```
