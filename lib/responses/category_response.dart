import 'package:gsgr/models/category_model.dart';

class CategoryResponse {
  Data data;
  String message;
  int status;

  CategoryResponse({this.data, this.message, this.status});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
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
  List<Categorys> groups;

  Data({this.success, this.groups});

  Data.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['groups'] != null) {
      groups = [];
      json['groups'].forEach((v) {
        groups.add(new Categorys.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.groups != null) {
      data['groups'] = this.groups.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
