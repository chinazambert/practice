# -*- coding=utf-8 -*-

__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
]

import os.path
import os


class GenWizard(object):
    # 注释
    def __init__(self,scriptName,scriptAuthor):
        scriptName = self.sc
    def scriptHead(self):
        fileHandle.write('# -*- coding=utf-8 -*-')
        fileHandle.write("\n\n__authors__ = [")
        fileHandle.write("\n    " + scriptAuthor)
        fileHandle.write("\n]")
        pass






if __name__ == '__main__':
    scriptName = 'test.py'
    scriptAuthor = '"zhaobo,<zhaobo06@meituan.com>,"'
    if os.path.exists(scriptName):
        os.remove(scriptName)

    fileHandle = open(scriptName, 'a')
    fileHandle.write('# -*- coding=utf-8 -*-')
    fileHandle.write("\n\n__authors__ = [")
    fileHandle.write("\n    " + scriptAuthor)
    fileHandle.write("\n]")
    fileHandle.write('\n\n\nclass myThrift(object):')
    fileHandle.write('\n    def HelloWorld(object):')
    fileHandle.write('\n        print("hello world!")')
    fileHandle.write("\n\n\nif __name__ == '__main__':")
    fileHandle.write("\n    myThrift.helloWorld(myThrift)")
    fileHandle.close()

    list = ['asd', 678, 123]
    list2 = [123,]
    print(list,list2)