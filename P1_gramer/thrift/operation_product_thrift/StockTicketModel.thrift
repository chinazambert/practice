include "CommonModel.thrift"
include "ComponentModel.thrift"
include "Model.thrift"

namespace java com.sankuai.sjst.m.operation.product.model.stock

// 查询订单列表条件
struct QueryOrdersConditionTO {
    // keyword eg:1.订单号;2.客户名称;3.BD姓名;
    1: optional string keyword;
}

// 海鸥订单信息
struct OpMOrderItemTO {
    1: required i64 id;
    2: optional string customerName;
    3: optional Model.OpEmployeeTO employee;
    4: optional i64 createdTime;
}

//////////////////////////////////////////////////////////////
########### 新增出入库单使用 ##################
struct OpPurchaseTicketForStockTO {
    1: required i64 purchaseTicketId;
    2: optional Model.OpEmployeeTO creator;
    3: optional i64 purchaseTime;
    4: optional list<Model.OpProductItemTO> products;
    5: optional string remark;
}

########### 新增出入库单使用 ##################
struct OpTransferTicketForStockTO {
    1: required i64 transferTicketId;
    2: optional string warehouseName;
    3: optional Model.OpEmployeeTO creator;
    4: optional i64 createdTime;
    5: optional list<Model.OpProductItemTO> products;
}

//////////////////////////////////////////////////////////////
// 入库类型/出库类型
struct OpStockTypeTO {
    1: required i32 id;
    2: required string name;
    3: optional bool manual;
}

// 订单来源类型
struct OpMOrderTypeTO {
    1: required i32 id;
    2: required string name;
}

// 待提交的产品信息
struct OpInitProductItemTO {
    1: optional i64 ticketDetailId;
    2: required i32 productId;
    3: optional i64 poiId;
    4: optional i32 genuineAmount;
    5: optional i32 sampleAmount;
    6: optional i32 depreciationAmount;
    7: optional i32 damageAmount;
}

// 草稿、入库单/出库单详细信息
struct OpStockTicketDetailTO {
    1: required i64 id;
    2: optional i64 stockTime;
    3: optional Model.OpWarehouseTO warehouse;
    4: optional OpStockTypeTO stockType;
    5: optional OpMOrderTypeTO mOrderType;
    6: optional string referTicketId;
    // 采购单信息
    7: optional OpPurchaseTicketForStockTO purchaseTicket;
    // 调拨单信息
    8: optional OpTransferTicketForStockTO transferTicket;
    // 订单信息（海鸥/TASK工单）
    9: optional OpMOrderItemTO orderItem;
    // 领用人
    10: optional Model.OpEmployeeTO taker;
    11: optional list<Model.OpProductItemTO> products;
    12: optional string remark;
    13: optional list<Model.OpAttachmentItemTO> attachments;
    14: optional Model.OpEmployeeTO creator;
    15: optional i64 createdTime;
    16: optional Model.OpPrivilegeTO privilege;
}


// 查询列表条件
struct OpQueryStockTicketsConditionTO {
    // 入/出库单号
    1: optional i64 id;
    // 入/出库日期起始
    2: optional i64 stockTimeStart;
    // 入/出库日期结束
    3: optional i64 stockTimeEnd;
    // 入/出库类型
    4: optional i32 stockTypeId;
    // 库房id
    5: optional i32 warehouseId;
    // 大区id
    6: optional i32 regionOrgId
    // 区域id
    7: optional i32 areaOrgId
    // 快捷筛选范围 eg: 0.all 1.draft
    8: optional i32 scope;
    // 入库或出库 eg: 1.入库 2.出库
    9: required i32 stockInOrOut;
}


// 草稿、入库单/出库单item信息
struct OpStockTicketItemTO {
    1: required i64 id;
    2: optional i64 stockTime;
    3: optional Model.OpWarehouseTO warehouse;
    4: optional OpStockTypeTO stockType;
    5: optional Model.OpEmployeeTO modifier;
    6: optional i64 modifiedTime;
    7: required Model.OpPrivilegeTO privilege;
}

// 未完成采购单详细信息
struct OpUnfinishPurchaseTicketDetailTO {
    1: required i64 id;
    2: optional Model.OpEmployeeTO creator;
    3: optional i64 purchaseTime;
    4: optional list<Model.OpProductItemTO> productItems;
}

// 未完成调拨单详细信息
struct OpUnfinishTransferTicketDetailTO {
    1: required i64 id;
    2: optional Model.OpWarehouseTO warehouse;
    3: optional Model.OpEmployeeTO creator;
    4: optional i64 transferTime;
    5: optional list<Model.OpProductItemTO> productItems;
}

//////////////////////////////////////////////////////////////
// 获取全部入库类型返回值
struct OpStockInTypeResp {
    1: required CommonModel.Status status;
    2: required list<OpStockTypeTO> stockInTypes;
}

// 获取全部出库类型返回值
struct OpStockOutTypeResp {
    1: required CommonModel.Status status;
    2: required list<OpStockTypeTO> stockOutTypes;
}

// 获取全部订单来源类型返回值
struct OpMOrderTypeResp {
    1: required CommonModel.Status status;
    2: required list<OpMOrderTypeTO> mOrderTypes;
}

// 提交入库单/出库单请求
struct OpSaveStockTicketReq {
    // 入库单/出库单id
    1: optional i64 id;
    // 入库单/出库单日期
    2: optional i64 stockTime;
    // 库房id
    3: required i32 warehouseId;
    // 入/出库房类型
    4: optional i32 stockTypeId;
    // 退货订单类型
    5: optional i32 orderTypeId;
    // 涉及到的单据（采购单、调拨单、盘点单、退货订单）id
    6: optional string referTicketId;
    // 产品信息
    7: optional list<OpInitProductItemTO> products;
    // 附件
    8: optional list<Model.OpAttachmentItemTO> attachments;
    // 备注
    9: optional string remark;
    // 是否提交
    10: required bool publish;
    // 领用人id
    11: optional i32 takerId;
    // 数据库版本号
    12: optional i32 version;
    // 标记出库或入库 eg:1.入库;2.出库
    13: required i32 stockInOrOut;
}

// 创建/编辑草稿、入库单/出库单返回值
struct OpSaveStockTicketResp {
    1: required CommonModel.Status status;
    2: optional i64 id;
}

// 删除草稿、入库单/出库单返回值
struct OpDeleteStockTicketResp {
    1: required CommonModel.Status status;
}

// 获取草稿、入库单/出库单详情返回值
struct OpGetStockTicketResp {
    1: required CommonModel.Status status;
    2: optional OpStockTicketDetailTO stockTicket;
    3: required i32 version;
}

// 查询草稿、入库单/出库单列表请求
struct OpQueryStockTicketsReq {
    1: required OpQueryStockTicketsConditionTO condition;
    2: required CommonModel.PageTO page;
    3: optional list<CommonModel.FieldSortTO> fieldSorts;
}

// 获取草稿、入库单/出库单列表返回值
struct OpQueryStockTicketsResp {
    1: required CommonModel.Status status;
    2: optional i64 total;
    3: optional list<OpStockTicketItemTO> stockTickets;
    4: optional i64 draftCount;
    5: optional Model.OpPrivilegeForTicketsTO privilege;
}

// 根据库房号，获取采购单信息列表请求
struct OpQueryPurchaseTicketsByWarehouseIdReq {
    1: required i32 warehouseId;
    2: required CommonModel.PageTO page;
    3: optional list<CommonModel.FieldSortTO> fieldSorts;
}

// 根据库房号，获取未完成采购单信息列表返回值
struct OpQueryPurchaseTicketsByWarehouseIdResp {
    1: required CommonModel.Status status;
    2: optional i64 total;
    3: optional list<OpPurchaseTicketForStockTO> purchaseTickets;
}

// 根据库房号，获取调拨单信息列表请求
struct OpQueryTransferTicketsByWarehouseIdReq {
    1: required i32 warehouseId;
    2: optional CommonModel.PageTO page;
    3: optional list<CommonModel.FieldSortTO> fieldSorts;
}

// 根据库房号，获取调拨单信息列表返回值
struct OpQueryTransferTicketsByWarehouseIdResp {
    1: required CommonModel.Status status;
    2: optional i64 total;
    3: optional list<OpTransferTicketForStockTO> transferTickets;
}

// 根据库房号，获取单据（草稿）个数返回值
struct OpCountStockTicketsResp {
    1: required CommonModel.Status status;
    2: optional i32 count;
}

//////////////////////////////////////////////////////////////
// 模糊搜索海鸥订单列表请求
struct OpQueryMOrdersReq {
    1: optional QueryOrdersConditionTO condition;
    2: optional CommonModel.PageTO page;
    3: optional list<CommonModel.FieldSortTO> fieldSorts;
}

// 模糊搜索海鸥订单列表返回值
struct OpQueryMOrdersResp {
    1: required CommonModel.Status status;
    2: optional list<OpMOrderItemTO> OpMOrderItems;
}

// 获取订单商品对应的产品明细
struct OpQueryMOrderProductsResp {
    1: required CommonModel.Status status;
    2: optional list<Model.OpProductItemTO> opProductItem;
}
