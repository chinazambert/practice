include "CommonModel.thrift"

namespace java com.sankuai.sjst.mall.item.model

struct InvWithholdingTO {
    1: required i64 id;
    2: required i64 skuOrderId;
    3: required i64 invId;
    4: required i32 status;
    5: required i32 amount;
    6: required i64 createdTime;
    7: required i64 modifiedTime;
}

struct InventoryTO {
    1: required i64 id;
    2: required i64 skuId;
    3: required i32 status;
    4: required i32 available;
    5: required i32 withholding;
    6: required i32 locked;
    7: required i64 createdTime;
    8: required i64 modifiedTime;
    9: optional list<InvWithholdingTO> withholdings;
}

struct WithholdInventoryReq {
    1: required i64 skuOrderId;
    2: required i64 invId;
    3: required i32 amount;
    4: required i64 skuId; // 兼容
}

struct WithholdInventoriesResp {
    1: required CommonModel.Status status;
}

struct ConsumeWithholdingsResp {
    1: required CommonModel.Status status;
}

struct CancelWithholdingsResp {
    1: required CommonModel.Status status;
}

struct GetInventoryResp {
    1: required CommonModel.Status status;
    2: optional InventoryTO inventoryTO;
}

struct FetchInventoryResp {
    1: required CommonModel.Status status;
    2: optional list<InventoryTO> invetoryTOs;
}

struct MapInventoryResp {
    1: required CommonModel.Status status;
    2: optional map<i64, InventoryTO> invetoryTOMap;
}