# 研究室公式仮想マシン

## 準備

必要なソフトウェアをChocolateyでインストールする（参照：[計算機環境の構築](https://github.com/yabukilab/main/blob/master/%E8%A8%88%E7%AE%97%E6%A9%9F%E7%92%B0%E5%A2%83%E3%81%AE%E6%A7%8B%E7%AF%89.md)）。

（管理者でない）コマンドプロンプトを起動する。

仮想マシンの再構築を高速にするために，キャッシュを導入する。

```
vagrant plugin install vagrant-cachier
```

仮想マシンを用意する。

```
c:
cd \
mkdir vagrant
cd vagrant
git clone https://github.com/yabukilab/machine.git
```

## 起動

```
c:
cd \vagrant\machine
vagrant up
```

[http://localhost/info.php](http://localhost/info.php)や[http://localhost/phpmyadmin/](http://localhost/phpmyadmin/)（ユーザ名：root，パスワード：pass）にアクセスできることを確認する。

あとは[計算機環境の構築](https://github.com/yabukilab/main/blob/master/%E8%A8%88%E7%AE%97%E6%A9%9F%E7%92%B0%E5%A2%83%E3%81%AE%E6%A7%8B%E7%AF%89.md)のとおり。

## やり直したいときは

```
c:
cd \vagrant\machine
vagrant destroy
cd ..
rmdir /S /Q machine
```

## やっていること

* `Vafrantfile`に記述したこと
* `provision.sh`に記述したこと
* `html/info.php`の配備
