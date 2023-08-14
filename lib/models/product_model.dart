class Products {
  int id;
  int groupId;
  String name;
  String remark;
  int appProductId;
  String process;
  int price;
  int unit;
  String image;
  int discountType;
  int discountNumber;
  String createdAt;
  String updatedAt;
  String deletedAt;
  int quantity = 1;
  int isMulti = 0;

  Products(
      {this.id,
      this.groupId,
      this.name,
      this.remark,
      this.appProductId,
      this.process,
      this.price,
      this.unit,
      this.image,
      this.discountType,
      this.discountNumber,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    name = json['name'];
    remark = json['remark'];
    appProductId = json['app_product_id'];
    process = json['process'];
    price = json['price'];
    unit = json['unit'];
    image = json['image'];
    discountType = json['discount_type'];
    discountNumber = json['discount_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    isMulti = json['is_muti'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group_id'] = this.groupId;
    data['name'] = this.name;
    data['remark'] = this.remark;
    data['app_product_id'] = this.appProductId;
    data['process'] = this.process;
    data['price'] = this.price;
    data['unit'] = this.unit;
    data['image'] = this.image;
    data['discount_type'] = this.discountType;
    data['discount_number'] = this.discountNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
