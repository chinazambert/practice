include "CommonModel.thrift"
include "Model.thrift"

namespace java com.sankuai.sjst.m.operation.product.model.component

// 库房选项
struct OpWarehouseOptionTO {
    1: required i32 id;
    2: required string name;
    3: required string namePinyin;
    4: optional string address;
}

// 库房返回结构
struct OpGetWarehousesResp {
    1: CommonModel.Status status;
    2: list<OpWarehouseOptionTO> warehouses;
}

// 产品选项
struct OpProductOptionTO {
    1: required i32 id;
    2: required string name;
    3: required string namePinyin;
    4: optional string model;
    5: optional string modelPinyin;
    6: required string brand;
    7: required string brandPinyin;
    8: required string unit;
}

// 产品返回结构
struct OpGetProductsResp {
    1: CommonModel.Status status;
    2: list<OpProductOptionTO> products;
}

// 组织架构选项
struct OpOrgOptionTO {
    1: required i32 id;
    2: required string name;
}

// 组织架构返回结构
struct OpGetOrgsResp {
    1: CommonModel.Status status;
    2: list<OpOrgOptionTO> orgs;
}

// 供应商选项
struct OpSupplierOptionTO {
    1: required i32 id;
    2: required string name;
}

// 供应商返回结构
struct OpGetSuppliersResp {
    1: CommonModel.Status status;
    2: list<OpSupplierOptionTO> suppliers;
}

// 员工选项
struct OpEmployeeOptionTO {
    1: required i32 id;
    2: required string mis;
    3: required string name;
}

// 员工返回结构
struct OpQueryEmployeesResp {
    1: CommonModel.Status status;
    2: list<OpEmployeeOptionTO> employees;
}

//获取图片url请求选项
struct OpMapImageUrlsOptionTO {
    //是否是缩略图
    1:required bool scale;
    //缩略图的大小 -- scale = true才有效
    2:optional i32 width;
}

// 获取图片url响应
struct OpMapImageUrlsResp {
     1:required CommonModel.Status status;
     2:optional map<string, string> urls;
}

// 列表页权限
struct OpGetModulePrivilegeResp {
    1: required CommonModel.Status status;
    2: optional Model.OpPrivilegeForTicketsTO privilege;
}



