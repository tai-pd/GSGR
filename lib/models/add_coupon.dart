class AddCoupon {
  AddCoupon({
    this.data,
    this.message,
    this.status,
  });
  String data;
  String message;
  int status;

  AddCoupon.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data;
    _data['message'] = message;
    _data['status'] = status;
    return _data;
  }
}
