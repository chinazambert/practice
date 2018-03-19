include "CommonModel.thrift"

namespace java com.sankuai.sjst.m.operation.product.model

// 仓库
struct OpWarehouseTO {
    1: required i32 id;
    2: required string name;
}

// 员工
struct OpEmployeeTO {
    1: required i32 id;
    2: optional string mis;
    3: optional string name;
}

// 附件
struct OpAttachmentItemTO {
    1: optional i64 id;
    2: required string filename;
    3: required string fileId;
    4: optional string url;
}

// 产品
struct OpProductItemTO {
    // 产品Id
    1: required i32 productId;
    2: required string brand;
    3: required string name;
    4: required string model;
    5: required string unit;
    // 账面数量（采购数量、调拨数量、销售数量）
    6: required i32 orgTotal;
    7: required i32 orgGenuineAmount;
    8: required i32 orgSampleAmount;
    9: required i32 orgDepreciationAmount;
    10: required i32 orgDamageAmount;
    // 实盘数量（已入库数量）
    11: required i32 curTotal;
    12: required i32 genuineAmount;
    13: required i32 sampleAmount;
    14: required i32 depreciationAmount;
    15: required i32 damageAmount;
    16: optional string poiName;
    17: optional i64 poiId;
    18: optional i64 inventoryId;
}

// 权限（单个单据）
struct OpPrivilegeTO {
    1: optional bool opSearch;      // 查看详情
    2: optional bool opSaveDraft;   // 保存草稿
    3: optional bool opDeleteDraft; // 删除草稿
    4: optional bool opSave;        // 提交（保存为正式单）
    5: optional bool opUpdateDraft; // 【新增本行】继续编辑（草稿）
}

// 【新增本struct】权限（列表页）
struct OpPrivilegeForTicketsTO {
    1: optional bool opCreate;  // 新增单据
    2: optional bool opQuery;   // 搜索列表
    3: optional bool opExport;  // 导出
}

//供应商
struct OpSupplierTO {
    1: required i32 id;
    2: required string name;
}

//采购单,入库单,调拨单等单据状态
struct OpTicketStatusTO {
    1: required i32 id;
    2: required string name;
}