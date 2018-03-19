include "CommonModel.thrift"

namespace java com.sankuai.sjst.mall.item.model.itemCategory

//详情数据结构
struct ItemCategoryInfoTO {
    1:required i32 id;
    //标准类目名称
    2:required string name;
    //描述
    3:optional string description;
    //父类目
    4:required CommonModel.PairTO parentCategory;
    //层级路径 -- 面包屑
    5:optional list<i32> categoryPath;
    //层级
    6:required i32 level;
    //是否叶子类目
    7:required i32 isLeaf;
    //排序字段
    8:required i32 displayOrder;
    //状态
    9:required CommonModel.PairTO status;
    //创建时间
    10:required i64 createdTime;
    //修改时间
    11:required i64 modifiedTime;
}

struct ItemCategoryParamTO {
    1:required string name;
    2:required string description;
    3:required i32 parentId;
    4:required i32 displayOrder;
}


struct GetItemCategoryResp {
    1:required CommonModel.Status status;
    2:optional ItemCategoryInfoTO itemCategory;
}

struct AddItemCategoryReq {
    1:required ItemCategoryParamTO ItemCategoryParam;
}

struct UpdateItemCategoryReq {
    1:required i32 id;
    2:required ItemCategoryParamTO ItemCategoryParam;
}

struct AddItemCategoryResp {
    1:required CommonModel.Status status;
    2:optional i32 id;
}

struct UpdateItemCategoryResp {
    1:required CommonModel.Status status;
}

struct DeleteItemCategoryResp {
    1:required CommonModel.Status status;
}