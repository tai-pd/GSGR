import 'package:gsgr/models/coupon_model.dart';

class CouponRespose {
  Data data;
  String message;
  int status;

  CouponRespose({this.data, this.message, this.status});

  CouponRespose.fromJson(Map<String, dynamic> json) {
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
  List<Coupons> coupons;

  Data({this.success, this.coupons});

  Data.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['coupons'] != null) {
      coupons = [];
      json['coupons'].forEach((v) {
        coupons.add(new Coupons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.coupons != null) {
      data['coupons'] = this.coupons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
