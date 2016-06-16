FROM centos:centos6.6

MAINTAINER Tetsurou Ayano (tetsurou.ayano@scsk.jp)

RUN yum -y update
#Install common
RUN yum -y install wget tar vim 

#Install git
ENV GIT_VERSION 2.6.4
ENV GIT_HOME /opt/git/git-$GIT_VERSION
RUN mkdir -p $GIT_HOME
RUN yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker gcc
RUN wget -O /tmp/v$GIT_VERSION.tar.gz https://github.com/git/git/archive/v$GIT_VERSION.tar.gz
RUN cd /opt/git && tar zxf /tmp/v$GIT_VERSION.tar.gz
RUN cd $GIT_HOME && make prefix=/usr/local all && make prefix=/usr/local install

#Install JDK6
RUN yum -y install java-1.6.0-openjdk java-1.6.0-openjdk-devel
# Install Maven
ENV MAVEN_VERSION 3.2.5
ENV M2_HOME /opt/maven/apache-maven-$MAVEN_VERSION
RUN mkdir -p $M2_HOME
RUN wget -O /tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz http://ftp.kddilabs.jp/infosystems/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN cd /opt/maven && tar zxf /tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN ln -s $M2_HOME/bin/mvn /usr/bin/mvn
RUN rm /tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz
# Environment parameters
RUN mkdir -p /opt/pccbuild

ENV PCC_REPOSITORY https://github.com/primecloud-controller-org/primecloud-controller.git
ENV PCC_VERSION 2.6.1

#choose master branch
RUN git clone --depth=1 -b $PCC_VERSION $PCC_REPOSITORY

#pre build for maven dependency
WORKDIR /primecloud-controller
RUN git pull
RUN mvn clean install -Dmvn.test.skip=true
# Build PCC
ADD build.sh /opt/build.sh
RUN chmod +x /opt/build.sh
ENTRYPOINT ["/opt/build.sh"]

