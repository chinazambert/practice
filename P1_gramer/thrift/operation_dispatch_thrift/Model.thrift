namespace java com.sankuai.sjst.m.operation.dispatch.thrift.model

include "CommonModel.thrift"

##################################################
struct EmpTO {
    1:required i32 empId;
    2:required string empName;
    3:optional string misId;
    4:optional string phone;
}

struct ExecutantTO{
    1:required i32 id;
    2:required string name;
    3:optional string misId;
}

struct OrgTO {
    1:required i32 orgId;
    2:required string orgName;
}

struct QueryChildOrgsAndEmpsResp {
    1:required CommonModel.Status status;
    2:optional list<EmpTO> emps;
    3:optional list<OrgTO> orgs;
}

# 实施员 or 组织结构模糊搜索返回
struct EmpOrgSearchResp {
    1: required CommonModel.Status status;
    2: optional list<EmpTO> emps;
    3: optional list<OrgTO> orgs;
}

##################################################
struct PoiTO {
    1: required i64 poiId;
    2: required string poiName;
}

struct PoiSearchResp {
    1: required CommonModel.Status status;
    2: optional list<PoiTO> pois;
}

##################################################
struct EnumTO {
    1:required i32 id;
    2:required string name;
}

struct TicketEnumsListResp {
    1:required CommonModel.Status status;
    // 工单状态列表
    2:optional list<EnumTO> ticketStatusTypes;
    // 实施类型列表
    3:optional list<EnumTO> operateTypes;
    // 商品类型列表
    4:optional list<EnumTO> systemTypes;
    // 是否需要总部发货列表
    5:optional list<EnumTO> isHqTypes;
}

##################################################
struct SoftwareTypesEnumsListResp {
    1:required CommonModel.Status status;
    // 软件类型列表
    2:optional list<EnumTO> softwareTypes;
}

struct IsHeadTypesEnumsListResp {
    1:required CommonModel.Status status;
    // 是否连锁总店列表
    2:optional list<EnumTO> isHeadTypes;
}

##################################################
// 战区
struct TerritoryTO{
    1: required i32 id;
    2: required string name;
    3: required i32 cityId;
    4: required string pinyin;
    5: required string shortPinyin;
}

struct GetTerritoriesResp{
    1: required CommonModel.Status status;
    2: optional list<TerritoryTO> territories;
}

// 行政区信息
struct LocationTO{
    // 行政区ID
    1: required i32 id;
    // 行政区名称
    2: required string name;
    // 中文简称拼音
    3: optional string pinyin;
    // 中文简称拼音缩写
    4: optional string shortPinyin;
}

// 查询行政区
struct GetLocationsResp{
    // 查询结果。 code:0成功。其他值为错误码。
    1: required CommonModel.Status status;
    // 查询成功时返回城市列表
    2: optional list<LocationTO> locationTOs;
}

// 商圈信息
struct BareaTO{
    // 商圈ID
    1: required i32 id;
    // 商圈名称
    2: required string name;
}

// 查询商圈
struct GetBareasResp{
    // 查询结果。 code:0成功。其他值为错误码。
    1: required CommonModel.Status status;
    // 查询成功时返回城市列表
    2: optional list<BareaTO> bareaTOs;
}

##################################################
struct QueryTicketConditionTO {
    1: optional i32 empId; // 销售Id
    2: optional i32 executantId; // 实施员Id
    3: optional i64 id; // 工单Id
    4: optional i64 createdTimeLow; // 工单创建时间下界
    5: optional i64 createdTimeUp; // 工单创建时间上界
    6: optional i64 poiId; // 门店Id
    7: optional i32 status; // 工单状态
    8: optional i64 customerId; // 客户Id
    9: optional i32 isHq; // 是否总部发货
    10: optional i32 territoryId;
    11: optional i32 type; // 实施类型
    12: optional i32 systemType; // 系统类型
    13: optional i32 softwareType; // 软件类型
    14: optional i64 orderId; // 订单ID
    15: optional i32 isHead; // 是否连锁总店
}

// 查询请求
struct QueryTicketReq {
    // 查询条件
    1: optional QueryTicketConditionTO queryTicketConditionTO;
    // 排序条件, sample: id desc
    2: optional list<CommonModel.FieldSortTO> fieldSortTOs;
    // 分页
    3: optional CommonModel.PageTO pageTO;
}

struct OpCustomerTO {
    1: required i64 id;
    2: required string name;
}

struct OpPoiTO {
    1: required i64 poiId;
    2: required string name;
}

struct PrivilegeTO {
    1: required bool stop;
    2: required bool change;
    3: required bool assign;
}
// 搜索列表中的单行数据
struct TicketListItemTO {
    1: required i64 id; // 工单Id
    2: optional CommonModel.PairTO type; // 实施类型
    3: optional OpCustomerTO customer; // 客户
    4: optional OpPoiTO poi; // 门店
    5: optional CommonModel.PairTO systemType; // 系统类型
    6: optional CommonModel.PairTO softwareType; // 软件类型
    7: optional CommonModel.PairTO head; // 是否连锁总店
    8: optional CommonModel.PairTO isHq; // 是否需要总部发货
    9: optional i64 orderId; // 订单号
    10: required i64 createdTime; // 工单创建时间
    11: optional CommonModel.PairTO territory; // 战区
    12: optional EmpTO emp; // 销售
    13: optional ExecutantTO executant; // 实施
    14: optional CommonModel.PairTO status; // 工单状态
    15: optional PrivilegeTO privilege; // 按钮权限列表
}

// 搜索查询返回
struct QueryTicketResp {
    1: required CommonModel.Status status;
    2: required i64 total;
    3: required i32 page;
    4: required list<TicketListItemTO> ticketListItems;
}

##################################################
struct CustomerDetailTO {
    1: required i64 id; // 客户编号
    2: required string name; // 客户名称
    3: optional string address; // 客户地址
}

struct ContactInfoTO {
    1: required string name; // 姓名
    2: optional string phone; // 电话
}

struct PoiDeviceTO {
    1: required string name; // 硬件名称
    2: required i32 amount; // 硬件数量
}

struct PoiInfoTO {
    1: required i64 poiId; // 门店id
    2: required string name; // 门店名称
    3: required string address; // 门店地址
    4: required ContactInfoTO contractInfo; // 门店联系人
    5: required string poiCloseStatus; // 开业状态
    6: optional string poiAreaText; // 店铺面积
    7: optional string poiNetworkStatus; // 网络状态
    8: optional string poiMenuStatus; // 菜品状态
    9: optional list<PoiDeviceTO> poiExistingHardware; // 现有硬件
}

struct DeviceCodeTO {
    1: required string code; // 屏芯激活码
    2: required i32 isActivated; // 是否已激活
}

struct InstallationInfoTO {
    1: required list<PoiDeviceTO> ticketDevices; // 安装设备列表
    2: optional i64 installBeginTime; // 预约安装开始时间
    3: optional i64 installEndTime; // 预约安装结束时间
    4: required i64 createTime; // 提单日期
    5: required string status; // 工单状态
    6: optional string systemType; // 商品类型
    7: optional string softwareType; // 软件类型
    8: optional string head; // 是否连锁总店
    9: optional DeviceCodeTO single; // 屏芯连锁单店激活码
    10: optional DeviceCodeTO headquarter; // 屏芯连锁总店激活码
    11: optional i64 confirmedTime; // 确认安装时间
    12: optional string executantType; // 实施类型
    13: optional CommonModel.PairTO needSingleActivation; //是否需要单店激活码
}

struct ReceiptInfoTO {
    1: required string isHq; // 是否总部发货
    2: required string person; // 收货人
    3: required string address; // 收货地址
    4: required string phone; // 电话
}

struct TicketDetailTO {
    1: optional CustomerDetailTO customerDetail; // 客户详情
    2: optional ContactInfoTO bdContactInfo; // 销售员联系方式
    3: optional PoiInfoTO poiInfo; // 门店详情
    4: optional InstallationInfoTO installationInfo; // 安装详情
    5: optional ReceiptInfoTO receiptInfo; // 收货详情
}

struct TicketExchangeTO {
    1: required CommonModel.PairTO status; // 工单状态
    2: required ContactInfoTO operator; // 操作人
    3: required i64 operateTime; // 操作时间
    4: optional string reason; // 操作原因
}

struct TicketFlowTO {
    1: optional ContactInfoTO executant; // 实施员姓名及电话
    2: optional string remark; // 工单备注
    3: optional list<TicketExchangeTO> ticketExchanges; // 工单流转状态列表
}

struct GetTicketDetailResp {
    1: required CommonModel.Status status;
    2: optional TicketDetailTO ticketDetail;
    3: optional TicketFlowTO ticketFlow;
}

##################################################
struct AssignTicketResp {
    1: required CommonModel.Status status;
    2: optional TicketListItemTO item; // 操作成功后返回最新状态的列表项
}

struct ChangeTicketResp {
    1: required CommonModel.Status status;
    2: optional TicketListItemTO item; // 操作成功后返回最新状态的列表项
}

struct StopTicketResp {
    1: required CommonModel.Status status;
    2: optional TicketListItemTO item; // 操作成功后返回最新状态的列表项
}

##################################################
struct GetManualAssignTicketCountResp {
    1: required CommonModel.Status status;
    2: required i32 count;
}

##################################################
struct CustomerSearchResp {
    1: required CommonModel.Status status;
    2: optional list<OpCustomerTO> customers;
}

##################################################
struct ExportDataResp{
    1: required CommonModel.Status status;
    2: optional string url; // excel文件下载地址
}

##################################################
struct StopReasonResp {
    1: required CommonModel.Status status;
    2: optional list<string> reasons;
}