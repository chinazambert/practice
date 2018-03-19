# -*- coding=utf-8 -*-

__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
]

#把字符串两两交换，每个字符串仅交换一次


class strQuest1():
    # 操作列表，将相邻的元素交换

    def pstrQuest1(self,str):
        if len(str) < 2:
            return str
        if len(str)%2 == 0:
            l = len(str)
            while l > 0:
                print('before while: {0}'.format(l))
                # l -= 1
                temp = str[l-2]
                str[l-2] = str[l-1]
                str[l-1] = temp
                l -= 2
                print('after while: {0}'.format(l))
            return str
        elif len(str)%2 == 1:
            l = len(str) - 1
            while l > 0:
                print('before while: {0}'.format(l))
                # l -= 1
                temp = str[l-2]
                str[l-2] = str[l-1]
                str[l-1] = temp
                l -= 2
                print('after while: {0}'.format(l))
            return str


if __name__ == '__main__':
    str = []
    for i in range(1, 20):
        str.append(i)
    print(str)
    s = strQuest1()
    print(s.pstrQuest1(str))
