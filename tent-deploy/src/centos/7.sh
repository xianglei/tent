#!/bin/sh

sudo yum -y install wget unzip ruby ruby-devel ruby-libs rubygems rubygems-devel

if [ ! -e '/etc/yum.repos.d/epel.repo' ]; then
    wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
fi

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