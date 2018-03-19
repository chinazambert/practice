namespace java com.sankuai.sjst.m.operation.thrift.service

include "OrderSearchModel.thrift"
include "OrderEnumsModel.thrift"
include "OrderDetailModel.thrift"
include "OrderAuditModel.thrift"
include "OrgModel.thrift"
include "MRefundModel.thrift"
include "CommonModel.thrift"

service MOperationThriftService {

    # 搜索订单列表
    OrderSearchModel.OrderSearchResp searchOrders(1:required OrderSearchModel.OrderSearchReq req);

    # 获取订单搜索筛选项列表
    OrderEnumsModel.OrderEnumsListResp getOrderSearchEnumsList();

    # 根据关键字（姓名、mis号、组织节点名）模糊搜索员工或组织结构
    OrderSearchModel.BdOrgSearchResp searchBdsByKeyword(1:required string keyword);

    # 根据姓名模糊搜索实施员
    OrderSearchModel.ExecutantSearchResp searchExecutantsByName(1:required string name);

    # 查询组织结构节点下的子组织结构和员工
    OrgModel.QueryChildOrgsAndEmpsResp queryChildOrgsAndEmps(1:required i32 orgId);

    # 查询订单详情
    OrderDetailModel.OrderDetailResp queryOrderDetail(1:required string orderId);

    # 查询订单审核记录
    OrderAuditModel.QueryOrderAuditRecordsResp queryOrderAuditRecords(1:required string orderId);

    # 获取收款主体
    OrderDetailModel.OpGetReceiptAccountsResp getReceiptAccounts();

    # 保存流水号
    OrderDetailModel.OpSaveOfflinePayRecordResp saveOfflinePayRecord(1: required i32 operatorId, 2: required OrderDetailModel.OpSavePayRecordReq req);

    # 获取订单转单原因
    OrderDetailModel.GetTransferOrderReasonsResp getTransferOrderReasons();

    # 订单转单
    CommonModel.CommonResp transferOrder(1: required OrderDetailModel.TransferOrderReq req, 2: required i32 operatorId);

    # 订单批量转单
    OrderDetailModel.BatchTransferOrderResp batchTransferOrders(1: required OrderDetailModel.BatchTransferOrderReq req, 2: required i32 operatorId);

    # 查询订单操作记录
    OrderDetailModel.QueryOrderOperateRecordsResp queryOrderOperateRecords(1: required string orderId);

    //获取员工信息
    OrgModel.GetEmpResp getEmp(1:required i32 empId);
}
// 退款服务
service MRefundService{
    // 请求退款接口
    MRefundModel.MRefundResp refund(1:required MRefundModel.MRefundReq mRefundReq);

    // 查询订单退款历史接口
    MRefundModel.GetOrderRefundInfoResp getOrderRefundInfo(1:required i64 orderId);
}