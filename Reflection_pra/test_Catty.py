# -*- coding=utf-8 -*-

__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
]

from Reflection_pra.test_Doggy import Doggy

class Catty(object):
    # 注释
    def born(self):
        print('cat has born')



if __name__ == '__main__':
    Catty.born(Catty)
    func_name = 'born'
    f = getattr(Catty,func_name,None)
    if f == None:
        print('Catty has No this function')
    else:
        f(Catty)
    ff = getattr(Doggy,func_name,None)
    if ff == None:
        print('Doggy has no this function')
    else:
        ff(Doggy)
