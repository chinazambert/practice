include "CommonModel.thrift"
include "ExecutantModel.thrift"

namespace java com.sankuai.sjst.m.operation.dispatch.service

service OpExecutantThriftService {
    // 列表查询
    ExecutantModel.QueryExecutantResp queryExecutants(1: required i32 operatorId, 2: required ExecutantModel.QueryExecutantReq queryExecutantReq);
    // 详情查询
    ExecutantModel.GetExecutantDetailResp getExecutantDetail(1: required i32 operatorId, 2: required i32 empId);
    // 保存
    ExecutantModel.SaveExecutantResp saveExecutant(1: required i32 operatorId, 2: required ExecutantModel.SaveExecutantReq saveExecutantReq);
    // 停止接单
    ExecutantModel.DisableExecutantResp disableExecutant(1: required i32 operatorId, 2: required i32 empId);
    // 恢复接单
    ExecutantModel.EnableExecutantResp enableExecutant(1: required i32 operatorId, 2: required i32 empId);
    // 初始化非实施员
    ExecutantModel.GetExecutantDetailResp initExecutantDetail(1: required i32 operatorId, 2: required i32 empId);
}
