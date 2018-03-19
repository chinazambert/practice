namespace java com.sankuai.sjst.m.operation.dispatch.thrift.service

include "Model.thrift"

//需根据登录人员进行权限限制，即总部销支能看到全国数据，每个地区的实施指派员，只能看到所在战区的数据
//实施指派员：餐饮平台—餐饮生态业务部—所有战区的的BDM以及CM（并且需要支持给个别实施人员增加指派员权限)
//总部销支：餐饮平台—餐饮生态业务部——业务支持组人员
service OpTicketThriftService {

    // 根据关键字（姓名、mis号、组织节点名）模糊搜索销售员或组织结构 | 数据过滤
    Model.EmpOrgSearchResp searchBdsByKeyword(1: required i32 operatorId, 2:required string keyword);

    // 根据关键字（姓名、mis号、组织节点名）模糊搜索实施员或组织结构 | 数据过滤
    // type = 0: 全部, 1: 仅全职实施员, 2: 仅BD兼职
    Model.EmpOrgSearchResp searchExecutantsByKeyword(1: required i32 operatorId, 2:required string keyword, 3: required i32 scope)

    # 查询组织结构节点下的子组织结构和员工
    Model.QueryChildOrgsAndEmpsResp queryChildOrgsAndEmps(1:required i32 orgId);

    // 根据关键字（ID、名称）模糊搜索门店 | 数据过滤
    Model.PoiSearchResp searchPoisByKeyword(1: required i32 operatorId, 2:required string keyword);

    // 根据关键字（名称）模糊搜索客户
    Model.CustomerSearchResp searchCustomerByKeyword(1: required i32 operatorId, 2:required string keyword);

    // 数据导出
    Model.ExportDataResp exportData(1: required i32 operatorId, 2: required Model.QueryTicketReq queryTicketReq);

    // 获取工单搜索筛选项列表
    Model.TicketEnumsListResp getTicketSearchEnumsList();

    // 获取软件类型搜索筛选项列表
    Model.SoftwareTypesEnumsListResp getSoftwareTypeSearchEnumsList(1: required i32 systemType);

    // 获取是否连锁总店搜索筛选项列表
    Model.IsHeadTypesEnumsListResp getIsHeadTypesSearchEnumsList(1: required i32 systemType, 2: required i32 softwareType);

    // 查询所有战区
    Model.GetTerritoriesResp getTerritories(1: required i32 operatorId);

    // 查询战区下的行政区
    Model.GetLocationsResp getLocations(1: required i32 territoryId);

    // 工单列表
    Model.QueryTicketResp queryTickets(1: required i32 operatorId, 2: required Model.QueryTicketReq queryTicketReq);

    // 待分配工单列表
    Model.QueryTicketResp queryManualAssignTickets(1: required i32 operatorId, 2: required Model.QueryTicketReq queryTicketReq);

    // 工单详情 + 工单服务信息
    Model.GetTicketDetailResp getTicketDetail(1: required i32 operatorId, 2: required i64 ticketId);

    // 未分配工单数量
    Model.GetManualAssignTicketCountResp getManualAssignTicketCount(1: required i32 operatorId);

    // 人工分配工单
    Model.AssignTicketResp assignTicket(1: required i32 operatorId, 2: required i64 ticketId, 3: required i32 executantId, 4: required string reason);

    // 转单
    Model.ChangeTicketResp changeTicket(1: required i32 operatorId, 2: required i64 ticketId, 3: required i32 executantId, 4: required string reason);

    // 终止工单
    Model.StopTicketResp stopTicket(1: required i32 operatorId, 2: required i64 ticketId, 3: required string reason);

    // 返回工单终止原因列表
    Model.StopReasonResp getStopReasonList();
}