include "CommonModel.thrift"
include "CountTicketModel.thrift"

namespace java com.sankuai.sjst.m.operation.product.service

service OpCountTicketThriftService {
    // 列表筛选
    CountTicketModel.OpQueryCountTicketsResp queryCountTickets(1: required i32 operatorId, 2: required CountTicketModel.OpQueryCountTicketsReq queryCountTicketsReq);
    // 获取盘点单详情
    CountTicketModel.OpGetCountTicketDetailResp getCountTicketDetail(1: required i32 operatorId, 2: required i64 ticketId);
    // 根据库房获取产品库存
    CountTicketModel.OpGetProductsByWarehouseResp getProductsByWarehouse(1: required i32 operatorId, 2: required i32 warehouseId);
    // 编辑盘点单
    CountTicketModel.OpEditCountTicketResp editCountTicket(1: required i32 operatorId, 2: required i64 ticketId);
    // 保存盘点单
    CountTicketModel.OpSaveCountTicketResp saveCountTicket(1: required i32 operatorId, 2: required CountTicketModel.OpSaveCountTicketReq saveCountTicketReq);
    // 删除盘点单
    CountTicketModel.OpDeleteCountTicketResp deleteCountTicket(1: required i32 operatorId, 2: required i64 ticketId);
}
