namespace java com.sankuai.sjst.m.operation.thrift.service

include "Model.thrift"
include "OpOperationLogModel.thrift"

service OpOperationLogThriftService {
    OpOperationLogModel.QueryObjectLogsResp queryObjectLogs(1: required i64 objectId, 2: required i32 objectType, 3: required Model.PageTO pageTO);

    OpOperationLogModel.AddObjectLogResp addObjectLog(1: required OpOperationLogModel.AddObjectLogReq req);
}
