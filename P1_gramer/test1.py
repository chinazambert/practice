# -*- coding=utf-8 -*-

__authors__ = [
    "zhaobo,<zhaobo06@meituan.com>,"
]


class myThrift(object):
    def HelloWorld(object):
        print("hello world!")


if __name__ == '__main__':
    myThrift.helloWorld(myThrift)