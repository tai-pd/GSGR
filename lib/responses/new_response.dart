import 'package:gsgr/models/new_model.dart';

class NewsResponse {
  Data data;
  String message;
  int status;

  NewsResponse({this.data, this.message, this.status});

  NewsResponse.fromJson(Map<String, dynamic> json) {
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
  List<Newses> newses;

  Data({this.success, this.newses});

  Data.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['newses'] != null) {
      newses = [];
      json['newses'].forEach((v) {
        newses.add(new Newses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.newses != null) {
      data['newses'] = this.newses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
