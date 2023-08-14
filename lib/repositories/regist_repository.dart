import 'package:gsgr/api/api_manager.dart';
import 'package:gsgr/responses/registe_response.dart';
import 'package:gsgr/value/constants.dart';
import 'package:gsgr/value/session_manager.dart';

class RegistRepository {
  ApiManager api = ApiManager();
  SessionManager _sessionManager = SessionManager();

  Future<RegisterResponse> register(
    String name,
    String tel,
    String brithday,
    String inviteCode,
  ) async {
    String token;
    await _sessionManager
        .getString(_sessionManager.token)
        .then((value) => token = value);
    Map<String, dynamic> body = {
      'name': name,
      'tel': tel,
      'birthday': brithday,
      'role_id': '1',
      'fcm_token': token,
      'device': '123',
      'presenter_tel': inviteCode
    };
    final response = await api.post(Constants.apiUrlRegist, body);
    if (response['status'] == 200) {
      return RegisterResponse.fromJson(response);
    } else {
      return null;
    }
  }
}
