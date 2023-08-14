import 'package:gsgr/models/register_model.dart';

class RegisterResponse {
  Data data;
  String message;
  int status;

  RegisterResponse({this.data, this.message, this.status});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
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
  Customer customer;

  Data({this.success, this.customer});

  Data.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.customer != null) {
      data['customer'] = this.customer.toJson();
    }
    return data;
  }
}
