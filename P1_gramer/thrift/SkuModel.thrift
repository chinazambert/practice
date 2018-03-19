include "CommonModel.thrift"

namespace java com.sankuai.sjst.mall.item.model.sku
//接口定义规范:https://wiki.sankuai.com/pages/viewpage.action?pageId=1138149718

struct SkuAttrTO {
    //sku属性id
    1:optional i64 id;
    //sku属性名称
    2:required string name;
    //sku销售属性值
    3:required string value;
}

//sku基础数据数据结构
struct SkuBaseTO {
    //商品id
    2:optional i64 itemId;
    //sku价格
    3:required i64 price;
    //sku库存量
    4:required i32 amount;
    //sku累计销量
    5:optional i32 sale;
    //sku编码
    6:optional string code;
    //sku图片
    7:optional string imagePath;
}

//详情数据结构
struct SkuInfoTO {
   //skuId
   1:required i64 id;
   //sku基础信息
   2:required SkuBaseTO skuBase;
   //sku属性
   8:optional list<SkuAttrTO> skuAttrs;
   //创建时间
   11:required i64 createdTime;
   //修改时间
   12:required i64 modifiedTime;
}


struct AddSkuReq {
   1:required SkuBaseTO skuBase;
   2:optional list<SkuAttrTO> skuAttrs;
}

struct UpdateSkuReq {
    1:required i64 id;
    2:required SkuBaseTO skuBase;
}

struct AddSkuResp {
    1:required CommonModel.Status status;
    2:optional i64 id;
}

struct UpdateSkuResp {
    1:required CommonModel.Status status;
}

struct DeleteSkuResp {
    1:required CommonModel.Status status;
}

struct GetCompleteSkuResp {
     1:required CommonModel.Status status;
    2:optional SkuInfoTO skuInfo;
}

struct MapCompleteSkuResp {
    1:required CommonModel.Status status;
    2:optional map<i64, SkuInfoTO> id2SkuInfos;
}

//暂时放在这边;后续迁出
struct ProductTO {
    1:required string code;
    2:required string name;
}

struct MapProductsBySkuIdResp {
    1:required CommonModel.Status status;
    2:required map<i64,list<ProductTO>> skuProductMap;
}


