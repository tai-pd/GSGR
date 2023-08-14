import 'package:get/get.dart';
import 'package:gsgr/repositories/notification_repository.dart';

class NotificationController extends GetxController {
  var isLoading = false.obs;
  var listData = [].obs;
  var userId = ''.obs;
  NotificationRepository repository = NotificationRepository();

  @override
  void onInit() async {
    super.onInit();
    await repository.getNotification(null).then((value) {
      if (value.status == 200) {
        listData.addAll(value.data.push);
      }
    });
  }

  Future getNotification(String search) async {
    isLoading.toggle();
    await repository.getNotification(search).then((value) {
      if (value.status == 200) {
        listData.clear();
        listData.addAll(value.data.push);
      }
    });
    isLoading.toggle();
  }

  Future updateNotification(int id) async {
    isLoading.toggle();
    await repository.updateNotification(id).then((value) {
      if (value.status == 200) {
        listData.clear();
        listData.addAll(value.data.push);
      }
    });
    isLoading.toggle();
  }

  Future deleteNotification(int id) async {
    await repository.deleteNotification(id).then((value) {
      if (value.status == 200) {}
    });
  }
}
