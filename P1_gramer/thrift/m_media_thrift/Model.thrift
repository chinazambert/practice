include "CommonModel.thrift"

namespace java com.sankuai.sjst.m.media.model


struct PictureInfoTO {
    //fileId
    1:required string fileId;
    //文件名称
    2:optional string filename;
    //图片大小
    3:optional i64 size;
    //图片宽度
    4:optional i32 width;
    //图片高度
    5:optional i32 height;
}

struct GetPictureInfoByFileIdResp {
    1:required CommonModel.Status status;
    2:required PictureInfoTO  PictureInfo;
}

struct ListPictureInfoByFileIdsResp {
    1:required CommonModel.Status status;
    2:required list<PictureInfoTO>  pictureInfos;
}


struct MapPictureInfoByFileIdsResp {
    1:required CommonModel.Status status;
    2:required map<string,PictureInfoTO>  pictureInfoMap;
}

