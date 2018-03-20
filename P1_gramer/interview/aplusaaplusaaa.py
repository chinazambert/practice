# -*- coding=utf-8 -*-

__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
]

import sys


def aaa(a, b):
    r = 0
    n = 0
    while b > 0:
        r += a*pow(10, n)*b
        b -= 1
        n += 1
    return r


def bbb(a, b):
    r = 0
    for x in range(b):
        r += a*pow(10, x)*(b-x)
    return r


m = sys.argv[1]
n = sys.argv[2]
m = int(m)
n = int(n)
print(bbb(m, n))
print(aaa(m, n))
