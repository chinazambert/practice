# -*- coding=utf-8 -*-

__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
]

import os
import re


class FetchThrift:

    # 从thrift文件中获取服务列表，服务包含的接口，接口包含的参数
    def __init__(self, thrift_name, project_dir = None, thrift_dir = 'thrift'):

        # 参数说明：project_dir 默认为none，若需要请传值
        # self.thrift_name = thrift_name
        self.project_dir = project_dir
        self.thrift_dir = thrift_dir or self.thrift_dir
        self.thrift_name = thrift_name
        project = self.project_dir
        if project:

            self.file_name = '{0}{1}{2}{1}{3}.thrift'.format(self.thrift_dir, os.sep, project, thrift_name)
        else:
            self.file_name = '{0}{1}{2}.thrift'.format(self.thrift_dir, os.sep, thrift_name)
        print('the thrift filename is : {0}'.format(self.file_name))

    def fetch_services(self):
        # 获取thrift文件中所有的thrift，一般一个thrift对应一个文件，防止某些开发写的不规范
        f = open(self.file_name).read()
        r = []
        r1 = re.findall(' .*\{', f)
        print('original service is {0}'.format(r1))
        for rr1 in r1:
            r.append(rr1.strip('{, '))
        print('all the service list as below:{0}'.format(r))
        return r

    def fetch_apis(self, service_name):
        f = open(self.file_name).read()
        re_str = r'{0} {{(.*?)}}'.format(service_name)
        print('re_str is :{0}'.format(re_str))
        serviceblock_re = re.compile(re_str, re.S)
        # 获取单个服务的代码块
        r = serviceblock_re.findall(f)
        print('the service_block for {1} is {0}'.format(r, service_name))
        r1 = re.findall(' (.*?)\(1', r[0])
        final_r = []  # 存放该服务所有thrift接口名称的list
        for rr1 in r1:
            temp = rr1.split()
            final_r.append(temp[len(temp)-1])
        print('all the apis of service {1} list as below:{0}'.format(final_r, service_name))
        return final_r

    def ScriptHead(fileHandle, scriptAuthor = '"Auto-Gen,<Auto-Gen@meituan.com>,"'):

        # 生成脚本头
        # scriptAuthor = '"zhaobo,<zhaobo06@meituan.com>,"'

        fileHandle.write('\n# -*- coding=utf-8 -*-')
        fileHandle.write("\n\n__authors__ = [")
        fileHandle.write("\n    " + scriptAuthor)
        fileHandle.write("\n]")
        fileHandle.write('\n\n\n\n\nclass myThrift(object):')

    def AddFunction(fileHandle):
        # fileHandle.write('\n\n\nclass myThrift(object):')
        fileHandle.write('\n\n\n    def HelloWorld(object):')
        fileHandle.write('\n        print("hello world!")')
        # fileHandle.write("\n\n\nif __name__ == '__main__':")
        # fileHandle.write("\n    myThrift.HelloWorld(myThrift)")
        # pass

if __name__ == '__main__':
    pname = 'm_media_thrift'
    thrift_name = 'ItemService'
    thrift_name1 = 'MediaService'
    service_name = 'MediaThriftService'
    service_name1 = 'SkuThriftService'

    h = FetchThrift(thrift_name1, pname)
    service_list = h.fetch_services()
    api_list = h.fetch_apis('MediaThriftService')







