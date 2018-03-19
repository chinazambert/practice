namespace java com.sankuai.sjst.m.operation.thrift.service

include "OpCustomerModel.thrift"
include "Model.thrift"

service OpCustomerThriftService {
    OpCustomerModel.OpGetCustomerResp getCustomer(1: required i64 customerId); // 编辑时获取客户数据
    OpCustomerModel.OpSaveCustomerResp saveCustomer(1: required i32 operatorId, 2: required OpCustomerModel.OpCustomerTO customer, 3: required bool syncTenant);
    OpCustomerModel.OpQueryCustomerResp queryCustomer(1: required OpCustomerModel.OpQueryCustomerConditionTO condition, 2: required Model.PageTO page);

    OpCustomerModel.OpMapTenantCustomerResp mapTenantsCustomer(1: required list<i64> tenantIds); // 租户Id和客户的对应关系
}
