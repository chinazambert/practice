include "CommonModel.thrift"
include "ComponentModel.thrift"
include "Model.thrift"

namespace java com.sankuai.sjst.m.operation.product.model.count

// 列表数据结构
struct OpQueryCountTicketsConditionTO {
    // 单据Id
    1: optional i64 id;
    // 盘点时间，开始
    2: optional i64 countTimeStart;
    // 盘点时间，结束
    3: optional i64 countTimeEnd;
    // 库房
    4: optional i32 warehouseId;
    // 0:all, 1:draft
    5: optional i32 scope;
}
struct OpQueryCountTicketsReq {
    1: required OpQueryCountTicketsConditionTO condition;
    2: required CommonModel.PageTO page;
    3: required list<CommonModel.FieldSortTO> fieldSorts;
}

struct OpCountTicketItemTO {
    // 产品Id
    1: required i64 id;
    // 盘点时间
    2: required i64 countTime;
    // 库房
    3: required Model.OpWarehouseTO warehouse;
    // 单据状态
    5: required Model.OpTicketStatusTO ticketStatus;
    // 权限
    4: required Model.OpPrivilegeTO privilege;
    // 最后修改人
    6: required Model.OpEmployeeTO modifier;
    // 最后修改时间
    7: required i64 modifiedTime;
}
struct OpQueryCountTicketsResp {
    1: required CommonModel.Status status;
    2: optional i64 total;
    3: optional i64 draftTotal;
    4: optional list<OpCountTicketItemTO> countTickets;
    5: optional Model.OpPrivilegeForTicketsTO privilege;
}

// 详情数据结构
struct OpGetCountTicketDetailTO {
    // 单据Id
    1: required i64 id;
    // 盘点时间
    2: required i64 countTime;
    // 库房
    3: required Model.OpWarehouseTO warehouse;
    // 产品
    4: required list<Model.OpProductItemTO> products;
    // 备注
    5: required string remark;
    // 附件
    6: required list<Model.OpAttachmentItemTO> attachments;
    // 单据状态
    7: required Model.OpTicketStatusTO ticketStatus;
    // 权限
    8: required Model.OpPrivilegeTO privilege;
    // 最后修改人
    9: required Model.OpEmployeeTO modifier;
    // 最后修改时间
    10: required i64 modifiedTime;
}

struct OpGetCountTicketDetailResp {
    1: required CommonModel.Status status;
    2: optional OpGetCountTicketDetailTO detail;
}

// 新增数据结构
struct OpGetProductsByWarehouseResp {
    1: required CommonModel.Status status;
    2: optional list<Model.OpProductItemTO> products;
}

// 编辑数据结构
struct OpEditCountTicketTO {
    // 单据Id
    1: required i64 id;
    // 盘点时间
    2: required i64 countTime;
    // 库房Id
    3: required i32 warehouseId;
    // 产品
    4: required list<Model.OpProductItemTO> products;
    // 备注
    5: required string remark;
    // 附件
    6: required list<Model.OpAttachmentItemTO> attachments;
    // 单据状态
    7: required Model.OpTicketStatusTO ticketStatus;
    // 权限
    8: required Model.OpPrivilegeTO privilege;
    // 乐观锁
    9: required i32 version;
}

struct OpEditCountTicketResp {
    1: required CommonModel.Status status;
    2: optional OpEditCountTicketTO countTicket;
}

// 保存
struct OpProductCountItemTO {
    // 产品Id
    1: required i32 id;
    // 当前正品数量
    2: required i32 curGenuineAmount;
    // 当前样品数量
    3: required i32 curSampleAmount;
    // 当前折旧数量
    4: required i32 curDepreciationAmount;
    // 当前损坏数量
    5: required i32 curDamageAmount;
    // 原正品数量
    6: required i32 orgGenuineAmount;
    // 原样品数量
    7: required i32 orgSampleAmount;
    // 原折旧数量
    8: required i32 orgDepreciationAmount;
    // 原损坏数量
    9: required i32 orgDamageAmount;
}

struct OpSaveCountTicketReq {
    // 单据Id
    1: optional i64 id;
    // 盘点时间
    2: optional i64 countTime;
    // 库房Id
    3: required i32 warehouseId;
    // 盘点
    4: required list<OpProductCountItemTO> counts;
    // 附件
    5: required list<Model.OpAttachmentItemTO> attachments;
    // 备注
    6: optional string remark;
    // true保存正式，false保存草稿
    7: required bool publish;
    // 版本
    8: optional i32 version;
}

struct OpSaveCountTicketResp {
    1: required CommonModel.Status status;
    2: optional i64 id;
}

struct OpDeleteCountTicketResp {
    1: required CommonModel.Status status;
    2: optional bool result;
}
