# -*- coding=utf-8 -*-

__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
]

import sys


class strQest2():
    # 打印一个字符串中出现测试最高的那个字符和他的出现次数

    def prtAwr(self):
        str = input('please input your string for calculation:')
        r = dict()
        for m in str:
            temp = {m: 0}
            r.update(temp)
            for n in str:
                if m ==n:
                    r[m] +=1
        max_value = 1
        # ck = ''
        for k in r.keys():
            if r[k] >= max_value:
                max_value = r[k]
        for k in r.keys():
            if r[k] == max_value:
                print('this string is {0}, it got {1} the most, {1} occurs {2} times'.format(str,k,r[k]))


if __name__ == '__main__':
    sq = strQest2()
    sq.prtAwr()
