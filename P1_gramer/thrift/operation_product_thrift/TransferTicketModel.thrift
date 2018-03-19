include "CommonModel.thrift"
include "ComponentModel.thrift"
include "Model.thrift"

namespace java com.sankuai.sjst.m.operation.product.model.transfer

struct OpTransferStockDetailTO{
    // 出入库单号
    1:required i64 stockTicketId;
    // 出入库时间
    2:required i64 modifiedTime;
}
struct OpTransferProductTO{
    // 设备ID
    1:required i32 productId;
    // 调拨数量
    2:required i32 amount;
    // 产品名称
    3:optional string name;
    // 产品单位
    4:optional string unit;
    // 品牌
    5:optional string brand;
    // 型号
    6:optional string model;
    // 已出库数量
    7:optional i32 stockOutAmount;
    // 已入库数量
    8:optional i32 stockInAmount;
}

struct OpTransferTicketFormTO{
    // 是否草稿
    1:required bool draft;
    // 数据版本 创建时传0
    2:required i32 version
    // 调拨日期
    3:optional i64 transferDate;
    // 出库仓库ID
    4:optional i32 stockOutWarehouseId;
    // 入库仓库ID
    5:optional i32 stockInWarehouseId;
    // 调拨商品
    6:optional list<OpTransferProductTO> transferProductTOs;
    // 附件
    7:optional list<Model.OpAttachmentItemTO> attachmentItemTOs;
    // 备注
    8:optional string remark;
}

struct OpTransferTicketTO{
    1:required i64 transferTicketId;
    // 调拨日期
    2:optional i64 transferDate;
    // 出库仓库
    3:optional Model.OpWarehouseTO stockOutWarehouse;
    // 入库仓库
    4:optional Model.OpWarehouseTO stockInWarehouse;
    // 调拨商品
    5:optional list<OpTransferProductTO> transferProductTOs;
    // 附件
    6:optional list<Model.OpAttachmentItemTO> attachmentItemTOs;
    // 备注
    7:optional string remark;
    // 调拨状态
    8:required CommonModel.PairTO status;
    // 创建人
    9:required Model.OpEmployeeTO creator;
    // 最后修改人
    10:required Model.OpEmployeeTO modifier;
    // 最后修改时间
    11:required i64 modifiedTime;

    12:required i64 createdTime;
    // 数据版本
    13:required i32 version;
    // 调拨出库单
    14:optional list<OpTransferStockDetailTO> stockOutDetailTOs;
    // 调拨入库单
    15:optional list<OpTransferStockDetailTO> stockInDetailTOs;
}

struct OpQueryTransferTicketsReq{
    // 调拨时间开始区间
    1:optional i64 startTransferDate;
    // 调拨时间结束区间
    2:optional i64 endTransferDate;
    // 调拨状态
    3:optional i32 status;
    // 出库仓库ID
    4:optional i32 stockOutWarehouseId;
    // 入库仓库
    5:optional i32 stockInWarehouseId;
    // 调拨单ID
    6:optional i64 transferTicketId;
}

struct OpCreateTransferTicketResp{
    1:required CommonModel.Status status;
    2:optional i64 transferTicketId;
}

struct OpGetTransferTicketResp{
    1:required CommonModel.Status status;
    2:optional OpTransferTicketTO transferTicketTO;
}

struct OpQueryTransferTicketsResp{
    1:required CommonModel.Status status;
    // 草稿箱数量
    2:optional i32 draftCount;
    3:optional list<OpTransferTicketTO> transferTicketTOs;
    4:optional i32 total;
    5: optional Model.OpPrivilegeForTicketsTO privilege;
}


