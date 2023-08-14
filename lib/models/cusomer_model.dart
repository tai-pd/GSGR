class Customer {
  int id;
  String name;
  String userName;
  String email;
  String tel;
  String image;
  int roleId;
  int status;
  String token;
  String birthday;
  String address;
  String rememberToken;
  String createdAt;
  String updatedAt;
  String deletedAt;

  Customer(
      {this.id,
      this.name,
      this.userName,
      this.email,
      this.tel,
      this.image,
      this.roleId,
      this.status,
      this.token,
      this.birthday,
      this.address,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    email = json['email'];
    tel = json['tel'];
    image = json['image'];
    roleId = json['role_id'];
    status = json['status'];

    token = json['token'];
    birthday = json['birthday'];
    address = json['address'] ?? null;
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
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
    data['token'] = this.token;
    data['birthday'] = this.birthday;
    data['address'] = this.address ?? null;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
