class PointFriend {
  int id;
  String name;
  String userName;
  String email;
  String tel;
  String image;
  int roleId;
  int status;
  String point;
  String token;
  String birthday;
  String rememberToken;
  String password;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String address;
  int groupCustomerId;
  List<Friends> friends;

  PointFriend(
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
      this.password,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.address,
      this.groupCustomerId,
      this.friends});

  PointFriend.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    email = json['email'];
    tel = json['tel'];
    image = json['image'];
    roleId = json['role_id'];
    status = json['status'];
    point = json['point'];
    token = json['token'];
    birthday = json['birthday'];
    rememberToken = json['remember_token'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    address = json['address'];
    groupCustomerId = json['group_customer_id'];
    if (json['friends'] != null) {
      friends = [];
      json['friends'].forEach((v) {
        friends.add(new Friends.fromJson(v));
      });
    }
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
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['address'] = this.address;
    data['group_customer_id'] = this.groupCustomerId;
    if (this.friends != null) {
      data['friends'] = this.friends.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Friends {
  int id;
  int founderId;
  int friendId;
  double point;
  Children children;

  Friends({this.id, this.founderId, this.friendId, this.point, this.children});

  Friends.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    founderId = json['founder_id'];
    friendId = json['friend_id'];
    point = double.parse(json['point'].toString());
    children = json['children'] != null
        ? new Children.fromJson(json['children'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['founder_id'] = this.founderId;
    data['friend_id'] = this.friendId;
    data['point'] = this.point;
    if (this.children != null) {
      data['children'] = this.children.toJson();
    }
    return data;
  }
}

class Children {
  int id;
  String name;
  String tel;
  String image;
  String point;

  Children({this.id, this.name, this.tel, this.image, this.point});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tel = json['tel'];
    image = json['image'];
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tel'] = this.tel;
    data['image'] = this.image;
    data['point'] = this.point;
    return data;
  }
}
