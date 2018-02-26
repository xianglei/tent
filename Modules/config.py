#!/usr/bin/env python
# coding: utf-8
# author: xianglei, 2018

import os
import json


class Parser(object):
    def __init__(self, filename='tent.json'):
        dirname = os.path.dirname(os.path.abspath(__file__))
        self.root = dirname + '/../../'
        try:
            with open(self.root + filename, 'rb') as tent:
                data = json.loads(tent.read())
                self.conf = data
        except IOError, e:
            self.conf = ''
            print e.message
        finally:
            tent.close()




