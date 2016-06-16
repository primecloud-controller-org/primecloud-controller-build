# primecloud-controller-build

PrimeCloud Controllerのビルド用プロジェクトです。

Dockerを利用することでどの環境でも同様のバイナリパッケージを作成することができます。

本プロジェクトではホストにはDockerが既にインストールされていることを前提としています。



### イメージのビルド方法
PCCビルド用イメージを作成します。

コマンド例：

	version 2.6.1の場合
	# docker build -t pccoss-build:2.60. tag/2.6.1/

### PCC本体のパッケージング
最新のPCCをビルドし、インストールパッケージを作成します。
作成後のファイルはホスト側の/work以下にコピーします。

コマンド例：

	コンテナの起動とビルド後のファイルのコピー

	# docker run -i --name pccoss-build pccoss-build:2.6.1 && rm -rf /tmp/pccbuild/primecloud-controller && docker cp pccoss-build:/primecloud-controller /tmp/pccbuild && docker rm pccoss-build

	もしくは、すぐに使用したい方はDockerHubに公開済みのイメージからも起動できます。

	# docker run -i --name pccoss-build primecloudcontroller/primecloud-controller-build:2.6.1 && rm -rf /tmp/pccbuild/primecloud-controller && docker cp pccoss-build:/primecloud-controller /tmp/pccbuild && docker rm pccoss-build

	最新版のビルド方法

	# docker run --rm -v /tmp/pccbuild:/opt/pccbuild/ primecloudcontroller/primecloud-controller-build:latest

Docker Hub
https://registry.hub.docker.com/u/primecloudcontroller/primecloud-controller-build/

### インストーラパッケージの場所
インストール用のバイナリは以下に配備されています。

	# /tmp/pccbuild/primecloud-controller/auto-tool/install-tool/target/PrimeCloud-Controller-<version>.tar.gz

### LICENSE

GNU GENERAL PUBLIC LICENSE Version 2.0 or later
