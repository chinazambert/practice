include "CommonModel.thrift"
include "StockTicketModel.thrift"

namespace java com.sankuai.sjst.m.operation.product.service

// 入/出库单接入层服务 端口：11001
service OpStockTicketThriftService {
    // 获取全部入库类型 eg: 101.采购入库 102.调拨入库 103.退货入库 104.领用入库 105.盘点入库(不可手动) 100.其他入库
    StockTicketModel.OpStockInTypeResp getAllStockInType();

    // 获取全部出库类型 eg: 201.销售出库(不可手动) 202.调拨出库(不可手动) 203.退货出库 204.领用出库 205.盘点出库(不可手动) 200.其他出库
    StockTicketModel.OpStockOutTypeResp getAllStockOutType();

    // 获取订单来源类型 eg: 1.海鸥订单 2.TASK工单
    StockTicketModel.OpMOrderTypeResp getAllMOrderType();

    // 新增/编辑单据（草稿）
    StockTicketModel.OpSaveStockTicketResp saveStockTicket(1: required i32 operatorId, 2: required StockTicketModel.OpSaveStockTicketReq stockTicket);

    // 删除单据（草稿）
    StockTicketModel.OpDeleteStockTicketResp deleteStockTicket(1: required i32 operatorId, 2: required i64 stockTicketId);

    // 获取单据（草稿）详情
    StockTicketModel.OpGetStockTicketResp getStockTicket(1: required i32 operatorId, 2: required i64 stockTicketId);

    // 获取单据（草稿）列表
    StockTicketModel.OpQueryStockTicketsResp queryStockTickets(1: required i32 operatorId, 2: required StockTicketModel.OpQueryStockTicketsReq req);

    // 根据关键字（订单号/客户名称/BD姓名），模糊搜索海鸥订单列表
    StockTicketModel.OpQueryMOrdersResp queryMOrders(1: required i32 operatorId, 2: required StockTicketModel.OpQueryMOrdersReq req);

    // 根据海鸥订单号，获取售卖产品信息
    StockTicketModel.OpQueryMOrderProductsResp queryMOrderProducts(1: required i32 operatorId, 2: required i64 orderId);

    // 根据库房号，获取未完成采购单信息列表
    StockTicketModel.OpQueryPurchaseTicketsByWarehouseIdResp queryUndonePurchaseTicketsByWarehouseId(1: required i32 operatorId, 2: required StockTicketModel.OpQueryPurchaseTicketsByWarehouseIdReq req);

    // 根据库房号，获取未完成调拨单信息列表
    StockTicketModel.OpQueryTransferTicketsByWarehouseIdResp queryUndoneTransferTicketsByWarehouseId(1: required i32 operatorId, 2: required StockTicketModel.OpQueryTransferTicketsByWarehouseIdReq req);

}