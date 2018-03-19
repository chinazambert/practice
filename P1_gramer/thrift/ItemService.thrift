include "CommonModel.thrift"
include "ItemModel.thrift"
include "SkuModel.thrift"

namespace java com.sankuai.sjst.mall.item.service

service ItemThriftService {

    //获取商品详情 -- 聚合所有的信息
    ItemModel.GetCompleteItemResp getCompleteItem(1:required i64 id, 2:required ItemModel.GetItemOptionsTO options);

    //获取商品基础信息 -- 获取商品基础的信息
    ItemModel.GetItemResp getItem(1:required i64 id);

    //批量获取商品详情 -- 场景:商品比较的需求会用到
    ItemModel.MapItemsResp mapItems(1:required list<i64> ids);

    //商品发布
    ItemModel.PublishItemResp publishItem(1:required i32 operatorId, 2:required ItemModel.PublishItemReq req);

    //商品更新
    ItemModel.UpdateItemResp updateItem(1:required i32 operatorId, 2:required ItemModel.UpdateItemreq req);

    //商品上架
    ItemModel.OnShelfItemsResp onShelfItems(1:required i32 operatorId, 2:required list<i64> ids);

    //商品下架
    ItemModel.DownShelfItemsResp offShelfItems(1:required i32 operatorId, 2:required list<i64> ids);

    //商品查询
    ItemModel.QueryItemsResp queryItems(1:required ItemModel.QueryItemsReq req);

}

service SkuThriftService {

    //增加sku -- 场景:商品已经存在的情况下,增加一个商品的sku;eg:某个商品的新款
    SkuModel.AddSkuResp addSku(1:required i32 operatorId, 2:required SkuModel.AddSkuReq req);

    //删除sku -- 场景:某个商品的sku已经不再生产了
    SkuModel.UpdateSkuResp updateSku(1:required i32 operatorId, 2:required SkuModel.UpdateSkuReq req);

    //修改sku -- 场景:商品管理后台对sku基础信息的修改
    SkuModel.DeleteSkuResp deleteSku(1:required i32 operatorId, 2:required i64 id);

    //根据Id查询sku
    SkuModel.GetCompleteSkuResp getCompleteSku(1:required i64 id);

    //根据id列表查询sku
    SkuModel.MapCompleteSkuResp mapCompleteSku(1:required list<i64> ids);

    //根据skuIds获取对应的设备编码(仓储层) -- 目前暂时放在这边,后续仓储层建立之后迁出
    SkuModel.MapProductsBySkuIdResp mapProductsBySkuId(1:required list<i64> ids);

}
