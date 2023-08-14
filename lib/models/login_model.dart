class Login {
  bool success;
  String token;
  int userId;

  Login({this.success, this.token, this.userId});

  Login.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['token'] = this.token;
    data['userId'] = this.userId;
    return data;
  }
}
