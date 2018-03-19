namespace java com.sankuai.sjst.m.operation.thrift.model.log

include "Status.thrift"
include "Model.thrift"

struct OpEmployeeTO {
    1: required i32 employeeId;
    2: required string login;
    3: required string userName;
}

struct OpActionTO {
    1: required i32 id;
    2: required string name;
}

struct OpOperationLogTO {
    1: required i64 id; // log id
    2: optional OpEmployeeTO operator; // 操作人
    3: optional OpActionTO action; // 动作
    4: required i64 createdTime; // 操作时间
}

struct QueryObjectLogsResp {
    1: required Status.Status status;
    2: required i32 total;
    3: required i32 page;
    4: required list<OpOperationLogTO> logs;
}

struct AddObjectLogReq {
    1: required i64 objectId;
    2: required i32 objectType;
    3: required i32 operator;
    4: required i32 action;
    5: required string payload;
}

struct AddObjectLogResp {
    1: required Status.Status status;
}
