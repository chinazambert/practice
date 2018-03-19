# -*- coding: utf-8 -*-
__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
    ]
__all__ = ['']

import sys

from object.tool.thrift_tool import ThriftTool
from wizard.mall.base import BaseWizard
from wizard.mall.common_thrift import Common_thrift
sys.path.append(Common_thrift().get_path('mall_item'))

class getItemWizrd(ThriftTool, BaseWizard):
    def __init__(self):
        # 传thrift文件的名字和service的名字，每个service封装一个类
        # super(ErpStaffThriftWizard, self).__init__(
        #     thrift_name='erpStaffService', service_name='StaffThriftService',
        #     folder='erp/erpStaff_thrift', remote_appkey='com.sankuai.sjst.erp.staff')

        #传thrift文件的名字和service的名字，每个service封装一个类
        super(getItemWizrd, self).__init__(
            'ItemService', 'ItemThriftService', 'mall/mall_item'
        )
        BaseWizard.__init__(self)


    def getItem(self,id):
        r = self.client.getItem(id)
        print(r)
        print()
        return {'status': r.status.code, 'msg': r.status.message, 'returnInfo':r, 'des':r.itemBase.description}

if __name__=='__main__':
    tw = getItemWizrd()
    print(tw.getItem(1007))
