import 'package:get/get.dart';
import 'package:gsgr/repositories/notification_repository.dart';
import 'package:gsgr/value/session_manager.dart';

class SettingPushNotificationController extends GetxController {
  var isLoading = false.obs;
  var pnWeb = [].obs;
  var pnApp = [].obs;
  var userId = '';
  int userRole = 0;
  Map<String, String> statusStr = {
    '1': 'Mới',
    '2': 'Bắt đầu lấy hàng',
    '3': 'Đã lấy hàng xong',
    '4': 'Bắt đầu giặt',
    '5': 'Đã giặt xong',
    '6': 'Bắt đầu trả hàng',
    '7': 'Hoàn thành',
    '8': 'Hủy',
  };

  List<int> pnAppArr = [];
  List<int> pnWebArr = [];

  NotificationRepository repository = NotificationRepository();

  SessionManager _sessionManager = new SessionManager();

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;

    await _sessionManager
        .getInt(_sessionManager.userId)
        .then((value) => userId = value.toString());

    await _sessionManager
        .getInt(_sessionManager.roleId)
        .then((value) => userRole = value);

    await getPushNotificationSetting(userId);
    isLoading.value = false;
  }

  Future deleteNotification(int id) async {
    await repository.deleteNotification(id).then((value) {
      if (value.status == 200) {}
    });
  }

  Future getPushNotificationSetting(String id) async {
    await repository.getPnSettings(id).then((value) {
      if (pnWeb.length > 0) {
        pnWeb.clear();
      }
      if (pnApp.length > 0) {
        pnApp.clear();
      }
      value.data.pnApp.forEach((key, value) {
        if (value) {
          pnAppArr.add(int.parse(key));
        }
        pnApp.add({key: value});
      });
      value.data.pnWeb.forEach((key, value) {
        if (value) {
          pnWebArr.add(int.parse(key));
        }
        pnWeb.add({key: value});
      });
    });
  }

  Future setPushNotificationSetting(
      {String id, dynamic pnWebb, dynamic pnAppp}) async {
    isLoading.value = true;
    await repository.setPnSettings(id, pnWebb, pnAppp).then((value) {
      if (pnWeb.length >= 0) {
        pnWeb.clear();
        pnWebArr.clear();
      }
      if (pnApp.length >= 0) {
        pnApp.clear();
        pnAppArr.clear();
      }

      value.data.pnApp.forEach((key, value) {
        if (value) {
          pnAppArr.add(int.parse(key));
        }
        pnApp.add({key: value});
      });
      value.data.pnWeb.forEach((key, value) {
        if (value) {
          pnWebArr.add(int.parse(key));
        }
        pnWeb.add({key: value});
      });
    });

    isLoading.value = false;
  }
}
