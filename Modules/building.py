#!/usr/bin/env python
# coding: utf-8
# author: xianglei, 2018

from config import Parser
import subprocess
import platform
import os


class OSDist(Parser):
    def __init__(self):
        Parser.__init__(self)

        os_dist = platform.dist()[0].lower()
        if os_dist == 'centos':
            self.os_dist = 'rpm'
            self.rpm_dist = 'el' + platform.dist()[1][0]
        elif os_dist == 'ubuntu' or os_dist == 'debian':
            self.os_dist = 'deb'
            self.rpm_dist = ''  # to do
        else:
            self.os_dist = 'pkg'
        self.arch = platform.machine()


class Builder(OSDist):
    def __init__(self):
        OSDist.__init__(self)
        self._rpm_dist = ''

    def __execution(self, command):
        p = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, close_fds=True, shell=True)
        stdout, stderr = p.communicate()
        retcode = p.wait()
        return {'retcode': retcode, 'stdout': stdout, 'stderr': stderr}

    def __do_build_component(self, component):
        script = self.root + 'tent-packages/src/common/' + component + '/do-build-component'
        return self.__execution(script)

    def __do_build_clean(self, component):
        script = self.root + 'tent-packages/src/common/' + component + '/do-build-clean'
        return self.__execution(script)

    def __construct_package_command(self, package):
        package_def = self.conf['packages'][package]
        command = '/usr/local/bin/fpm '
        build_args = ' --epoch ' + package_def['epoch'] + ' -s dir -t ' + self.os_dist \
                     + ' -v ' + package_def['version'] + ' --iterarion ' + package_def['iteration'] \
                     + ' --prefix ' + package_def['dest'] + ' --C ' + package_def['src'] \
                     + ' -p ' + self.root + 'output/' + package_def['build-name'] + '/' + self.arch \
                     + ' --license ' + package_def['license'] \
                     + ' --vendor ' + package_def['vendor'] \
                     + ' --rpm-summary ' + package_def['summary'] \
                     + ' --url ' + package_def['url'] \
                     + ' -a ' + self.arch
        if self.os_dist == 'rpm':
            build_args += ' --rpm-dist ' + self.rpm_dist
        build_args += ' -f --verbose ' \
                      + ' --after-install ' + self.root + 'tent-packages/src/common/' + package + \
                      '/post-install.sh ' \
                      + ' --before-install ' + self.root + 'tent/packages/src/common/' + package + \
                      '/pre-install.sh ' \
                      + ' --after-uninstall ' + self.root + 'tent/packages/src/common/' + package + \
                      '/post-uninstall.sh ' \
                      + ' --before-uninstall ' + self.root + 'tent/packages/src/common/' + package + \
                      '/pre-uninstall.sh '
        dep_string = ''
        if package_def['depends']['centos']:
            for dep in package_def['depends']['centos']:
                dep_string += ' --depends ' + dep + ' '
        build_args += dep_string

        command += build_args
        return command

    def do_package(self, package):
        print '--------DOING_BUILD_COMPONENT--------'
        do_build = self.__do_build_component(package)
        for so in do_build['stdout'].split('\n'):
            print 'STDOUT: ' + so
        for se in do_build['stderr'].split('\n'):
            print 'STDERR: ' + se
        print do_build['retcode']

        print '--------PACKAGING--------'
        cmd = self.__construct_package_command(package)
        do_package = self.__execution(cmd)
        for so in do_package['stdout'].split('\n'):
            print 'STDOUT: ' + so
        for se in do_package['stderr'].split('\n'):
            print 'STDERR: ' + se
        print do_package['retcode']
        print '--------DOING_BUILD_CLEAN--------'
        do_clean = self.__do_build_clean(package)
        for so in do_clean['stdout'].split('\n'):
            print 'STDOUT: ' + so
        for se in do_clean['stderr'].split('\n'):
            print 'STDERR: ' + se
        print do_clean['retcode']










