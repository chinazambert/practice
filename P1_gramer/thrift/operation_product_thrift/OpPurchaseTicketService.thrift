include "CommonModel.thrift"
include "PurchaseTicketModel.thrift"

namespace java com.sankuai.sjst.m.operation.product.service

service OpPurchaseTicketThriftService {
    //创建采购单
    PurchaseTicketModel.OpCreatePurchaseTicketResp createPurchaseTicket(1:required i32 operatorId, 2:required PurchaseTicketModel.OpSavePurchaseTicketReq req);

    //编辑商品明细
    PurchaseTicketModel.OpModifyPurchaseTicketResp modifyPurCharseTicket(1:required i32 operatorId, 2:required PurchaseTicketModel.OpSavePurchaseTicketReq req);

    //编辑采购记录
    //done
    PurchaseTicketModel.OpModifyPurchaseTicketOrderResp modifyPurchaseTicketOrder(1:required i32 operatorId, 2:required PurchaseTicketModel.OpSavePurchaseTicketOrderReq req);

    //获取采购单详情
    PurchaseTicketModel.OpGetPurchaseTicketDetailResp  getPurchaseTicketDetail(1:required i32 operatorId, 2:required i64 purchaseTicketId);

    //查询采购单
    PurchaseTicketModel.OpQueryPurchaseTicketResp queryPurchaseTickets(1:required i32 operatorId, 2:required PurchaseTicketModel.OpQueryPurchaseTicketReq req);

    //删除采购单,删除采购单草稿
    PurchaseTicketModel.OpDeletePurchaseTicketResp deletePurchaseTicket(1:required i32 operatorId, 2:required i64 purcharseTicketId);

    //获取商品明细详情
    PurchaseTicketModel.OpGetPurchaseTicketProductDetailResp getPurchaseTicketProductDetail(1:required i32 operatorId, 2:required i64 purcharseTicketId);

    //获取采购记录明细
    PurchaseTicketModel.OpGetPurChaseTicketOrderResp getPurchaseTicketOrder(1:required i32 operatorId, 2:required i64 purchaseTicketId);

    //草稿箱,未填写采购记录计数接口
    PurchaseTicketModel.OpCountPurchaseTicketResp countPurchaseTicket(1:required i32 operatorId, 2:required PurchaseTicketModel.OpCountPurchaseTicketReq req);




}



