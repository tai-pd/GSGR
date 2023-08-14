class TaskOrderResponse {
  Data data;
  String message;
  int status;

  TaskOrderResponse({this.data, this.message, this.status});

  TaskOrderResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  bool success;
  List<Order> order;

  Data({this.success, this.order});

  Data.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['order'] != null) {
      order = [];
      json['order'].forEach((v) {
        order.add(new Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.order != null) {
      data['order'] = this.order.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  int id;
  int customerId;
  String addressFrom;
  String noteFrom;
  String addressTo;
  String noteTo;
  String orderStart;
  int rangeTimeStart;
  String orderEnd;
  int rangeTimeEnd;
  int couponId;
  String couponName;
  String remark;
  int status;
  String code;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  int totalPrice;
  int staffId;
  int shiperId;
  String customerName;
  String noteShip;
  String noteStore;
  String tel;
  String storeAddress;
  List<Products> products;

  Order(
      {this.id,
      this.customerId,
      this.addressFrom,
      this.noteFrom,
      this.addressTo,
      this.noteTo,
      this.orderStart,
      this.rangeTimeStart,
      this.orderEnd,
      this.rangeTimeEnd,
      this.couponId,
      this.couponName,
      this.remark,
      this.status,
      this.code,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.totalPrice,
      this.staffId,
      this.shiperId,
      this.customerName,
      this.tel,
      this.storeAddress,
      this.products});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    addressFrom = json['address_from'];
    noteFrom = json['note_from'];
    addressTo = json['address_to'];
    noteTo = json['note_to'];
    orderStart = json['order_start'];
    rangeTimeStart = json['range_time_start'];
    orderEnd = json['order_end'];
    rangeTimeEnd = json['range_time_end'];
    couponId = json['coupon_id'];
    couponName = json['coupon_name'] ?? '';
    remark = json['remark'];
    status = json['status'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    totalPrice = json['total_price'];
    staffId = json['staff_id'] ?? 0;
    shiperId = json['ship_id'] ?? 0;
    noteShip = json['shipper_note'] ?? '';
    noteStore = json['store_note'] ?? '';
    customerName = json['customer_name'] ?? '';
    tel = json['tel'] ?? '';
    storeAddress = json['store_address'] ?? '';
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['address_from'] = this.addressFrom;
    data['note_from'] = this.noteFrom;
    data['address_to'] = this.addressTo;
    data['note_to'] = this.noteTo;
    data['order_start'] = this.orderStart;
    data['range_time_start'] = this.rangeTimeStart;
    data['order_end'] = this.orderEnd;
    data['range_time_end'] = this.rangeTimeEnd;
    data['coupon_id'] = this.couponId;
    data['coupon_name'] = this.couponName;
    data['remark'] = this.remark;
    data['status'] = this.status;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['total_price'] = this.totalPrice;
    data['staff_id'] = this.staffId;
    data['ship_id'] = this.shiperId;
    data['customer_name'] = this.customerName;
    data['tel'] = this.tel;
    data['store_address'] = this.storeAddress;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
  dynamic deletedAt;
  Pivot pivot;

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
      this.deletedAt,
      this.pivot});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    groupId = json['group_id'] ?? 0;
    name = json['name'] ?? '';
    remark = json['remark'] ?? '';
    appProductId = json['app_product_id'] ?? 0;
    process = json['process'] ?? '';
    price = json['price'] ?? 0;
    unit = json['unit'] ?? '';
    image = json['image'];
    discountType = json['discount_type'] ?? 0;
    discountNumber = json['discount_number'] ?? 0;
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
    deletedAt = json['deleted_at'] ?? '';
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
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
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }
}

class Pivot {
  int orderId;
  int productId;
  String quantity;

  Pivot({this.orderId, this.productId, this.quantity});

  Pivot.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    return data;
  }
}
