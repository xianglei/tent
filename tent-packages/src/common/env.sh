#!/bin/sh

OS_VERSION=$(lsb_release -a | grep Release | awk '{print $2}' | awk -F'.' '{print $1}')
OS_RELEASE=$(lsb_release -a | grep Distributor | awk '{print $3}' | tr 'A-Z' 'a-z')
OS_CODENAME=$(lsb_release -a | grep Codename | awk '{print $2}')