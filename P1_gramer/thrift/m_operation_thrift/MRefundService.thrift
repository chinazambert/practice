namespace java com.sankuai.sjst.m.operation.thrift.service

include "OrderSearchModel.thrift"
include "OrderEnumsModel.thrift"
include "OrderDetailModel.thrift"
include "OrderAuditModel.thrift"
include "OrgModel.thrift"
include "MRefundModel.thrift"
include "CommonModel.thrift"

// 退款服务
service MRefundThriftService{
    // 请求退款接口
    MRefundModel.MRefundResp refund(1:required MRefundModel.MRefundReq mRefundReq);

    // 查询订单退款历史接口
    MRefundModel.GetOrderRefundInfoResp getOrderRefundInfo(1:required i64 orderId);
}