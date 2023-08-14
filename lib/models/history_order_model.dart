class HistoryOrder {
  Data data;
  String message;
  int status;

  HistoryOrder({this.data, this.message, this.status});

  HistoryOrder.fromJson(Map<String, dynamic> json) {
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
  String remark;
  int status;
  String code;
  String createdAt;
  String updatedAt;
  String deletedAt;
  int totalPrice;
  int staffId;
  int shipId;
  String storeAddress;
  String customerName;
  String customerTel;
  String statusContent;
  String couponName;
  int couponType;
  int couponValue;
  String noteShip;
  String noteStore;
  String tel;
  List<Products> products;
  List<OrderHistories> orderHistories;
  int isShipper;
  Payment payment;
  int type;

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
      this.remark,
      this.status,
      this.code,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.totalPrice,
      this.staffId,
      this.shipId,
      this.storeAddress,
      this.customerName,
      this.customerTel,
      this.statusContent,
      this.couponName,
      this.couponType,
      this.couponValue,
      this.products,
      this.tel,
      this.orderHistories,
      this.isShipper,
      this.payment,
      this.type});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    customerId = json['customer_id'] ?? 0;
    addressFrom = json['address_from'] ?? '';
    noteFrom = json['note_from'] ?? '';
    addressTo = json['address_to'] ?? '';
    noteTo = json['note_to'] ?? '';
    orderStart = json['order_start'] ?? '';
    rangeTimeStart = json['range_time_start'] ?? 0;
    orderEnd = json['order_end'] ?? '';
    rangeTimeEnd = json['range_time_end'] ?? 0;
    couponId = json['coupon_id'] ?? 0;
    remark = json['remark'] ?? '';
    status = json['status'] ?? 0;
    code = json['code'] ?? '';
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
    deletedAt = json['deleted_at'];
    totalPrice = json['total_price'] ?? 0;
    staffId = json['staff_id'] ?? 0;
    shipId = json['ship_id'] ?? 0;
    storeAddress = json['store_address'] ?? '';
    customerName = json['customer_name'] ?? '';
    customerTel = json['customer_tel'] ?? '';
    statusContent = json['status_content'] ?? '';
    couponName = json['coupon_name'] ?? '';
    couponType = json['coupon_type'] ?? 0;
    couponValue = json['coupon_value'] ?? 0;
    noteShip = json['shipper_note'] ?? '';
    noteStore = json['store_note'] ?? '';
    tel = json['tel'] ?? '';
    isShipper = json['is_shipper'] ?? false;
    type = json['type'] ?? 2;
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    if (json['order_histories'] != null) {
      orderHistories = [];
      json['order_histories'].forEach((v) {
        orderHistories.add(new OrderHistories.fromJson(v));
      });
    }
    if (json['payment'] != null) {
      payment = new Payment.fromJson(json['payment']);
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
    data['remark'] = this.remark;
    data['status'] = this.status;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['total_price'] = this.totalPrice;
    data['staff_id'] = this.staffId;
    data['ship_id'] = this.shipId;
    data['store_address'] = this.storeAddress;
    data['customer_name'] = this.customerName;
    data['customer_tel'] = this.customerTel;
    data['status_content'] = this.statusContent;
    data['coupon_name'] = this.couponName;
    data['coupon_type'] = this.couponType;
    data['coupon_value'] = this.couponValue;
    data['tel'] = this.tel;
    data['is_shipper'] = this.isShipper;
    data['type'] = this.type;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    if (this.orderHistories != null) {
      data['order_histories'] =
          this.orderHistories.map((v) => v.toJson()).toList();
    }
    if (this.payment != null) {
      data['payment'] = this.payment.toJson();
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
  Null deletedAt;
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

class OrderHistories {
  int id;
  int orderId;
  int orderStatusId;
  int customerId;
  String createdAt;
  String updatedAt;
  String deletedAt;

  OrderHistories(
      {this.id,
      this.orderId,
      this.orderStatusId,
      this.customerId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  OrderHistories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    orderStatusId = json['order_status_id'];
    customerId = json['customer_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['order_status_id'] = this.orderStatusId;
    data['customer_id'] = this.customerId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Payment {
  int id;
  int orderId;
  int cash;
  int transfer;
  String point;
  String createdAt;
  String updatedAt;

  Payment(
      {this.id,
      this.orderId,
      this.cash,
      this.transfer,
      this.point,
      this.createdAt,
      this.updatedAt});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? -1;
    orderId = json['order_id'] ?? -1;
    cash = json['cash'] ?? 0;
    transfer = json['transfer'] ?? 0;
    point = json['point'] ?? '';
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['cash'] = this.cash;
    data['transfer'] = this.transfer;
    data['point'] = this.point;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
