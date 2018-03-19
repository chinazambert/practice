include "CommonModel.thrift"
include "Model.thrift"

namespace java com.sankuai.sjst.m.operation.product.model

// 库存列表数据结构
struct QueryInventoryConditionTO {
    //大区
    1: optional i32 regionOrgId;
    //区域
    2: optional i32 areaOrgId;
    //库房
    3: optional i32 warehouseId;
    //商品
    4: optional i32 productId;
}

struct QueryInventoryReq {
    1: required  QueryInventoryConditionTO condition;
    2: required  CommonModel.PageTO page;
}

struct OrgTO {
    1: required i32 id;
    2: required string name;
}

struct InventoryItemTO {
    1: optional OrgTO regionOrg;
    2: optional OrgTO areaOrg;
    3: optional string brand;
    4: optional string productName;
    5: optional string model;
    6: optional string unit;
    7: required i32 genuineAmount;
    8: required i32 sampleAmount;
    9: required i32 depreciationAmount;
    10: required i32 damageAmount;
    11: optional string warehouseName;
}

struct QueryInventoryResp {
    1: required CommonModel.Status status;
    2: optional i64 total;
    3: optional list<InventoryItemTO> inventories;
}

struct QueryWarehouseTicketConditionTO {
    1: optional i32 regionOrgId;
    2: optional i32 areaOrgId;
    3: optional i32 warehouseId;
    //年月
    4: required i64 countTime;
    //1：全部， 2：盘盈，3：盘亏，4：未盘点
    5: required i32 countType;
}
struct QueryWarehouseTicketReq {
    1: QueryWarehouseTicketConditionTO condition;
}


struct CountStatusTO {
    1: optional i32 id;
    2: required string name;
}

struct WarehouseTicketItemTO {
    1: optional OrgTO regionOrg;
    2: optional OrgTO areaOrg;
    3: optional CountStatusTO status;
    4: optional i64 countTime;
    5: optional Model.OpWarehouseTO warehouse;
    6: optional list<Model.OpProductItemTO> products;
}

struct WarehouseTicketStat {
    //未盘点数量
    1: optional i64 unCountAmount;
    //盘盈数量
    2: optional i64 countInAmount;
    //盘亏数量
    3: optional i64 countOutAmount;
}

struct QueryWarehouseTicketResp {
    1: required CommonModel.Status status;
    2: optional list<WarehouseTicketItemTO> warehouseTickets;
    3: optional WarehouseTicketStat warehouseTicketStat;
}

struct ExportDataResp {
    1: required CommonModel.Status status;
    2: optional string url;
}