include "CommonModel.thrift"
include "SkuModel.thrift"

namespace java com.sankuai.sjst.mall.item.service

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