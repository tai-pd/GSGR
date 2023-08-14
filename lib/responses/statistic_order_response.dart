class StatisticOrderResponse {
  Data data;
  String message;
  int status;

  StatisticOrderResponse({this.data, this.message, this.status});

  StatisticOrderResponse.fromJson(Map<String, dynamic> json) {
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
  String sumTotalPrice;

  Data({this.success, this.order});

  Data.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['order'] != null) {
      order = [];
      json['order'].forEach((v) {
        order.add(new Order.fromJson(v));
      });
    }
    sumTotalPrice = json['sum_total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.order != null) {
      data['order'] = this.order.map((v) => v.toJson()).toList();
    }
    data['sum_total_price'] = this.sumTotalPrice;
    return data;
  }
}

class Order {
  int id;
  int customerId;
  String customerName;
  String customerPhone;
  String orderStart;
  String orderEnd;
  int status;
  int totalPrice;
  dynamic staffId;

  Order({
    this.id,
    this.customerId,
    this.customerName,
    this.customerPhone,
    this.orderStart,
    this.orderEnd,
    this.status,
    this.totalPrice,
    this.staffId,
  });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? -1;
    customerId = json['customer_id'] ?? -1;
    customerName = json['customer_name'] ?? '';
    customerPhone = json['customer_phone'] ?? '';
    orderStart = json['order_start'] ?? '';
    orderEnd = json['order_end'] ?? '';
    status = json['status'] ?? 0;
    totalPrice = json['total_price'] ?? 0;
    staffId = json['staff_id'] ?? -1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['customer_phone'] = this.customerPhone;
    data['order_start'] = this.orderStart;
    data['order_end'] = this.orderEnd;
    data['status'] = this.status;
    data['total_price'] = this.totalPrice;
    data['staff_id'] = this.staffId;

    return data;
  }
}
