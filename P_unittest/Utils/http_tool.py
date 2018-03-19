# -*- coding=utf-8 -*-

__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
]

import requests


class httpHandle:
    def __init__(self,url):
        self.url = url
        self.data = {}
        self.params = {}
        self.cookies ={}
        self.timeout = float(3000)


    # 注释
        self.url =
    def gethttp(self,url='', params='', **kwargs):
        f_url = url or self.url
        self.params = params or self.params
        r = requests.get(f_url, )
        conn = requests.get(li)
        rs = conn.content
        r1 = conn.json()
        print(r1)
        return rs



if __name__ == '__main__':
    url1 = 'http://www.baidu.com/s'
    param1 = {'wd':'zhaobo'}
    # print(url1)
    r = httpHandle.gethttp(httpHandle,url1)
    r = requests.get(url1,params=param1)
    print(r.content)
    print(r.url)

