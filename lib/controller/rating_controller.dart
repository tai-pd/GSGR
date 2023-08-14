import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:gsgr/helper/helper.dart';

class RatingController extends GetxController {
  void sendMail({
    String body,
    String emails,
    String name,
    String phone,
  }) async {
    final Email email = Email(
      body: """
      Phản hồi App: 
      Tên : ${name ?? ''}
      Số điện thoại : ${phone ?? ''}
      Email : ${emails ?? ''}
      Nội dung : ${body ?? ''}""",
      recipients: ['giatsaygiare@gmail.com'],
      isHTML: false,
    );
    try {
      await FlutterEmailSender.send(email).then((_) {
        Helper.showDialog('Thành công', 'Cảm ơn bạn đã gởi phản hồi!!',
            onBack: () {
          Get.back();
        });
      });
    } catch (error) {
      print(error.toString());
    }
  }
}
