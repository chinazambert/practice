namespace java com.sankuai.sjst.m.operation.thrift.model.order.enums

include "Status.thrift"

struct EnumTO {
    1:required i32 id;
    2:required string name;
}

struct OrderEnumsListResp {
    1:required Status.Status status;
    // 订单状态列表
    2:optional list<EnumTO> orderStatus;
    // 订单系统类型列表
    3:optional list<EnumTO> orderSystemTypes;
    // 订单付款方式列表
    4:optional list<EnumTO> orderPayTypes;
}