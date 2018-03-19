namespace java com.sankuai.sjst.m.operation.thrift.model.order.detail

include "Status.thrift"
include "OpCustomerModel.thrift"

# 门店联系人/销售员/实施员
struct ContactInfoTO {
    1:required string name;
    2:required string phone;
}

# 门店派单安装信息
struct PoiDispatchInfoTO {
    // 预约安装起始时间
    1:required i64 installBeginTime;
    // 预约安装结束时间
    2:required i64 installEndTime;
    // 服务商确认安装时间
    3:optional i64 actualInstallTime;
    // 备注（已弃用，改为 OrderDetailTO中 的 remark）
    4:optional string remark;
    // 实施员联系信息
    5:optional ContactInfoTO executantContactInfo;
}

struct PoiDeviceTO {
    // 硬件名称
    1:required string name;
    // 硬件数量
    2:required i32 amount;
}

# 门店信息
struct PoiInfoTO {
    // 门店编号
    1:required i64 poiId;
    // 门店名称
    2:required string name;
    // 门店联系人
    3:required list<ContactInfoTO> poiContacts;
    // 门店品类
    4:optional string poiCategory;
    // 门店属性
    5:optional string poiType;
    // 门店楼层
    6:optional i32 poiFloor;
    // 门店面积
    7:optional string poiAreaText;
    // 开业状态
    8:optional string poiCloseStatus;
    // 网络状态
    9:optional string poiNetworkStatus;
    // 现有硬件
    10:optional list<PoiDeviceTO> poiExistingHardware;
    // 门店派单信息
    12:optional PoiDispatchInfoTO poiDispatchInfo;
}

struct OpPaymentRecordTO {
    // 支付时间（毫秒）
    1:required i64 paymentTime;
    // 交易流水号
    2:optional string outNo;
    // 汇款账户（对应 银行汇款 支付方式）
    3:optional string paymentAccount;
    // 汇款账户名称（对应 银行汇款 支付方式）
    4:optional string paymentAccountName;
    // 汇款银行（对应 银行汇款 支付方式）
    5:optional string paymentBankName;
    // 付款金额
    6:required i64 fee;
    // 流水号
    7:optional i64 id;
    // 收款主体
    8:optional i32 receiptAccountId;
    // 线下支付图片
    9:optional list<string> images;
    // 支行
    10:optional string paymentBankBranchName;
    11:optional i64 createdTime;
    12:optional string remark;
}

# 支付记录
struct OpPaymentTaskTO {
    // 支付类型：线下 / 线上
    1:required string type;
    // 支付方式：微信 / 银行汇款
    2:required string paymentType;
    // 收款主体，交易流水号
    3: optional list<OpPaymentRecordTO> payRecords;
}

# 合同信息
struct ContractInfoTO {
    // 合同编号
    1:required string contractId;
    // 合同类型
    2:required string contractType;
    // 合同照片
    3:optional list<string> contractPictures;
}

# 订单商品详情
struct ItemInfoTO {
    // 商品标题
    1:required string title;
    // 商品数量
    2:required i32 amount;
    // 商品单价
    3:required i64 unitPrice;
    // 商品单位
    4:required string unit;
    // 商品子订单ID
    5:required i64 itemOrderId;
    // 退款商品数
    6:optional i32 refundAmount;
    7:optional i64 poiId;
    8:optional string poiName; // 沿用原来扁平的风格
    9:optional string poiAddress;
    // 成交价格
    10:optional i64 finalUnitPrice;
    //商品id
    11:optional i32 itemId;
    12:optional i64 costPrice;
}

# 订单商品二级品类聚合
struct ItemsGroupBySecondCategory {
    1:required string secondCategoryName;
    2:required list<ItemInfoTO> items;
}

struct SoftwareTypeTO {
    1:required i32 id;
    2:required string name;
}

# 订单商品一级品类聚合
struct ItemsGroupByTopCategory {
    1:required string topCategoryName;
    2:required list<ItemsGroupBySecondCategory> itemsGroupBySecondCategories;
    3:optional list<SoftwareTypeTO> softwareTypes;
}

# 订单审核记录
struct OrderAuditRecordTO {
    // 审核结果
    1:required i32 result;
    // 审核时间
    2:required i64 auditTime;
    // 审核人姓名
    3:required string auditorName;
    // 拒绝原因
    4:optional string rejectreason;
}

struct OrderDetailTO {
    // 订单编号
    1:required i64 orderId;
    // 所属客户
    2:optional string customerName;
    // 销售员
    3:optional ContactInfoTO bdContactInfo;
    // 签单时间（毫秒）
    4:required i64 signTime;
    // 订单门店信息
    5:optional list<PoiInfoTO> orderPoisInfo;
    // 订单合同信息
    6:optional ContractInfoTO orderContractInfo;
    // 订单商品信息
    7:optional list<ItemsGroupByTopCategory> orderItems;
    // 订单总额（分）
    8:required i64 orderTotalPrice;
    // 折后金额（分）
    9:required i64 finalPrice;
    // 付款方式
    10:required string orderPayType;
    // 首款金额（分）
    11:optional i64 advancePrice;
    // 尾款金额（分）
    12:optional i64 tailPrice;
    // 尾款期限（毫秒）
    13:optional i64 tailTime;
    // 首款or全款支付记录
    14:optional OpPaymentTaskTO advancePricePaymentRecord;
    // 尾款支付记录
    15:optional OpPaymentTaskTO tailPricePaymentRecord;
    // 订单完成时间（毫秒）
    16:optional i64 finishTime;
    // 订单状态
    17:required i32 orderStatus;
    // 订单状态文本描述
    18:required string orderStatusText;
    // 该订单最后一次完成的审核记录
    19:optional OrderAuditRecordTO lastFinishedOrderAudit;
    // 订单备注
    20:optional string remark;
    21:optional OpCustomerModel.OpCustomerTO customer;
    //提交审核时间
    22:optional i64 auditTime;
}

struct OrderDetailResp {
    1:required Status.Status status;
    2:optional OrderDetailTO orderDetail;
}

struct OpReceiptAccountTO {
    1:optional i32 id;
    2:optional string accountName;
}

struct OpGetReceiptAccountsResp {
    1:required Status.Status status;
    2:required list<OpReceiptAccountTO> accounts;
}

struct OpSavePayRecordReq {
    // 收款主体，交易流水号
    1:optional i64 id;
    2:optional string outNo;
    3:optional i32 receiptAccountId;
    4:optional i64 orderId;
}

struct OpSaveOfflinePayRecordResp {
    1:required Status.Status status;
}

# 订单转单原因
struct GetTransferOrderReasonsResp {
    1:required Status.Status status;
    2:required list<string> reasons;
}

# 订单转单
struct TransferOrderReq {
    1:required i64 orderId;
    2:required i32 newEmpId;
    3:required string reason;
    4:optional string reasonDetail;
}

# 订单批量转单
struct BatchTransferOrderReq {
    1:required list<i64> orderIds;
    2:required i32 newEmpId;
    3:required string reason;
    4:optional string reasonDetail;
}

struct OrderOperationFailureTO {
    1:required i64 orderId;
    2:required string reason;
}

struct BatchTransferOrderResp {
    1:required Status.Status status;
    2:optional list<OrderOperationFailureTO> failureTOs;
}

struct OrderOperateRecordTO {
    //操作人
    1:required string operator;
    //操作
    2:required string operation;
    //操作时间
    3:required i64 time;
    //备注
    4:optional string remark;
}

# 订单操作记录
struct QueryOrderOperateRecordsResp {
    1:required Status.Status status;
    2:required list<OrderOperateRecordTO> orderOperateRecordsTO;
}

