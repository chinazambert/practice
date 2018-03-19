namespace java com.sankuai.sjst.m.operation.thrift.model.org

include "Status.thrift"

struct EmpTO {
    //员工号
    1:required i32 empId;
    //姓名
    2:required string empName;
    //mis号
    3:optional string login;
    //所属组织ID
    4:optional i32 orgId;
    //所属组织名称
    5:optional string orgName;
    //组织ID链
    6:optional string orgPath;
    //组织链名称
    7:optional string orgNamePath;
}

struct OrgTO {
    1:required i32 orgId;
    2:required string orgName;
}

struct QueryChildOrgsAndEmpsResp {
    1:required Status.Status status;
    2:optional list<OrgTO> orgList;
    3:optional list<EmpTO> empList;
}

struct GetEmpResp {
    1:required Status.Status status;
    2:optional EmpTO empTO;
}