namespace java com.sankuai.sjst.m.operation.thrift.model.order.search

include "Status.thrift"
include "OrgModel.thrift"

################################### 销售员/实施员模糊搜索 #######################################

# 销售员 or 组织结构模糊搜索返回
struct BdOrgSearchResp {
    1: required Status.Status status;
    2: optional list<OrgModel.EmpTO> bds;
    3: optional list<OrgModel.OrgTO> orgs;
}

# 实施员模糊搜索返回
struct ExecutantSearchResp {
    1: required Status.Status status;
    2: optional list<OrgModel.EmpTO> executants;
}

################################### 订单搜索 #######################################

# 订单关联门店
struct OrderPoiTO {
    // 门店编号
    1: required i64 poiId;
    // 门店名称
    2: required string name;
}

# 订单信息
struct OrderItemTO {
    // 订单编号
    1: required i64 orderId;
    // 签单时间（毫秒）
    2: required i64 createdTime;
    // 门店信息
    3: required list<OrderPoiTO> pois;
    // 系统类型
    4: required string systemType;
    // 付款方式
    5: required string orderPayType;
    // 折后价格（分）
    6: required i64 finalPrice;
    // 首款价格（分）
    7: optional i64 advancePrice;
    // 尾款价格（分）
    8: optional i64 tailPrice;
    // 尾款时间（毫秒）
    9: optional i64 tailTime;
    // 订单状态
    10: required i32 orderStatus;
    // 订单状态文本
    11: required string orderStatusText;
    // 客户Id
    12: optional i64 customerId;
    // 客户名称
    13: optional string customerName;
    // 工单数量
    14: optional i32 ticketCount;
    //员工ID
    15:optional i32 empId;
}

# 订单搜索条件
struct OrderSearchConditionTO {
    // 订单编号
    1: optional string orderId;
    // 门店编号或名称
    2: optional string poi;
    // 订单状态 Id
    3: optional i32 orderStatus;
    // 系统类型 Id
    4: optional i32 orderSystemType;
    // 付款方式 Id
    5: optional i32 orderPayType;
    // 销售员工 Ids
    6: optional list<i32> bdIds;
    // 组织结构 Ids
    7: optional list<i32> orgIds;
    // 实施员 Ids
    8: optional list<i32> executantIds;
    // 签单时间下界
    9: optional i64 signTimeLowerBound;
    // 签单时间上界
    10: optional i64 signTimeUpperBound;
    // 客户Id
    11: optional i64 customerId;
}

# 排序
struct FieldSortTO {
    // 排序字段
    1: required string field;
    // asc / desc
    2: required string direct;
}

# 分页
struct PageTO {
    // 当前页码
    1: required i32 currentPage;
    // 每页条数
    2: required i32 pageSize;
}

struct OrderSearchReq {
    1: required OrderSearchConditionTO condition;
    2: required PageTO page;
    3: optional list<FieldSortTO> fieldSorts;
}

struct OrderSearchResp {
    1: required Status.Status status;
    2: optional i32 total;
    3: optional i32 page;
    4: optional list<OrderItemTO> orders;
}