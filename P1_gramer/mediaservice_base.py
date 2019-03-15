
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
sys.path.append(Common_thrift().get_path('m_media_thrift'))


class MediaThriftServiceWizrd(ThriftTool, BaseWizard):
	def __init__(self):
		super(MediaThriftServiceWizrd, self).__init__(
			'MediaService', 'MediaThriftService', 'mall/m_media_thrift' # may need to change 'mall/m_media_thrift' to actual path
		)
		BaseWizard.__init__(self)

	def getPictureInfoByFileId(self, fileId):
		r = self.client.getPictureInfoByFileId(self, fileId)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}

	def listPictureInfoByFileIds(self, fileIds):
		r = self.client.listPictureInfoByFileIds(self, fileIds)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}

	def mapPictureInfoByFileIdsResp(self, fileIds):
		r = self.client.mapPictureInfoByFileIdsResp(self, fileIds)
		print(r)
		return {'status': r.status.code, 'msg': r.status.msg, 'returnInfo': r}