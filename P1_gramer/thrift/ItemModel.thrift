include "CommonModel.thrift"
include "SkuModel.thrift"

namespace java com.sankuai.sjst.mall.item.model.item

struct ItemQueryItemTO {
    //id
    1:required i64 id;
    //标题
    2:required string title;
    //主图路径
    3:required string imagePath;
    //商品最低价格
    4:required i64 minPrice;
    //商品最高价格
    5:required i64 maxPrice;
    //描述
    6:optional string description;
}

struct QueryItemsConditionTO {
    1:optional i64 id;
    //标题
    2:optional string keyword;
    //店铺id
    3:optional i64 shopId;
    //店铺分类id
    4:optional i64 shopCategoryId;
    //商品状态
    5:optional i32 status;
}

struct QueryItemsReq {
     // 查询条件
    1: required QueryItemsConditionTO conditionTO;
    // 排序条件 eg:id desc
    2: optional list<CommonModel.FieldSortTO> fieldSortTOs;
    // 分页
    3: required CommonModel.PageTO pageTO;
}

struct ItemBaseTO {
    //id
    1:required i64 id;
    //商品标题
    2:required string title;
    //商品简介
    3:optional string description;
    //价格(单位:分) -- 最低价
    4:required i64 minPrice;
    //商品编码
    5:optional string code;
    //商品状态
    6:required CommonModel.PairTO status;
    //叶子类目信息
    7:required i32 categoryId;
    //店铺内分类
    8:optional list<i64> shopCategoryIds;
    //商品主图
    9:optional string imagePath;
    //创建时间
    10:required i64 createdTime;
    //修改时间
    11:required i64 modifiedTime;
    //商品属性
    12:optional string properties;
    //价格(单位:分) -- 商品最高价
    13:required i64 maxPrice

}

struct ItemDetailModuleTO {
    1:optional list<string> imagePaths;
}

//详情数据结构
struct ItemInfoTO {
    //商品基础信息
    1:required ItemBaseTO itemBaseTO;
    //商品头图
    2:optional list<string> headImagePaths;
    //sku信息
    3:optional list<SkuModel.SkuInfoTO> skuInfos;
    //商品详情
    4:optional list<ItemDetailModuleTO> itemDetailModules;
}

struct ItemSkuParamTO {
    1:required SkuModel.SkuBaseTO skuBase;
    2:optional list<SkuModel.SkuAttrTO> skuAttrs;
}

struct ItemParamTO {
    //店铺id
    1:required i64 shopId;
    //开始销售时间
    2:optional i64 startTime;
    // 1 - 下单减库存 2 - 付款减库存
    3:optional i32 descStockType;
    //标题
    4:required string title;
    //商品编码
    5:optional string code;
    //商品所属子类目
    6:optional i32 categoryId;
    //商品的属性,这个目前没有结构化
    7:optional string properties;
    //店铺内分类
    8:optional list<i32> shopCategoryIds;
    //商品主图
    9:required string imagePath;
    //商品头图
    10:optional list<string> headImagePaths;
    //商品详情
    11:optional list<ItemDetailModuleTO> itemDetailModules;
    //商品sku类别
    12:required list<ItemSkuParamTO> skuParams;
    //商品描述
    13:optional string desciption;

}

//新增数据结构
struct PublishItemReq {
    1:required ItemParamTO itemParam;
}

struct UpdateItemreq {
    //商品id
    1:required i64 id;
    2:required ItemParamTO itemParam;
}

struct QueryItemsResp {
    1:required CommonModel.Status status;
    2:required i64 total;
    3:required i32 page;
    4:optional list<ItemQueryItemTO> itemQueryItems;
}

struct PublishItemResp {
    1:required CommonModel.Status status;
    2:optional i64 id;
}

struct BatchPublishItemResp {
    1:required CommonModel.Status status;
    2:optional list<i64> ids;
}

struct GetItemResp {
    1:required CommonModel.Status status;
    2:optional ItemBaseTO itemBase;
}

struct GetCompleteItemResp {
    1:required CommonModel.Status status;
    2:optional ItemInfoTO itemInfo;
}

struct OnShelfItemsResp {
    1:required CommonModel.Status status;
}

struct DownShelfItemsResp {
    1:required CommonModel.Status status;
}

struct DeleteItemsResp {
    1:required CommonModel.Status status;
}

struct UpdateItemResp {
    1:required CommonModel.Status status;
}

struct MapItemsResp {
    1:required CommonModel.Status status;
    2:optional map<i64, ItemBaseTO> id2ItemBases;
}

struct GetItemOptionsTO {
    //包含sku信息
    1:required bool includeSku;
    //包含详情信息
    2:required bool includeDetail;
    //包含头图信息
    3:required bool includHeadImage;
}
