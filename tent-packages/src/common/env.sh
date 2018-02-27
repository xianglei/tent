#!/bin/sh

OS_VERSION=$(lsb_release -a | grep Release | awk '{print $2}' | awk -F'.' '{print $1}')
OS_RELEASE=$(lsb_release -a | grep Distributor | awk '{print $3}' | tr 'A-Z' 'a-z')
OS_CODENAME=$(lsb_release -a | grep Codename | awk '{print $2}')

if [[ $OS_RELEASE == 'centos' || $OS_RELEASE == 'redhat' ]]; then
    if [ ! -e /etc/yum.repos.d/epel.repo ]; then
        if [ $OS_VERSION == '6' ]; then
            wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo
        fi
        if [ $OS_VERSION == '7' ]; then
            wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
        fi
        sudo yum makecache
    fi
fi