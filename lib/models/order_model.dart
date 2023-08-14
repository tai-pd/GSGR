class Order {
  String code;
  String customerId;
  String addressFrom;
  String noteFrom;
  String addressTo;
  String noteTo;
  String orderStart;
  String rangeTimeStart;
  String orderEnd;
  String couponId;
  String remark;
  int status;
  String updatedAt;
  String createdAt;
  int id;

  Order(
      {this.code,
      this.customerId,
      this.addressFrom,
      this.noteFrom,
      this.addressTo,
      this.noteTo,
      this.orderStart,
      this.rangeTimeStart,
      this.orderEnd,
      this.couponId,
      this.remark,
      this.status,
      this.updatedAt,
      this.createdAt,
      this.id});

  Order.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    customerId = json['customer_id'];
    addressFrom = json['address_from'];
    noteFrom = json['note_from'];
    addressTo = json['address_to'];
    noteTo = json['note_to'];
    orderStart = json['order_start'];
    rangeTimeStart = json['range_time_start'];
    orderEnd = json['order_end'];
    couponId = json['coupon_id'];
    remark = json['remark'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['customer_id'] = this.customerId;
    data['address_from'] = this.addressFrom;
    data['note_from'] = this.noteFrom;
    data['address_to'] = this.addressTo;
    data['note_to'] = this.noteTo;
    data['order_start'] = this.orderStart;
    data['range_time_start'] = this.rangeTimeStart;
    data['order_end'] = this.orderEnd;
    data['coupon_id'] = this.couponId;
    data['remark'] = this.remark;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
