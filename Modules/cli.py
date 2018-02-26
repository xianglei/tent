#!/usr/bin/env python
# coding: utf-8
# author: xianglei, 2018

from config import Parser
import argparse


class CommandLine(Parser):
    def __init__(self):
        Parser.__init__(self)
        self.__parser = argparse.ArgumentParser()

    def argparse(self, *args, **kwargs):
        pass




