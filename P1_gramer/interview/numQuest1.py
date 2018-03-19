# -*- coding=utf-8 -*-

__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
]

# import XXX


class test_num(object):
    #  根据给定的数，输出离他最近的2的次方数
    def testNum(a):
        return pow(2,a)
    def runme(num):
        flag = True
        time = -1
        # myobj = test_num
        while (flag):
            time += 1
            if num <= test_num.testNum(time):
                flag = False
                # x =
                # y =
                if (test_num.testNum(time) - num) >= (num - test_num.testNum(time - 1)):
                    rn = time - 1
                else:
                    rn = time
        print('num is {0} , most closely to {1} ,so answer is {2}'.format(num, test_num.testNum(rn), rn))

if __name__ == '__main__':
    while 1 :
        num = int(input('please input you number:'))
        test_num.runme(num)


