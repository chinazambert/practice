include "CommonModel.thrift"
include "ReportModel.thrift"

namespace java com.sankuai.sjst.m.operation.product.service

//报表 11005
service OpReportThriftService {

    //库存汇总表
    ReportModel.QueryInventoryResp queryInventorySummary(1: required i32 operatorId, 2: required ReportModel.QueryInventoryReq queryInventoryReq);

    //导出库存汇总报表
    ReportModel.ExportDataResp exportInventorySummary(1: required i32 operatorId, 2: required ReportModel.QueryInventoryReq queryInventoryReq);

    //库存明细表
    ReportModel.QueryInventoryResp queryInventoryDetail(1: required i32 operatorId, 2: required ReportModel.QueryInventoryReq queryInventoryReq);

    //导出库存明细报表
    ReportModel.ExportDataResp exportInventoryDetail(1: required i32 operatorId, 2: required ReportModel.QueryInventoryReq queryInventoryReq);

    //盘点报表
    ReportModel.QueryWarehouseTicketResp queryWarehouseTicket(1: required i32 operatorId, 2: required ReportModel.QueryWarehouseTicketReq queryWarehouseTicketReq);

    //盘点报表
    ReportModel.ExportDataResp exportWarehouseTicket(1: required i32 operatorId, 2: required ReportModel.QueryWarehouseTicketReq queryWarehouseTicketReq);
}