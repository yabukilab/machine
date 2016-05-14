# 研究室公式仮想マシン

## 準備

必要なソフトウェアをChocolateyでインストールする（参照：[計算機環境の構築](https://github.com/yabukilab/main/blob/master/%E8%A8%88%E7%AE%97%E6%A9%9F%E7%92%B0%E5%A2%83%E3%81%AE%E6%A7%8B%E7%AF%89.md)）。

仮想マシンの再構築を高速にするために，キャッシュを導入する。

```
vagrant plugin install vagrant-cachier
```

仮想マシンを用意する。

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

[http://localhost/info.php](http://localhost/info.php)や[http://localhost/phpmyadmin/](http://localhost/phpmyadmin/)（ユーザ名：root，パスワード：pass）にアクセスできることを確認する。

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

* ホストのhttp://localhost/ へのアクセスを，ゲストのhttp://localhost/ へのアクセスにする。
 * ホスト側でFirewallを通過できるようにする必要があるかもしれない。
 * 別のソフトウェア（例：Skype）が80番ポートを使っているとうまくいかない。`netstat -nao`で80番ポートを使っているソフトウェアのPIDを調べ，タスクマネージャでそのソフトウェアを突き止めるとよい。
* ゲストのドキュメントルート（`/var/www/html`）を`c:/vagrant/machine/html`にする。
* 初めての`vagrant up`や，停止時の`vagrant up --provision`で`provision.sh`を実行する。

`provision.sh`で以下を実行している。

* タイムゾーンをAsia/Tokyoに設定する。
* Apache2, MySQL, phpMyAdminをインストールする。
* MySQLのrootのパスワードを`pass`にする。

その他

* html/info.php を配備する。
