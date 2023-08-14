import 'package:get/get.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/repositories/login_repository.dart';
import 'package:gsgr/value/constants.dart';
import 'package:gsgr/value/session_manager.dart';
import 'package:gsgr/view/Base/main_screen.dart';
import 'package:gsgr/view/auth/page/verify_scree.dart';
import 'package:gsgr/view/regist/regist_screen.dart';
import 'package:url_launcher/url_launcher.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginController extends GetxController {
  RxBool isloading = false.obs;
  SessionManager _sessionManager = SessionManager();
  LoginRepository _loginRepository = LoginRepository();

  void login(String phoneNumber) {
    if (phoneNumber.length > 12 || phoneNumber.length < 9) {
      Helper.showDialog('Lỗi số điện thoại', 'Hãy kiểm tra lại số điện thoại',
          onBack: () {
        Get.back();
      });
    } else {
      if (phoneNumber.startsWith('0')) {
        print('Phone number $phoneNumber');
        Get.to(VerifyPhone(phoneNumber: phoneNumber));
      } else {
        print('Phone number 0 $phoneNumber');
        Get.to(VerifyPhone(phoneNumber: '0$phoneNumber'));
      }
    }
  }

  Future loginAccount(String tel) async {
    await _loginRepository.login(tel).then((value) {
      //
      if (value.status == 200) {
        Constants.name = value.data.customer.name;
        Constants.tell = value.data.customer.tel;

        _sessionManager.saveUser(value.data.customer);
        _sessionManager.setLogin(true);
        // _sessionManager.setString(_sessionManager.phone, tel);
        Get.offAll(MainScreen());
      } else if (value.status == 404) {
        Get.off(RegistScreen(), arguments: [tel]);
      } else {
        Helper.showDialog('Lỗi đăng nhập!',
            'Có lỗi xảy ra trong quá trình đăng nhập. Vui lòng thử lại sau. ',
            onBack: () {});
      }
    });
  }

  Future<void> launchFacebook() async {
    if (await canLaunch('https://www.facebook.com/giatsaygiare.vn/')) {
      await launch('https://www.facebook.com/giatsaygiare.vn/');
    } else {
      throw 'Could not launch URL https://www.facebook.com/giatsaygiare.vn/';
    }
  }
}
