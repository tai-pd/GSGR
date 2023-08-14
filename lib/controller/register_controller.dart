import 'dart:io';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:gsgr/repositories/regist_repository.dart';
import 'package:gsgr/value/constants.dart';
import 'package:gsgr/value/session_manager.dart';
import 'package:gsgr/view/Base/main_screen.dart';
import 'package:image_picker/image_picker.dart';

import 'home_controller.dart';

class RegisteController extends GetxController {
  bool isloadFile;
  Future<File> profileImg;
  var birthDay = '1994-01-01'.obs;
  RxString name = ''.obs;
  RxString errorInviteCode = ''.obs;
  // File _image;
  RegistRepository _registRepository = RegistRepository();
  SessionManager sessionManager = SessionManager();

  final picker = ImagePicker();

  Future getImage() async {
    // final pickedFile = await picker.getImage(
    //     source: ImageSource.gallery, maxWidth: 500, maxHeight: 500);
    // SessionManager prefs = SessionManager();
    // var birthday = '';
    // var gender = 0;
    // var userName = '';

    // prefs.getInt(prefs.gender).then((value) {
    //   gender = value;
    // });

    // prefs.getString(prefs.username).then((value) {
    //   userName = value;
    // });

    // if (pickedFile != null) {
    //   setState(() {
    //     isloadFile = true;
    //   });
    //   _image = File(pickedFile.path);

    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await Api().updateImageProfileUser(
    //       userName, gender, birthday, media_about_k, _image,
    //       onSuccess: (msg) {
    //     setState(() {
    //       widget.loadNewData();
    //       print(msg);
    //     });
    //   }, onError: (error) {
    //     print('$error ');
    //   });
    // });
    // } else {
    //   print('No image selected.');
    // }
  }

  Future registInfoUser(
      String nameUser, String inviteCode, String phone) async {
    String _phone;
    // await sessionManager.getString(sessionManager.phone).then((value) => {
    if (phone.startsWith('0')) {
      _phone = '$phone';
    } else {
      _phone = '0$phone';
    }
    // });
    print(_phone);
    await _registRepository
        .register(nameUser, _phone, birthDay.value, inviteCode)
        .then((value) async {
      if (value != null && value.status == 200) {
        print('data ${value.data.customer.token}');
        name.value = '';
        errorInviteCode.value = '';
        sessionManager.setLogin(true);
        Constants.name = value.data.customer.name;
        Constants.tell = value.data.customer.tel;
        await sessionManager.setInt(
            sessionManager.roleId, value.data.customer.roleId);
        await sessionManager.saveUser(value.data.customer).then((value) {
          final controller = Get.find<HomeController>();

          controller.tabController.animateTo(0);
          Future.delayed(Duration(seconds: 1), () {
            Get.offAll(MainScreen());
          });
        });
      } else {
        errorInviteCode.value = 'Thông tin không chính xác!';
      }
    });
  }

  void showDateTimePicker() {
    DatePicker.showDatePicker(Get.context,
        showTitleActions: true,
        minTime: DateTime(1900, 1, 1),
        maxTime: DateTime(2020, 1, 1), onChanged: (date) {
      // print('change $date');
    }, onConfirm: (date) {
      // print('confirm $date');
      birthDay.value = '${date.year}-${date.month}-${date.day}';
    }, currentTime: DateTime.now(), locale: LocaleType.vi);
  }
}
