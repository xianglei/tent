#!/bin/sh

sudo yum -y install wget unzip

if [ ! -e '/etc/yum.repos.d/epel.repo' ]; then
    wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo
fi

https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz
tar zxf ruby-2.5.0.tar.gz
cd ruby-2.5.0
./configure
make -j4
sudo make install
cd ..
rm -rf ruby-2.5.0
gem install --no-ri --no-rdoc fpm

sudo yum makecache
sudo yum -y install \
    gcc \
    gcc-c++ \
    bzip2-devel \
    rpm-build \
    sqlite-devel \
    cyrus-sasl-devel \
    createrepo \
    redhat-lsb-core \
    bsddb-devel \
    gdbm-devel \
    ncurses-devel \
    readline-devel \
    lzo \
    lzo-devel \
    lzop