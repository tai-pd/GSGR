import 'dart:ffi';

class NotificationSettingResponse {
  Data data;

  NotificationSettingResponse({this.data});

  NotificationSettingResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  Map<String, dynamic> pnWeb;
  Map<String, dynamic> pnApp;

  Data({this.pnWeb, this.pnApp});

  Data.fromJson(Map<String, dynamic> json) {
    pnWeb = json['pn_web'] != null ? json['pn_web'] : null;
    pnApp = json['pn_app'] != null ? json['pn_app'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pnWeb != null) {
      data['pn_web'] = this.pnWeb;
    }
    if (this.pnApp != null) {
      data['pn_app'] = this.pnApp;
    }
    return data;
  }
}
