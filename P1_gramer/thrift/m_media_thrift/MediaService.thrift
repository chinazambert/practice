namespace java com.sankuai.sjst.m.media.service
include "Model.thrift"

service MediaThriftService {

    Model.GetPictureInfoByFileIdResp getPictureInfoByFileId(1:required string fileId);

    Model.ListPictureInfoByFileIdsResp listPictureInfoByFileIds(1:required list<string> fileIds);

    Model.MapPictureInfoByFileIdsResp mapPictureInfoByFileIdsResp(1:required list<string> fileIds);
}