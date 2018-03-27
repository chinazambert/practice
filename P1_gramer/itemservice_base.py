
# -*- coding=utf-8 -*-
# this wizard generated automatically, the filepath or somewhere would have mistake due to your wrong parameter(s),
# copy file to the right direction and see the comment and modify accordingly

__authors__ = [
    "Auto-Gen,<Auto-Gen@meituan.com>,"
]


import sys
from object.tool.thrift_tool import ThriftTool
from wizard.mall.base import BaseWizard
from wizard.mall.base import BaseWizard
from wizard.mall.common_thrift import Common_thrift
sys.path.append(Common_thrift().get_path('mall_item')) # may need to change 'mall_item' to actual path


class ItemThriftServiceWizrd(ThriftTool, BaseWizard):
	def __init__(self):
	super(ItemThriftServiceWizrd, self).__init__(
		'ItemService', 'ItemThriftService', 'mall/mall_item' # may need to change 'mall/mall_item' to actual path
	)
	BaseWizard.__init__(self)

	def getCompleteItem(self, id, options):
		r = self.client.getCompleteItem(self, id, options)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}

	def getItem(self, id):
		r = self.client.getItem(self, id)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}

	def mapItems(self, ids):
		r = self.client.mapItems(self, ids)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}

	def publishItem(self, operatorId, req):
		r = self.client.publishItem(self, operatorId, req)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}

	def updateItem(self, operatorId, req):
		r = self.client.updateItem(self, operatorId, req)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}

	def onShelfItems(self, operatorId, ids):
		r = self.client.onShelfItems(self, operatorId, ids)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}

	def offShelfItems(self, operatorId, ids):
		r = self.client.offShelfItems(self, operatorId, ids)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}

	def queryItems(self, req):
		r = self.client.queryItems(self, req)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}


class SkuThriftServiceWizrd(ThriftTool, BaseWizard):
	def __init__(self):
	super(SkuThriftServiceWizrd, self).__init__(
		'ItemService', 'SkuThriftService', 'mall/mall_item' # may need to change 'mall/mall_item' to actual path
	)
	BaseWizard.__init__(self)

	def addSku(self, operatorId, req):
		r = self.client.addSku(self, operatorId, req)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}

	def updateSku(self, operatorId, req):
		r = self.client.updateSku(self, operatorId, req)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}

	def deleteSku(self, operatorId, id):
		r = self.client.deleteSku(self, operatorId, id)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}

	def getCompleteSku(self, id):
		r = self.client.getCompleteSku(self, id)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}

	def mapCompleteSku(self, ids):
		r = self.client.mapCompleteSku(self, ids)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}

	def mapProductsBySkuId(self, ids):
		r = self.client.mapProductsBySkuId(self, ids)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}