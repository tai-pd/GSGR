import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ussd_service/ussd_service.dart';

class ContactController extends GetxController {
  makeMyRequest() async {
    int subscriptionId = 1; // sim card subscription Id
    String code = "*21#"; // ussd code payload
    try {
      String ussdSuccessMessage =
          await UssdService.makeRequest(subscriptionId, code);
      print("succes! message: $ussdSuccessMessage");
    } on PlatformException catch (e) {
      print("error! code: ${e.code} - message: ${e.message}");
    }
  }

  void sendMail(String body) async {
    final Email email = Email(
      body: 'Email body',
      recipients: ['giatsaygiare@gmail.com'],
      isHTML: false,
    );
    try {
      await FlutterEmailSender.send(email).then((_) {
        print('okj');
      });
      print('Success');
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> launchURL() async {
    if (await canLaunch('http://giatsaygiare.vn')) {
      await launch('http://giatsaygiare.vn');
    } else {
      throw 'Could not launch URL http://giatsaygiare.vn';
    }
  }

  Future<void> launchFacebook() async {
    if (await canLaunch('https://www.facebook.com/giatsaygiare.vn/')) {
      await launch('https://www.facebook.com/giatsaygiare.vn/');
    } else {
      throw 'Could not launch URL https://www.facebook.com/giatsaygiare.vn/';
    }
  }
}
