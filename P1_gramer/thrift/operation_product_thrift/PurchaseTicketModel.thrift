include "CommonModel.thrift"
include "ComponentModel.thrift"
include "Model.thrift"

namespace java com.sankuai.sjst.m.operation.product.model.purchase

############ 创建和修改采购单和采购单商品明细相关 ###########
struct OpPurchaseTicketDetailFormTO {
    //产品id
    1:required i32 productId;
    //采购数量
    3:required i32 genuineAmount;
    //采购单详细id
    4:optional i32 purchaseTicketDetailId;
}

struct OpWarehousePurchaseTicketDetailFormTO {
    //库房id
    1:required i32 warehouseId;
    2:required list<OpPurchaseTicketDetailFormTO> opPurchaseTicketDetailFormTOs;
}

struct OpSavePurchaseTicketReq {
    //采购单id
    1:optional i64 purchaseTicketId;
    //是否提交
    2:required bool publish;
    //备注
    3:optional string remark;
    //附件
    4:optional list<Model.OpAttachmentItemTO> attachments;
    //版本号
    5:optional i32 version;
    //仓库商品明细列表
    8:required list<OpWarehousePurchaseTicketDetailFormTO> opWarehousePurchaseTicketDetailFormTO;
}

struct OpCreatePurchaseTicketResp {
    1:required CommonModel.Status status;
    2:optional i64 id;
}

struct OpModifyPurchaseTicketResp {
    1:required CommonModel.Status status;
    2:optional bool result;
}


############ 创建和修改采购单记录 #############
struct OpPurchaseTicketOrderFormTO {
    //采购单记录id
    1:optional i64 purchaseTicketOrderId;
     //产品id
    2:required i32 productId;
    //采购价格
    3:required i32 cost;
    //采购数量
    4:required i32 genuineAmount;
    //供应商
    5:required i32 supplier;
}

struct OpSavePurchaseTicketOrderReq {
    //采购单号
    1:required i64 purchaseTicketId;
    //采购时间
    2:required i64 purchaseTime;
    //采购记录
    4:list<OpPurchaseTicketOrderFormTO> purchaseTicketOrderFormTOs;
    //版本号
    5:optional i32 version;
}

struct OpCreatePurchaseTicketOrderResp {
    1:required CommonModel.Status status;
}


struct OpModifyPurchaseTicketOrderResp {
    1:required CommonModel.Status status;
    2:optional bool result;
}


############## 采购单详情 #############
//商品明细项
struct OpPurchaseProductItemTO {
    //商品id
    1:required i32 productId;
    //品牌
    2:optional string brand;
    //名称
    3:required string name;
    //型号
    4:optional string model;
    //单位
    5:optional string unit;
    //采购数量
    6:optional i32 purchaseAmount;
    //入库数量
    7:optional i32 stockInCount;
    //采购单详情id
    8:optional i64 purchaseTicketDetailId;
}
//入库单
struct OpPurchaseStockInTicketTO {
    //入库单id
    1:required i64 id;
    //入库日期
    2:required i64 stockTime;
}

//仓库商品明细项
struct OpWarehouseProductDetailItemTO {
    //仓库
    1:required Model.OpWarehouseTO warehouseTO;
    //商品
    2:required list<OpPurchaseProductItemTO> purchaseProductItemTOs;
    //入库单
    5:optional list<OpPurchaseStockInTicketTO> stockOutTicketTOs;
    //是否完成入库 0 - 否 1 - 是
    6:required i32 isCompleteStock;
    //是否有已经完成入库单
    7:optional i32 haveCompleteStock;
}


//采购单记录详情项
struct OpPurchaseTicketOrderItemTO {
    //采购单订单项商品信息
    1:required OpPurchaseProductItemTO purchaseProductItemTO;
    //供应商
    3:optional Model.OpSupplierTO supplierTO;
    //采购价
    4:optional i32 cost;
    //总金额
    5:optional i32 totalCost;
    //采购单订单id
    6:required i64 purchaseTicketOrderId;

}

//采购单详情权限
struct OpPurchaseTicketDetailPrivilegeTO {
    //删除采购单
    1:required bool deletePurchaseTicket;
    //修改采购单商品明细
    2:required bool modifyPurchaseTicket;
    //修改采购单记录
    3:required bool modifyPurchaseTicketOrder;
}

struct OpPurchaseTicketDetailTO {
    //采购单号
    1:required i64 purchaseTicketId;
    //采购时间
    2:required i64 purchaseTime;
    //商品明细及入库进度
    3:required list<OpWarehouseProductDetailItemTO> warehouseProductDetailItemTOs;
    //供应商和采购价
    4:optional list<OpPurchaseTicketOrderItemTO> purchaseTicketOrderTOs;
    //附件
    5:optional list<Model.OpAttachmentItemTO> attachmentItemTOs;
    //备注
    8:optional string remark;
    //采购单状态
    9:required Model.OpTicketStatusTO ticketStatusTO;
    //创建人
    10:required Model.OpEmployeeTO creator;
    //创建时间
    11:required i64 createdTime;
    //权限
    12:required OpPurchaseTicketDetailPrivilegeTO purchaseTicketDetailPrivilegeTO;
}

struct OpGetPurchaseTicketDetailResp {
   1:required CommonModel.Status status;
   2:optional OpPurchaseTicketDetailTO  purchaseTicketDetailTO;
}


############# 查询采购单 #######################
//列表数据结构
struct OpQueryPurchaseTicketConditionTO {
    //开始时间
    1:optional i64 purchaseStartTime;
    //结束时间
    2:optional i64 purchaseEndTime;
    //库房id
    3:optional i32 warehouseId;
    //采购单号
    4:optional i64 purchaseTicketId;
    //状态 -- 点击草稿箱时,传对应的status
    5:optional i32 status;
    //是否填写采购记录 1 - 没有填写 2 - 填写了
    6:optional i32 hasOrder;
}

struct OpQueryPurchaseTicketReq {
    //搜索参数
   1:required OpQueryPurchaseTicketConditionTO  queryPurchaseTicketConditionTO;
   //分页参数
   2:required CommonModel.PageTO pageTO;
   //排序规则
   3: required list<CommonModel.FieldSortTO> fieldSorts;
}

struct OpPurchaseTicketItemPrivilegeTO {
    //查看详情
    1:required bool getPurchaseTicketDetail;
    //填写采购记录
    2:required bool createPurchaseTicketOrder;
    //编辑草稿
    3:required bool modifyPurchaseTicketDraft;
    //删除草稿
    4:required bool deletePurchaseTicketDraft;
}

struct OpPurchaseTicketItemTO {
    //采购单id
    1:required i64 purchaseTicketId;
    //采购日期
    2:optional i64 purchaseTime;
    //库房信息
    3:required list<Model.OpWarehouseTO> WarehouseTOs;
    //备注
    4:optional string remark;
    //最后操作人
    5:required Model.OpEmployeeTO modifier;
    //最后修改时间
    7:required i64 modifiedTime;
    //操作权限
    8:required OpPurchaseTicketItemPrivilegeTO privilegeTO;
    //状态
    9:required Model.OpTicketStatusTO ticketStatus;
}

struct OpQueryPurchaseTicketResp {
    1:required CommonModel.Status status;
    2:required list<OpPurchaseTicketItemTO> purchaseTicketItemTOs;
    3:optional i64 total;
    4: optional Model.OpPrivilegeForTicketsTO privilege;
}

############ 删除采购单 ####################
struct OpDeletePurchaseTicketResp {
    1:required CommonModel.Status status;
    2:optional bool result;
}

########### 单独获取商品明细详情 ###############
struct OpPurchaseTicketProductDetailPrivilegeTO {
    //保存草稿
    1:required bool saveDraft;
    //提交
    2:required bool commit;
}

struct OpPurchaseTicketProductDetailTO{
    //库房商品明细
    1:required list<OpWarehouseProductDetailItemTO> warehouseProductDetailItemTOs;
    //附件
    2:optional list<Model.OpAttachmentItemTO> attachmentItemTO;
    //备注
    3:optional string remark;
    //采购单id
    4:required i64 purchaseTicketId;
    //权限
    5:required OpPurchaseTicketProductDetailPrivilegeTO privilegeTO;
    //版本号
    6:required i32 version;
}

struct OpGetPurchaseTicketProductDetailResp {
    1:required CommonModel.Status status;
    2:optional OpPurchaseTicketProductDetailTO purchaseTicketProductDetail;
}

########## 单独获取采购记录详情 ###############
struct OpPurchaseTicketOrderDetailTO {
    //采购单号
    1:required i64 purchaseTicketId;
    //采购时间
    2:optional i64 purchaseTime;
    //提交人
    3:optional Model.OpEmployeeTO submitter;
    //供应商和采购价
    4:optional list<OpPurchaseTicketOrderItemTO> purchaseTicketOrderTOs;
    //提交时间
    5:optional i64 submitTime;
    //版本号
    6:required i32 version;
}

struct OpGetPurChaseTicketOrderResp  {
    1:required CommonModel.Status status;
    2:optional OpPurchaseTicketOrderDetailTO purchaseTicketOrderDetailTO;
}


########### 计算草稿箱和未填写采购记录数目 ##################
struct OpCountPurchaseTicketReq {
    //状态
    1:optional i32 status;
    //是否填写采购记录 1 - 没有填写 2 - 填写了
    2:optional i32 hasOrder;

}

struct OpCountPurchaseTicketResp {
    1:required CommonModel.Status status;
    2:required i32 num;
}

########## 获取初始采购记录 #######################
struct OpGetInitPurchaseTicketOrderResp {
    1:required CommonModel.Status status;
    2:optional OpPurchaseTicketOrderDetailTO purchaseTicketOrderDetailTO;
}









