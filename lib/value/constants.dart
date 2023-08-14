enum TYPEORDER { Combo, KG, Office, Vip, Shoes, Other }
enum STATUSORDER {
  MOI,
  SHIPER_NHAN_HANG,
  SHIPER_GIAO_HANG,
  STORE_NHAN_HANG,
  STORE_GIAO_HANG,
  SHIPER_TRA_HANG,
  HOAN_THANH,
  HUY
}

extension StatusExtension on STATUSORDER {
  int get value {
    switch (this) {
      case STATUSORDER.MOI:
        return 1;
      case STATUSORDER.SHIPER_NHAN_HANG:
        return 2;
      case STATUSORDER.SHIPER_GIAO_HANG:
        return 3;
      case STATUSORDER.STORE_NHAN_HANG:
        return 4;
      case STATUSORDER.STORE_GIAO_HANG:
        return 5;
      case STATUSORDER.SHIPER_TRA_HANG:
        return 6;
      case STATUSORDER.HOAN_THANH:
        return 7;
      case STATUSORDER.HUY:
        return 8;
      default:
        return 0;
    }
  }
}

class Constants {
  /// http headers
  static Object apiHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  /// api routes
  static const String apiBaseUrlDev = "https://beta.giatsaygiare.vn/";
  static const String apiBaseUrlPro = "https://beta.giatsaygiare.vn/";
  static String apiBaseUrl = "https://beta.giatsaygiare.vn";

  static String apiUrlRegist = '$apiBaseUrl/api/customer';
  static String apiUrlLogin = '$apiBaseUrl/api/login';
  static String apiUrlListCategory = '$apiBaseUrl/api/category';
  static String apiGetCoupon = '$apiBaseUrl/api/coupon?';
  static String apiPostOrder = '$apiBaseUrl/api/order';
  static String apiGetHistoryOrder = '$apiBaseUrl/api/order?';
  static String apiGetOrderHistory = '$apiBaseUrl/api/history_order?';
  static String apiGetCustomer = '$apiBaseUrl/api/customer?';
  static String apiUpdateTask = '$apiBaseUrl/api/order/';
  static String apiStatisticOrder = '$apiBaseUrl/api/statistical';
  static String apiGetCustomerByPhone = '$apiBaseUrl/api/get_customer_by_phone';
  static String apiTransferOrder = '$apiBaseUrl/api/transfer_order/';
  static String apiGetNotification = '$apiBaseUrl/api/notification';
  static String apiUpdateNotification = '$apiBaseUrl/api/update_notification';
  static String apiDeleteNotification = '$apiBaseUrl/api/delete_notification';
  static String apiLogOut = '$apiBaseUrl/api/logout';
  static String pointFriend = '$apiBaseUrl/api/point_friend';
  static String addCoupon = '$apiBaseUrl/api/add_coupon_to_customer';

  static Map<int, String> statusType = {
    1: 'Mới',
    2: 'Shiper nhận hàng mới',
    3: 'Shiper giao hàng cho store',
    4: 'Store đang giặt',
    5: 'Store đã giặt xọng',
    6: 'Shiper nhận hàng đã giặt',
    7: 'Hoàn thành',
    8: 'Huỷ',
  };

  static String name = '';
  static String tell = '';
  static dynamic grab = {'id': 100, 'name': 'Dịch vụ Grab'};
}
