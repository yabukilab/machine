# 研究室公式仮想マシン

## 準備

必要なソフトウェアをChocolateyでインストールする（参照：[計算機環境の構築](https://github.com/yabukilab/main/blob/master/%E8%A8%88%E7%AE%97%E6%A9%9F%E7%92%B0%E5%A2%83%E3%81%AE%E6%A7%8B%E7%AF%89.md)）。

（管理者でない）コマンドプロンプトを起動する。

Guest Additionの更新，ディスクサイズの変更を簡易化するためのプラグインを導入する。

```
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-disksize
```

ただし，Guest Additionの自動更新は無効にしてあるため，共有フォルダが使えないなど，不具合が出た場合は，`vagrant vbguest --status`でバージョンの違いを確認し，`vagrant vbguest --do install`で更新，`vagrant vbguest --do start`で起動すること。

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

あとは[計算機環境の構築](https://github.com/yabukilab/main/blob/master/%E8%A8%88%E7%AE%97%E6%A9%9F%E7%92%B0%E5%A2%83%E3%81%AE%E6%A7%8B%E7%AF%89.md)のとおり。

## やり直したいときは

```
c:
cd \vagrant\machine
vagrant destroy -f
```

完全に消去したいときは，上に加えて

```
cd \vagrant
rmdir /S /Q machine
```

## 補足

* `Vafrantfile`を参照。仮想マシンに割り当てるメモリやディスクを増やしたい場合は、このファイルを修正する。
* 簡単な初期設定を`provision.sh`で行っている。「`echo 'Acquire::http::Proxy "http://10.100.192.4:3142/";' > /etc/apt/apt.conf.d/02proxy`」は研究室にあるパッケージのキャッシュサーバを利用するための設定だから，研究室外で使うときは，仮想マシンの起動後に，`sudo rm /etc/apt/apt.conf.d/02proxy`として無効にすること。（この行をコメントアウトしてもよい。）
* UbuntuのBoxの更新は`vagrant box update`。

## 各種開発環境

作業の詳細はsetupにあるスクリプトで確認すること。

### ウェブアプリケーション構築環境

「プロジェクトマネジメント演習（PM演習）」のための開発環境である。

構築：`sudo bash /vagrant/setup/lamp.sh`（必要なら`sudo apt update`をやってから）

動作確認：ホスト側のブラウザから[http://localhost/info.php](http://localhost/info.php)や[http://localhost/phpmyadmin/](http://localhost/phpmyadmin/)（ユーザ名：root，パスワード：pass）にアクセスできることを確認する。

メモ：ドキュメントルートは`/var/www/html`。ホスト側からは`c:/vagrant/machine/html`でアクセスできる。

### Python（Anaconda）

「プログラム言語とプログラミング」のための開発環境である。

構築：`sudo bash /vagrant/setup/python.sh`（必要なら`sudo apt update`をやってから）

動作確認：`python --version`の結果が`Python 3.6.3 :: Anaconda, Inc.`などとなっていればよい。

### R

2つの選択肢を用意している。いずれも，コンソールで起動するコマンドは`R`。

* （標準）R（+OpenBLAS）：`sudo bash /vagrant/setup/r.sh`
* （高速）MS R Open（+Intel MKL）：`sudo bash /vagrant/setup/msr.sh`

動作確認：

MS R Openを起動すると次のように表示される。

```
Microsoft R Open 3.4.2
The enhanced R distribution from Microsoft
Microsoft packages Copyright (C) 2017 Microsoft Corporation

Using the Intel MKL for parallel mathematical computing (using 4 cores).
```

#### Jupyter notebook for R

「データマイニング入門」のための開発環境である。

**PythonとRをインストールしてから，以下を実行する。**

構築：`sudo bash /vagrant/setup/jupyter.sh`

動作確認：

`jn`でJupyter notebookを起動する（`jn`はalias）。

ホスト側のブラウザで，http://localhost:8888 にアクセスし，「Password or token:」に`pass`と入力して利用する。使い方：式を入力してShift+Enter。
