import 'package:gsgr/api/api_manager.dart';
import 'package:gsgr/responses/coupon_response.dart';

import 'package:gsgr/value/constants.dart';
import 'package:gsgr/value/session_manager.dart';

import '../models/add_coupon.dart';

class HomeRepository {
  ApiManager api = ApiManager();
  SessionManager _sessionManager = SessionManager();
  Future<CouponRespose> getListCoupon() async {
    String url = Constants.apiGetCoupon;
    await _sessionManager
        .getInt(_sessionManager.userId)
        .then((value) => url = '$url' + 'user_id=$value');
    final respon = await api.get(url);
    return CouponRespose.fromJson(respon);
  }

  Future<AddCoupon> addCouponForUser(String couponCode) async {
    String url = Constants.addCoupon;
    int userID = await _sessionManager.getInt(_sessionManager.userId);

    var body = {'user_id': userID.toString(), 'coupon': couponCode};

    final respon = await api.post(url, body);
    return AddCoupon.fromJson(respon);
  }
}
