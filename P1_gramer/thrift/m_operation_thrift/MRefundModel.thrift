namespace java com.sankuai.sjst.m.operation.thrift.model.refund

include "Status.thrift"

struct MRefundReq{
    // 订单id
    1:required i64 orderId;
    // key:商品子订单id value:退款商品数
    2:optional map<string,i32> itemOrderAmount;
    // 文件id
    3:required list<string> fileIds;
    // 审核人工号
    4:required i32 creator;
    // 退款金额 单位:分
    5:required i64 fee;
    // 退款理由类型:
    6:required i32 reasonType
    // 退款详细理由
    7:optional string reasonDetail;
    // 签名
    8:required string sign;
}

struct MRefundResp{
    // 前端判断status.code = 59002时 展示未退款金额
    1:required Status.Status status;
    // 已退款金额
   	// status.code = 0 || status.code = 59200时返回已退款金额
    // 0:退款成功；59200:主退款成功
    2:optional i64 refundedFee;
}

// 审核人员信息ReviewerInfoTO
struct ReviewerInfoTO{
    1: required i32 empId;
    2: required string name;
}
// 退款记录
struct RefundRecordTO{
    // 退款金额
    1:required i64 fee;
    // 退款记录id
    2:required i64 refundId;
    // 主退款记录id
    3:required i64 majorRefundId;
    // 退款流水号
    4:required i64 refundNo;
    // 审核人信息
    5:optional ReviewerInfoTO reviewerInfoTO;
    // 审核图片
    6:optional list<string> fileIds;
    // 退款状态
    7:required i32 status;
    // 退款原因
    8:required i32 reasonType;
    // 退款原因详情
    9:optional string reasonDetail;
    // 创建时间
    10:required i64 createdTime;
    // 退款受理时间
    11:optional i64 iphPayRefundtime;
    // 退款成功通知时间
    12:optional i64 notifyTime;

}

struct RefundPoiTO {
    1:required i64 poiId;
    2:required string poiName;
}

// 退款商品信息
struct ItemOrderRefundTO{
    // 商品标题
    1:required string title;
    // 商品数量
    2:required i32 amount;
    // 退款商品子订单ID
    3:required i64 itemOrderRefundId;
    4:optional RefundPoiTO poiTO;
}

// 退款信息
struct OrderRefundInfoTO{
    // 退款记录
    1:required RefundRecordTO refundRecordTO;
    // 退款关联的商品
    2:optional list<ItemOrderRefundTO> itemOrderRefundTOs;
}

struct GetOrderRefundInfoResp{
    1:required Status.Status status;
    2:optional list<OrderRefundInfoTO> orderRefundInfoTOs;
}