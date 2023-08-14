import 'package:get/get.dart';
import 'package:gsgr/helper/dialog.dart';
import 'package:gsgr/repositories/user_repository.dart';
import 'package:gsgr/value/session_manager.dart';
import 'package:gsgr/view/auth/login_screen.dart';

class SettingController extends GetxController {
  SessionManager sessionManager = SessionManager();
  var roleId = 0.obs;

  UserRepository repository = UserRepository();
  String customer = '';
  @override
  void onInit() {
    super.onInit();
  }

  Future lougOut() async {
    DialogHelper.dialogLogout(
        title: 'Xác nhận',
        content: 'Bạn chắc chắn muốn đăng xuất tài khoản không ?',
        fnc: () async {
          // repository.logout(customer).then((value) {});
          await sessionManager.setLogin(false);
          await sessionManager.clearData();
          Get.offAllNamed(LoginSreen.routeName);
        });
  }

  Future confirmRemoveAccount() async {
    await DialogHelper.dialogRemoveAccount(
        title: 'Xác nhận',
        content: 'Bạn chắc chắn muốn xóa tài khoản không ?',
        fnc: () async {
          // await acceptRemoveAccount();
          Get.back();
          await DialogHelper.confirmDialogLogout(
              title: 'Xác nhận',
              content:
                  'Chúng tôi sẽ liên hệ với bạn để tiến hành xóa tài khoản. Cảm ơn bạn!',
              fnc: () async {
                // repository.logout(customer).then((value) {});
                await sessionManager.setLogin(false);
                await sessionManager.clearData();
                Get.offAllNamed(LoginSreen.routeName);
                // Get.back();
              });
        });
  }

  Future getRoleId() async {
    await sessionManager
        .getInt(sessionManager.userId)
        .then((value) => customer = '$value');
    await sessionManager.getInt(sessionManager.roleId).then((value) {
      roleId.value = value;
    });
  }
}
