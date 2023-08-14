import 'dart:ffi';

import 'package:gsgr/api/api_manager.dart';
import 'package:gsgr/responses/notification_response.dart';
import 'package:gsgr/responses/notification_setting_response.dart';
import 'package:gsgr/value/constants.dart';
import 'package:gsgr/value/session_manager.dart';

class NotificationRepository {
  ApiManager api = ApiManager();
  SessionManager _sessionManager = SessionManager();

  Future<NotificationResponse> getNotification(String search) async {
    int userId = await _sessionManager.getInt(_sessionManager.userId);
    var url = Constants.apiGetNotification + '?customer_id=$userId';
    if (search != null) {
      url = url + '&search=$search';
    }
    final respon = await api.get(url);
    return NotificationResponse.fromJson(respon);
  }

  Future<NotificationResponse> updateNotification(int id) async {
    int userId;
    await _sessionManager
        .getInt(_sessionManager.userId)
        .then((value) => userId = value);
    Map<String, dynamic> body = {
      '_method': 'PUT',
      'customer_id': userId,
      'id': id
    };
    final respon =
        await api.postWithHeader(Constants.apiUpdateNotification, body);
    return NotificationResponse.fromJson(respon);
  }

  Future<NotificationResponse> deleteNotification(int id) async {
    Map<String, dynamic> body = {'_method': 'DELETE', 'id': id};
    final respon =
        await api.postWithHeader(Constants.apiDeleteNotification, body);
    return NotificationResponse.fromJson(respon);
  }

  Future<NotificationSettingResponse> getPnSettings(String id) async {
    final response = await api
        .get('${Constants.apiBaseUrl}/api/customer/$id/push_notification');
    return NotificationSettingResponse.fromJson(response);
  }

  Future<NotificationSettingResponse> setPnSettings(
      String id, dynamic pnWeb, dynamic pnApp) async {
    Map<String, List<int>> body = {'pn_web': pnWeb, 'pn_app': pnApp};
    final response = await api.postWithHeader(
        '${Constants.apiBaseUrl}/api/customer/$id/push_notification', body);
    return NotificationSettingResponse.fromJson(response);
  }
}
