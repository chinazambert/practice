include "CommonModel.thrift"
include "ItemCategoryModel.thrift"

namespace java com.sankuai.sjst.mall.item.service

service ItemCategoryThriftService {
    //创建标准类目
    ItemCategoryModel.AddItemCategoryResp addItemCategory(1:required ItemCategoryModel.AddItemCategoryReq req);

    //修改标准类目
    ItemCategoryModel.UpdateItemCategoryResp updateItemCategory(1:required ItemCategoryModel.UpdateItemCategoryReq req);

    //删除标准类目
    ItemCategoryModel.DeleteItemCategoryResp deleteItemCategory(1:required i32 id);

    //获取标准类目 场景:类目管理
    ItemCategoryModel.GetItemCategoryResp getItemCategory(1:required i32 id);

    //获取子类目   场景:商品添加

}
