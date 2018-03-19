include "InvModel.thrift"
include "CommonModel.thrift"

namespace java com.sankuai.sjst.mall.item.service

service InventoryThriftService {
    // 通过sku获取库存
    InvModel.GetInventoryResp getInventoryBySkuId(1: required i64 skuId);

    // 通过sku批量获取库存
    InvModel.FetchInventoryResp fetchInventoriesBySkuId(1: required list<i64> skuIds);

    // 通过sku批量获取库存
    InvModel.MapInventoryResp mapInventoriesBySkuId(1: required list<i64> skuIds);

    // 批量预扣库存
    CommonModel.CommonResp batchWithholdInventories(1: required list<InvModel.WithholdInventoryReq> requests);

    // 批量消耗库存预扣
    CommonModel.CommonResp batchConsumeWithholdings(1: required list<i64> skuOrderIds);

    // 批量取消库存预扣
    CommonModel.CommonResp batchCancelWithholdings(1: required list<i64> skuOrderIds);

    // 批量回补库存
    CommonModel.CommonResp batchReturnInventories(1: required list<i64> skuOrderIds);
}