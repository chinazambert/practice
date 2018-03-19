# -*- coding=utf-8 -*-

__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
]

import os
# from P1_gramer.fetchThrift import FetchThrift


class GenThrift():

    # 生成脚本头
    def ScriptHead(fileHandle, scriptAuthor = '"Auto-Gen,<Auto-Gen@meituan.com>,"'):
        # scriptName = 'test1.py'
        # scriptAuthor = '"zhaobo,<zhaobo06@meituan.com>,"'
        # if os.path.exists(scriptName):
        #     os.remove(scriptName)
        #
        # fileHandle = open(scriptName, 'a')
        fileHandle.write('\n# -*- coding=utf-8 -*-')
        fileHandle.write("\n\n__authors__ = [")
        fileHandle.write("\n    " + scriptAuthor)
        fileHandle.write("\n]")
        fileHandle.write('\n\n\n\n\nclass myThrift(object):')

        # fileHandle.close()

    # 往脚本里面添加接口封装方法
    def AddFunction(fileHandle):
        # fileHandle.write('\n\n\nclass myThrift(object):')
        fileHandle.write('\n\n\n    def HelloWorld(object):')
        fileHandle.write('\n        print("hello world!")')
        # fileHandle.write("\n\n\nif __name__ == '__main__':")
        # fileHandle.write("\n    myThrift.HelloWorld(myThrift)")
        # pass

    # 获取thrift文件中的内容，提取接口名称和参数
    def fetchApi(thriftService, thriftName = 'itemService'):

        f = open(thriftName)



    # return xxx


# if __name__ == '__main__':
#     # GenThrift.ScriptHead(GenThrift)
#     f = open('thrift/ItemService.thrift')
#     r = f.read()
#     print(r)
    # f.close()
    # print(r)
    # print(r)
    def gen_script(self, scriptName):

        # scriptAuthor = '"zhaobo,<zhaobo06@meituan.com>,"'
        f1 = open(scriptName, 'a')
        # if os.path.exists(scriptName):
        if not os.path.getsize(scriptName):
            self.ScriptHead(f1)
            self.AddFunction(f1)
            f1.close()
        else:
            self.AddFunction(f1)
            f1.close()

    scriptName = 'test2.py'
    gen_script(scriptName)
