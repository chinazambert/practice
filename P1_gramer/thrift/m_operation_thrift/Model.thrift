namespace java com.sankuai.sjst.m.operation.thrift.model

struct PageTO {
    // 当前页码
    1: required i32 currentPage;
    // 每页条数
    2: required i32 pageSize;
}
