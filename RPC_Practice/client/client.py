# -*- coding=utf-8 -*-

__authors__ = [
    '"zhaobo" <zhaobo06@meituan.com>',
]

from thrift.transport import TSocket
from thrift.protocol import TBinaryProtocol
from thrift.transport import TTransport
from RPC_Practice.empService import empService
from RPC_Practice.empService.empService import Client


__HOST = '127.0.0.1'
__PORT = '8080'

tsoct = TSocket.TSocket(__HOST, __PORT)
trans = TTransport.TBufferedTransport(tsoct)
proc = TBinaryProtocol.TBinaryProtocol(trans)
client = Client(proc)

name = 'zhaobo'
trans.open()

print(client.getEmpByName(name).text)
