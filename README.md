# primecloud-controller-build

========

PrimeCloud Controllerのビルド用プロジェクトです。

Dockerを利用することでどの環境でも同様のバイナリパッケージを作成することができます。

本プロジェクトではホストにはDockerが既にインストールされていることを前提としています。



### イメージのビルド方法
PCCビルド用イメージを作成します。

コマンド例：
	
	version 2.4.3の場合
	# docker build -t pccoss-build:2.4.3 .

### PCC本体のパッケージング
最新のPCCをビルドし、インストールパッケージを作成します。
作成後のファイルはホスト側の/work以下にコピーします。

コマンド例：

	コンテナの起動とビルド後のファイルのコピー

	#docker run -i --name pccoss-build pccoss-build:2.4.3 && rm -rf /tmp/pccbuild/primecloud-controller && docker cp pccoss-build:/primecloud-controller /tmp/pccbuild && docker rm pccoss-build


### インストーラパッケージの場所
インストール用のバイナリは以下に配備されています。

	# /opt/pccbuild/primecloud-controller/auto-tool/install-tool/target/PrimeCloud-Controller-2.4.3.tar.gz

### LICENSE

GNU GENERAL PUBLIC LICENSE Version 2.0 or later
