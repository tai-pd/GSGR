class Customer {
  int id;
  String name;
  String userName;
  String email;
  String tel;
  String image;
  int roleId;
  int status;
  double point;
  String token;
  String birthday;
  Null rememberToken;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  String loginToken;

  Customer(
      {this.id,
      this.name,
      this.userName,
      this.email,
      this.tel,
      this.image,
      this.roleId,
      this.status,
      this.point,
      this.token,
      this.birthday,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.loginToken});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['user_name'] ?? null;
    email = json['email'] ?? null;
    tel = json['tel'];
    image = json['image'];
    roleId = json['role_id'];
    status = json['status'];
    point = double.parse(json['point']) ?? 0.0;
    token = json['token'];
    birthday = json['birthday'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    loginToken = json['login_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['tel'] = this.tel;
    data['image'] = this.image;
    data['role_id'] = this.roleId;
    data['status'] = this.status;
    data['point'] = this.point;
    data['token'] = this.token;
    data['birthday'] = this.birthday;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['login_token'] = this.loginToken;
    return data;
  }
}
