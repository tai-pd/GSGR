class NotificationResponse {
  Data data;
  String message;
  int status;

  NotificationResponse({this.data, this.message, this.status});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
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
  List<Push> push;

  Data({this.success, this.push});

  Data.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['push'] != null) {
      push = [];
      json['push'].forEach((v) {
        push.add(new Push.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.push != null) {
      data['push'] = this.push.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Push {
  int id;
  int customerId;
  int pushId;
  String pushContent;
  String pushedAt;
  int status;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  String pushTitle;

  Push(
      {this.id,
      this.customerId,
      this.pushId,
      this.pushContent,
      this.pushedAt,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.pushTitle});

  Push.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    pushId = json['push_id'];
    pushContent = json['push_content'];
    pushedAt = json['pushed_at'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    pushTitle = json['push_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['push_id'] = this.pushId;
    data['push_content'] = this.pushContent;
    data['pushed_at'] = this.pushedAt;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['push_title'] = this.pushTitle;
    return data;
  }
}
