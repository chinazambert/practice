namespace java com.sankuai.sjst.m.operation.thrift.model.order.audit

include "Status.thrift"

# 订单审核记录
struct AuditRecordTO {
    1:required string auditor;
    2:required string result;
    3:required i64 time;
    4:optional string rejectReason;
}

struct QueryOrderAuditRecordsResp {
    1:required Status.Status status;
    2:optional list<AuditRecordTO> auditRecords;
}