# -*- coding=utf-8 -*-

__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
]

# import XXX


class Doggy(object):
    # 注释
    def born(self):
        print('doggy has born')
    def run(self):
        print('doggy can run')
    def bark(self):
        print('汪汪汪')
    def dead(self):
        print('doggy is dying')
    def hahaha(self):
        print(3650*12*2)



if __name__ == '__main__':
    dog = Doggy()
    dog.hahaha()