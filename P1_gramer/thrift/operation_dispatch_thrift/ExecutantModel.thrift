include "CommonModel.thrift"

namespace java com.sankuai.sjst.m.operation.dispatch.model.executant

/* 列表 */

// 搜索条件
struct QueryExecutantConditionTO {
    // 实施员Id
    1: optional i32 empId;
    // 组织结构Id
    2: optional i32 orgId;
    // 战区
    3: optional i32 territoryId;
    // 行政区
    4: optional i32 locationId;
}

// 搜索请求
struct QueryExecutantReq {
    1: required QueryExecutantConditionTO condition;
    2: required CommonModel.PageTO page;
    3: required list<CommonModel.FieldSortTO> fields;
}

// 指派员
struct OpDistributorTO {
    1: required i32 empId;
    2: required string name;
    3: required string mis;
}

// 服务范围
struct OpTerritoryLocationTO {
    1: optional i32 territoryId;
    2: optional string territoryName;
    3: optional i32 locationId;
    4: optional string locationName;
}

// 实施员列表元素
struct ExecutantListItemTO {
    // 实施员Id
    1: required i32 empId;
    // 实施员姓名
    2: required string name;
    // mis号
    3: required string mis;
    // 角色名称
    4: required string role;
    // 所属指派员
    5: optional OpDistributorTO distributor;
    // 联系电话
    6: required string phone;
    7: required list<OpTerritoryLocationTO> territoryLocations;
    // 状态
    8: required CommonModel.PairTO status;
}

// 实施员列表返回
struct QueryExecutantResp {
    1: required CommonModel.Status status;
    2: optional i64 total;
    3: optional i32 page;
    4: optional list<ExecutantListItemTO> executantListItems;
}

/* 详情 */

struct ExecutantDetailTO {
    // 实施员Id
    1: required i32 empId;
    // 可接单，停止接单
    2: required i32 status;
    // 实施员mis
    3: required string mis;
    // 实施员电话
    4: required string phone;
    5: required list<OpTerritoryLocationTO> territoryLocations;
}

struct GetExecutantDetailResp {
    1: required CommonModel.Status status;
    2: optional ExecutantDetailTO executantDetail;
}

/* 保存 */

// 保存实施员请求
struct SaveExecutantReq {
    // 员工Id
    1: required i32 empId;
    2: required i32 status;
    3: required list<i32> locationIds;
}

// 保存实施员返回
struct SaveExecutantResp {
    1: required CommonModel.Status status;
    2: optional i32 empId;
}

/* 处理操作 */

// 停止接单返回
struct DisableExecutantResp {
    1: required CommonModel.Status status;
}
// 恢复接单返回
struct EnableExecutantResp {
    1: required CommonModel.Status status;
}
