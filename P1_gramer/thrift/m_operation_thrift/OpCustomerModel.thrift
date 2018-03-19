namespace java com.sankuai.sjst.m.operation.thrift.model.customer

include "Status.thrift"
include "CommonModel.thrift"
include "Model.thrift"

struct OpQueryCustomerConditionTO {
    // 关键字
    1: optional string keyword;
    // 创建时间下界
    2: optional i64 createTimeLowerBound;
    // 创建时间上界
    3: optional i64 createTimeUpperBound;
}

struct OpQueryCustomerReq {
    1: required OpQueryCustomerConditionTO condition;
    2: required Model.PageTO page;
}

struct OpCustomerItemTO {
    1: required i64 id;
    2: required string name;
    3: required string phone;
    4: required i32 tenantCount;
    5: required i32 orderCount;
    6: required i64 createdTime;
}

struct OpQueryCustomerResp {
    1: required Status.Status status;
    2: optional i64 total;
    3: optional i32 page;
    4: optional list<OpCustomerItemTO> customers;
}

struct OpCustomerTO {
    1: optional i64 id;
    2: required string name;
    3: required string address;
    4: required string contactName;
    5: required string contactPhone;
    6: optional CommonModel.PairTO source;
}

struct OpGetCustomerResp {
    1: required Status.Status status;
    2: optional OpCustomerTO customer;
}

struct OpSaveCustomerResp {
    1: required Status.Status status;
    2: optional i64 tenantId;
}

struct OpMapTenantCustomerResp {
    1: required Status.Status status;
    2: required map<i64, OpCustomerTO> customers;
}
