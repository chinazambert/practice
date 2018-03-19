# -*- coding=utf-8 -*-

__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
]

# import XXX


class TestMe(object):
    # 注释  and运算符

    def t_add(self,a,b):
        r = a and b
        print(r)


if __name__ == '__main__':
    tm = TestMe()
    tm.t_add(1 == 3,20)