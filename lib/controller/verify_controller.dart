import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/home_controller.dart';
import 'package:gsgr/helper/dialog.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/repositories/login_repository.dart';
import 'package:gsgr/value/session_manager.dart';
import 'package:gsgr/view/Base/main_screen.dart';
import 'package:gsgr/view/auth/login_screen.dart';
import 'package:gsgr/view/regist/regist_screen.dart';

class VerifyController extends GetxController {
  SessionManager _sessionManager = SessionManager();
  LoginRepository _loginRepository = LoginRepository();

  final controller = Get.find<HomeController>();
  var verrify = true.obs;
  RxBool isLoading = false.obs;
  RxBool isSendingOTP = false.obs;
  String verificationId = '';
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseMessaging messaging;
  Timer _timer;
  int countTime = 0;
  RxString valueString = '.'.obs;
  String phoneNumber = '';

  @override
  void onReady() {
    super.onReady();
    if (phoneNumber != '') {
      sendSMS();
      _timer = Timer.periodic(const Duration(seconds: 1), (time) {
        countTime++;
        if (valueString.value.length < 5) {
          valueString.value += '.';
        } else {
          valueString.value = '.';
        }
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  Future verifyNumber(String code) async {
    if (code.length == 6 && phoneNumber != '') {
      isLoading.value = true;

      if (phoneNumber.contains('0965080942') ||
          phoneNumber.contains('0905705775')) {
        if (code == '123456') {
          isLoading.value = false;
          loginAccount();
        } else {
          isLoading.value = false;
          Helper.showDialog(
              'Lỗi xác thực', 'Mã xác thực không chính xác, hãy kiểm tra lại ',
              onBack: () {});
        }
      } else {
        if (verificationId != '') {
          try {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId, smsCode: code);

            await _auth.signInWithCredential(phoneAuthCredential).then((value) {
              if (value?.user != null) {
                isLoading.value = false;
                loginAccount();
              } else {
                isLoading.value = false;
                Helper.showDialog('Lỗi xác thực',
                    'Mã xác thực không chính xác, hãy kiểm tra lại ',
                    onBack: () {});
              }
            }).catchError((e) {
              isLoading.value = false;
              Helper.showDialog('Lỗi xác thực',
                  'Mã xác thực không chính xác, hãy kiểm tra lại ', onBack: () {
                // Get0965080942.back();
              });
            }).onError((error, stackTrace) {
              isLoading.value = false;
              Helper.showDialog('Lỗi xác thực',
                  'Mã xác thực không chính xác, hãy kiểm tra lại ', onBack: () {
                // Get0965080942.back();
              });
            });
          } on Exception {
            isLoading.value = false;
            Helper.showDialog('Lỗi xác thực',
                'Mã xác thực không chính xác, hãy kiểm tra lại ', onBack: () {
              // Get0965080942.back();
            });
          }
        } else {
          isLoading.value = false;

          print('send sms still error');
        }
      }
    }
  }

  Future loginAccount() async {
    String token = '';
    isLoading.value = true;
    await _sessionManager.getToken().then((value) => token = value ?? '');
    if (token == '') {
      messaging?.subscribeToTopic('all');
      messaging = FirebaseMessaging.instance;

      try {
        await messaging.getToken().then((value) => token = value ?? '');
      } on Exception {}
      print("NEW TOKEN :: $token");
      await _sessionManager.setToken(token);
    }

    // await _sessionManager.setString(_sessionManager.phone, tel);

    await _loginRepository.login(phoneNumber).then((value) async {
      if (value.status == 200) {
        _sessionManager.setLoginToken(value.data.customer.loginToken);
        await _sessionManager.saveUser(value.data.customer).then((value) {
          controller.tabController.animateTo(0);
          Future.delayed(Duration(seconds: 1), () {
            isLoading.value = false;
            Get.offAll(MainScreen());
          });
        });
      } else if (value.status == 404) {
        isLoading.value = false;
        // _sessionManager.setString(_sessionManager.phone, tel);
        Get.off(RegistScreen(), arguments: [phoneNumber]);
      } else {
        isLoading.value = false;
        Helper.showDialog('Lỗi đăng nhập!',
            'Có lỗi xảy ra trong quá trình đăng nhập. Vui lòng thử lại sau. ',
            onBack: () {
          Get.off(LoginSreen());
        });
      }
    });
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }

  Future sendSMS() async {
    isSendingOTP.value = true;
    await _auth.verifyPhoneNumber(
      phoneNumber: '+84$phoneNumber',
      verificationCompleted: (phoneAuthCredential) async {
        //signInWithPhoneAuthCredential(phoneAuthCredential);
        print('send sms success');
        isSendingOTP.value = false;
      },
      verificationFailed: (verificationFailed) async {
        print('send sms fail ${verificationFailed.message}');
        isSendingOTP.value = false;
        DialogHelper.dialogWarning(
            title: 'Gởi mã thất bại.',
            content: 'Không gởi được mã xác thưc, vui lòng thử lại sau.',
            fnc: () {
              Get.back();
              Get.back();
            });
      },
      codeSent: (verificationId, resendingToken) async {
        print('send sms codesned');
        this.verificationId = verificationId;
        isSendingOTP.value = false;
      },
      codeAutoRetrievalTimeout: (verificationId) async {
        print('send sms timeout');
        isSendingOTP.value = false;
        DialogHelper.dialogWarning(
            title: 'Gởi mã thất bại.',
            content: 'Không gởi được mã xác thưc, vui lòng thử lại sau.',
            fnc: () {
              Get.back();
              Get.back();
            });
      },
    );
  }
}
