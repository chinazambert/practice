# -*- coding=utf-8 -*-

__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
]

import os
import re
import sys


class FetchThrift:

    # 从thrift文件中获取服务列表，服务包含的接口，接口包含的参数
    def __init__(self, thrift_name, project_dir=None, thrift_dir='{0}{1}thrift{1}mall{1}'.format('object', os.sep)):

        # 参数说明：project_dir 默认为none，若需要请传值
        # self.thrift_name = thrift_name
        self.project_folder = project_dir
        self.thrift_dir = thrift_dir or self.thrift_dir
        self.thrift_name = thrift_name
        if self.project_folder:

            self.source_file_name = '{0}{1}{2}{1}{3}.thrift'.format(self.thrift_dir, os.sep, self.project_folder, thrift_name)
        else:
            self.source_file_name = '{0}{1}{2}.thrift'.format(self.thrift_dir, os.sep, thrift_name)
        print('the thrift filename is : {0}'.format(self.source_file_name))

        self.target_file_name = 'wizard{1}mall{1}{2}{1}{0}_base.py'.format(thrift_name.lower(), os.sep, self.project_folder)
        print('Your target filename is : {0}'.format(self.target_file_name))
        # try:
        #     f = open(self.source_file_name).read()
        # except:
        #     print('file not found,please check your parameters')


    def fetch_services(self):
        # 获取thrift文件中所有的thrift，虽然一般一个thrift对应一个文件，防止某些开发写的不规范
        f = open(self.source_file_name).read()
        r = []
        r1 = re.findall(' .*\{', f)
        for rr1 in r1:
            r.append(rr1.strip('{, '))  #r1匹配出来的字段有{和空格， 去掉多余字段
        print('*********service*********' * 5)
        print('{0} :::all the services of this file list as below:{1}'.format(self.source_file_name, r))
        return r

    def fetch_apis(self, service_name):
        f = open(self.source_file_name).read()
        re_str = r'{0} {{(.*?)}}'.format(service_name)
        print('re_str is :{0}'.format(re_str))
        serviceblock_re = re.compile(re_str, re.S)
        # 获取单个服务的代码块
        r = serviceblock_re.findall(f)
        print('the service_block for {1} is {0}'.format(r, service_name))  #调试用
        r1 = re.findall(' (.*?)\(1', r[0])  # 正则取出来的是一个 list  所以用r[0]取前面的
        print(r1)
        final_r = []  # 存放该服务所有thrift接口名称的list
        for rr1 in r1:
            # print('rr1 is {0}'.format(rr1))
            temp = rr1.split()
            # print('temp rr1 is {0}'.format(temp))
            final_r.append(temp[len(temp)-1])  # 取split后的列表最后一个才是方法名
        print('*********api*********'*5)
        print('{1}  :::all the apis of service {1} list as below:{0}'.format(final_r, service_name))
        return final_r

    def fetch_args(self, api_name):
        # 获取接口定义的参数。
        f = open(self.source_file_name).read()
        re_str = '{0}(.*?);'.format(api_name)
        apiblock_re = re.compile(re_str, re.S)
        r = apiblock_re.findall(f)  # 只匹配出了括号里面的内容
        rr = r[0].split()  # 以空格切成列表
        final_r = []
        for rrr in rr:
            # 判断是否需要作为参数
            if rrr.endswith(')') or rrr.endswith(','):
                # 去掉逗号和括号（判断条件）
                final_r.append(rrr[:-1])
        print('*********args*********'*5)
        print('{1} ::: all the args of api {1} list as below:{0}'.format(final_r, api_name))
        return final_r




    def ScriptHead(self, fileHandle, scriptAuthor = '"Auto-Gen,<Auto-Gen@meituan.com>,"'):

        # 生成脚本头
        # scriptAuthor = '"zhaobo,<zhaobo06@meituan.com>,"'
        fileHandle.write('\n# -*- coding=utf-8 -*-')
        fileHandle.write('\n# this wizard generated automatically, the filepath '
                         'or somewhere would have mistake due to your wrong parameter(s),')
        fileHandle.write('\n# copy file to the right direction and see the comment and modify accordingly')
        fileHandle.write("\n\n__authors__ = [")
        fileHandle.write("\n    " + scriptAuthor)
        fileHandle.write("\n]")
        fileHandle.write('\n\n\nimport sys')
        fileHandle.write('\nfrom object.tool.thrift_tool import ThriftTool')
        fileHandle.write('\nfrom wizard.mall.base import BaseWizard')
        fileHandle.write('\nfrom wizard.mall.base import BaseWizard')
        fileHandle.write('\nfrom wizard.mall.common_thrift import Common_thrift')
        fileHandle.write("\nsys.path.append(Common_thrift().get_path('{0}'))".format(self.project_folder))

    def ClassHead(self, fileHandle, service_name):
        fileHandle.write("\n\n\nclass {0}Wizrd(ThriftTool, BaseWizard):".format(service_name))
        fileHandle.write("\n\tdef __init__(self):")
        fileHandle.write("\n\t\tsuper({0}Wizrd, self).__init__(".format(service_name))
        fileHandle.write("\n\t\t\t'{0}', '{1}', "
                         "'mall/{2}' # may need to change 'mall/{2}' "
                         "to actual path".format(self.thrift_name, service_name, self.project_folder))
        fileHandle.write("\n\t\t)")
        fileHandle.write("\n\t\tBaseWizard.__init__(self)")

    def AddFunction(self, fileHandle, function_name, arg_str):
        # fileHandle.write('\n\n\nclass myThrift(object):')
        fileHandle.write('\n\n\tdef {0}({1}):'.format(function_name, arg_str))
        fileHandle.write('\n\t\tr = self.client.{0}({1})'.format(function_name, arg_str))
        fileHandle.write('\n\t\tprint(r)')
        fileHandle.write("\n\t\treturn {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}")
        # fileHandle.write("\n\n\nif __name__ == '__main__':")
        # fileHandle.write("\n    myThrift.HelloWorld(myThrift)")
        # pass

    def arg_list_to_str(self, arg_list):
        arg_str = 'self, '
        for temp_arg_list in arg_list:
            arg_str += temp_arg_list
            arg_str += ', '
        arg_str = arg_str[:-2]
        return arg_str



if __name__ == '__main__':
    # project_dir = 'm_media_thrift'
    # thrift_name = 'ItemService'
    # thrift_name1 = 'MediaService'
    # service_name = 'MediaThriftService'
    # service_name1 = 'SkuThriftService'
    # project_dir = sys.argv[0]
    thrift_name = sys.argv[1]
    project_folder = sys.argv[2]

    h = FetchThrift(thrift_name, project_folder)
    filehandle = open(h.target_file_name, 'w')
    # filehandle.write()
    print('\n\n>>>>>>>>>>>>>>>>>>:\ngenerating script head:\n')
    h.ScriptHead(filehandle)

    service_list = h.fetch_services()

    for tmp_service in service_list:
        print('\n\n>>>>>>>>>>>>>>>>>>:\ngenerating service class for {0}:\n'.format(tmp_service))
        h.ClassHead(filehandle, tmp_service)

        api_list = h.fetch_apis(tmp_service)

        for tmp_api in api_list:
            temp_arg_list = h.fetch_args(tmp_api)
            arg_str = h.arg_list_to_str(temp_arg_list)
            print('\n\n>>>>>>>>>>>>>>>>>>:\ngenerating interface wizard for {0}:\n'.format(tmp_api))
            h.AddFunction(filehandle, tmp_api, arg_str)
