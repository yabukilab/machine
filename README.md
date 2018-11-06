# 研究室公式仮想マシン

## 準備

### Windows以外の場合

割愛

### Windowsの場合

[Chocolatey](https://chocolatey.org/)をインストールし，PowerShellまたはコマンドプロンプト（いずれも管理者）で，以下を実行する。

```
cinst -y git rsync vagrant virtualbox
```

（管理者でない）コマンドプロンプトを起動する。

Guest Additionの更新，ディスクサイズの変更を簡易化するためのプラグインを導入する。

```
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-disksize
```

ただし，Guest Additionの自動更新はVagrantfileで無効にしてあるため，共有フォルダが使えないなど，不具合が出た場合は，`vagrant vbguest --status`でバージョンの違いを確認し，`vagrant vbguest --do install`で更新，`vagrant vbguest --do start`で起動すること。

仮想マシンを用意する。（**[計算機環境の構築](https://github.com/yabukilab/main/blob/master/%E8%A8%88%E7%AE%97%E6%A9%9F%E7%92%B0%E5%A2%83%E3%81%AE%E6%A7%8B%E7%AF%89.md)の「Git」の部分をやってから**）

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

## やり直したいときは

```
c:
cd /vagrant/machine
vagrant destroy -f
```

完全に消去したいときは，上に加えて

```
cd /vagrant
rmdir /S /Q machine
```

## 補足

* 仮想マシンの仕様を`Vafrantfile`に記述している。仮想マシンに割り当てるメモリやディスクを増やしたい場合は、このファイルを修正する。
* 簡単な初期設定を`provision.sh`で行っている。起動後のカスタマイズはこのファイルで行う。
* 仮想マシンのひな形（Box）の更新は`vagrant box update`。うまく動かないときはこれを試すといいかもしれない。
* `C:/Users/ユーザ名/.vagrant.d/boxes/ubuntu-VAGRANTSLASH-xenial64/metadata_url`の中身が`https://vagrantcloud.com/ubuntu/xenial64`になっていないと，Boxの更新ができないかもしれない。（参考：https://github.com/hashicorp/vagrant/issues/9442 ）
* 研究室で使うときは，`echo 'Acquire::http::Proxy "http://10.100.192.4:3142/";' | sudo tee /etc/apt/apt.conf.d/02proxy`を実行しておくと，研究室のキャッシュサーバを使うようになるため，`apt update`や`apt install`が速くなる。（以前は`provision.sh`にこの設定を書いていたが，家で作業する学生がハマる原因になっていたため，コメントアウトした。）

## 各種開発環境

作業の詳細はsetupにあるスクリプトで確認すること。

### ウェブアプリケーション構築環境

「プロジェクトマネジメント演習（PM演習）」のための開発環境である。

構築：`sudo bash /vagrant/setup/lamp.sh`

（スクリプトの改行コードがGitによってCRLFに変更されているとエラーになる。その場合は，`sudo apt install -y nkf; nkf -d --overwrite /vagrant/setup/*`で、改行コードをLFにする。

動作確認：ホスト側のブラウザから[http://localhost/info.php](http://localhost/info.php)や[http://localhost/phpmyadmin/](http://localhost/phpmyadmin/)（ユーザ名：root，パスワード：pass）にアクセスできることを確認する。

メモ：ドキュメントルートは`/var/www/html`。ホスト側からは`c:/vagrant/machine/html`でアクセスできる。

### Python（Anaconda）

「プログラム言語とプログラミング」のための開発環境である。

構築：`sudo bash /vagrant/setup/python.sh`

動作確認：`python --version`の結果が`Python 3.6.3 :: Anaconda, Inc.`などとなっていればよい。

### R

2つの選択肢を用意している。

* （標準）R（+OpenBLAS）：`sudo bash /vagrant/setup/r.sh`
* （高速）MS R Open（+Intel MKL）：`sudo bash /vagrant/setup/msr.sh`

動作確認：

`R`で起動し，`sessionInfo()`で動作環境を確認する。

#### Jupyter for R

「データマイニング入門」のための開発環境である。

**PythonとRをインストールしてから，以下を実行する。**

構築：`sudo bash /vagrant/setup/jupyter.sh`

動作確認：

* `jnote`でJupyter Notebookを起動する（`jnote`はalias）。
* `jlab`でJupyterLabを起動する（`jlab`はalias）。

ホスト側のブラウザで，http://localhost:8888 にアクセスして利用する。使い方：式を入力してShift+Enter。

#### スクレイピング

[スクレイピングのためのプロキシサーバ](squid)
