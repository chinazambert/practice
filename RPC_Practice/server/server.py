# -*- coding=utf-8 -*-

__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
]

from RPC_Practice.empService import empService
from RPC_Practice.empService import ttypes
from thrift.protocol import TBinaryProtocol
from thrift.transport import TSocket,TTransport
from thrift.server import TServer

__HOST = '127.0.0.1'
__PORT = '8080'

class empServiceHandler(object):
    # 注释

    def getEmpByName(self,name):
        return ttypes.empModel
    def getEmpByeMisNo(self,mis):
        return ttypes.empModel




if __name__ == '__main__':
    handler = empServiceHandler()

    process = empService.Processor(handler)
    trans = TSocket.TServerSocket(__HOST,__PORT)
    tfact = TTransport.TBufferedTransportFactory()
    pfact = TBinaryProtocol.TBinaryProtocolFactory()

    rpcserv = TServer.TSimpleServer(process, trans, tfact, pfact)

    print('Starting rpc server at ', __PORT, ':', __HOST)
    rpcserv.serve()

