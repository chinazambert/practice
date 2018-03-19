include "CommonModel.thrift"
include "TransferTicketModel.thrift"

namespace java com.sankuai.sjst.m.operation.product.service

// 调拨服务 port：11006
service OpTransferTicketThriftService {

        // 创建调拨单
        TransferTicketModel.OpCreateTransferTicketResp createTransferTicket(1:required i32 operator,2:required TransferTicketModel.OpTransferTicketFormTO transferTicketFormTO);

        // 修改调拨单
        CommonModel.CommonResp modifyTransferTicket(1:required i32 operator,2:required i64 transferTicketId,3:required TransferTicketModel.OpTransferTicketFormTO transferTicketFormTO);

        // 删除调拨单
        CommonModel.CommonResp deleteTransferTicket(1:required i32 operator,2:required i64 transferTicketId);

        // 调拨单详情
        TransferTicketModel.OpGetTransferTicketResp getTransferTicket(1:required i32 operator,2:required i64 transferTicketId);

        // 调拨单列表
        TransferTicketModel.OpQueryTransferTicketsResp queryTransferTickets(1:required i32 operator,2:required TransferTicketModel.OpQueryTransferTicketsReq req,3:required CommonModel.PageTO pageTO);
}
