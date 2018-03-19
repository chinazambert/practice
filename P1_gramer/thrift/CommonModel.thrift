/**
 * 最新文件地址：
 * http://git.sankuai.com/projects/SJST/repos/m-common/browse/src/main/java/com/sankuai/sjst/m/common/thrift/CommonModel.thrift
 */

namespace java com.sankuai.sjst.m.common.thrift.model

// 状态
struct Status {
    1: required i32 code;
    2: optional string message;
}

// 分页
struct PageTO {
    // 当前页码
    1: required i32 currentPage;
    // 每页条数
    2: required i32 perPage;
    // 记录总条数，仅返回接口有
    3: optional i64 total;
}

// 排序字段
struct FieldSortTO {
    // created_time
    1: required string field;
    // asc desc
    2: required string direct;
}

// pair 1对1 类型数据
struct PairTO {
    1: required i32 id;
    2: required string name;
}

struct CommonResp{
    1:required Status status;
}
