import 'package:gsgr/api/api_manager.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/responses/login_response.dart';
import 'package:gsgr/value/constants.dart';
import 'package:gsgr/value/session_manager.dart';

class LoginRepository {
  ApiManager _api = ApiManager();
  SessionManager _sessionManager = SessionManager();

  Future<LoginResponse> login(String tel) async {
    // String token = await _sessionManager.getString(_sessionManager.token);
    if (tel != null) {
      String token = await _sessionManager.getToken();

      Map<String, dynamic> body = {
        'tel': tel,
        'fcm_token': token ?? '123',
        'device': Helper.getOSCurrent()
      };
      final respose = await _api.post(Constants.apiUrlLogin, body);
      return LoginResponse.fromJson(respose);
    } else {
      return null;
    }
  }
}
