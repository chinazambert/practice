# -*- coding=utf-8 -*-

__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
]

import re
import os


class ReTest(object):
    # 注释

    pass


if __name__ == '__main__':
    f = open('thrift/ItemService.thrift')
    r = f.read()
    r1 = re.findall('is.*d$','zambert is very very very good')
    print(r1)
    r2 = re.findall('.{20}1',r)
    lr2 = []
    for ri2 in r2:
        temp = ri2[:-2]
        temp = temp.split()
        # tmp = temp[1]
        lr2.append(temp)
    print(lr2)
    pli = ['id','name',123]
    print(pli)

    for lr in lr2:
        print('def {0}'.format(lr), end=""),
        for pm in pli:
            if pm == pli[0]:
                print('(self, {0},'.format(pm), end=" ")
            elif pm == pli[len(pli)-1]:
                print('{0}):'.format(pm), end="")
            else:
                print('{0},'.format(pm), end=" ")
        print()

            # print('{0},'.format(pm))
