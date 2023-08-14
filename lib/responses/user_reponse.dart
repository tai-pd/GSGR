import 'package:gsgr/models/cusomer_model.dart';

class UserReponse {
  Data data;
  String message;
  int status;

  UserReponse({this.data, this.message, this.status});

  UserReponse.fromJson(Map<String, dynamic> json) {
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
  List<Customer> customer;

  Data({this.success, this.customer});

  Data.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['customer'] != null) {
      customer = [];
      json['customer'].forEach((v) {
        customer.add(new Customer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.customer != null) {
      data['customer'] = this.customer.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
