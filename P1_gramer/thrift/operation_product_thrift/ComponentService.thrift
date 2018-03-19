include "ComponentModel.thrift"

namespace java com.sankuai.sjst.m.operation.product.service

service OpComponentThriftService {
    // 获取库房
    ComponentModel.OpGetWarehousesResp getWarehouses(1: required i32 operatorId);
    // 根据区域org获取库房
    ComponentModel.OpGetWarehousesResp getAreaWarehouses(1: required i32 operatorId, 2: required i32 areaOrgId);
    // 获取产品
    ComponentModel.OpGetProductsResp getProducts(1: required i32 operatorId);
    // 获取大区
    ComponentModel.OpGetOrgsResp getRegionOrgs(1: required i32 operatorId);
    // 获取区域
    ComponentModel.OpGetOrgsResp getAreaOrgs(1: required i32 operatorId, 2: required i32 regionOrgId);
    // 获取供应商
    ComponentModel.OpGetSuppliersResp getSuppliers(1: required i32 operatorId);
    // 搜索mis帐号
    ComponentModel.OpQueryEmployeesResp queryEmployees(1: required i32 operatorId, 2: required string keyword);
    // 获取列表页权限
    ComponentModel.OpGetModulePrivilegeResp getModulePrivilege(1: required i32 operatorId, 2: required i32 opTicketType);
}
