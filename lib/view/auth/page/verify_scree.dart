import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/verify_controller.dart';
import 'package:gsgr/service/push_notification_service.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/widget/numeric_pad.dart';

class VerifyPhone extends StatefulWidget {
  static const String routeName = '/verify';
  final String phoneNumber;

  VerifyPhone({@required this.phoneNumber});

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  FirebaseNotification firebaseNotification = FirebaseNotification();
  String code = "";
  final controller = Get.put(VerifyController());

  @override
  void initState() {
    super.initState();
    controller.phoneNumber = widget.phoneNumber;
    // WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
    //   firebaseNotification.setupFirebase();
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // widget.controller.sendSMS(widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Xác nhận mã OTP",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                        child: Center(
                          child: Text(
                            "Một mã xác thực gồm 6 số đã được gởi đến số điện thoại " +
                                widget.phoneNumber,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF818181),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            buildCodeNumberBox(
                                code.length > 0 ? code.substring(0, 1) : ""),
                            buildCodeNumberBox(
                                code.length > 1 ? code.substring(1, 2) : ""),
                            buildCodeNumberBox(
                                code.length > 2 ? code.substring(2, 3) : ""),
                            buildCodeNumberBox(
                                code.length > 3 ? code.substring(3, 4) : ""),
                            buildCodeNumberBox(
                                code.length > 4 ? code.substring(4, 5) : ""),
                            buildCodeNumberBox(
                                code.length > 5 ? code.substring(5, 6) : ""),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Bạn không nhân được mã? ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF818181),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.sendSMS();
                              },
                              child: Text(
                                "Gửi lại",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.verifyNumber(code);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.kMaincolor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Xác thực tài khoản",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              NumericPad(
                onNumberSelected: (value) {
                  print(value);
                  setState(() {
                    if (value != -1) {
                      if (code.length < 6) {
                        code = code + value.toString();
                      }
                    } else {
                      if (code.length >= 1) {
                        code = code.substring(0, code.length - 1);
                      }
                    }
                    print(code);
                  });
                },
              ),
            ],
          ),
          Obx(
            () => Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: controller.isLoading.value
                  ? Container(
                      color: Colors.black12,
                      child: Center(child: CircularProgressIndicator()))
                  : SizedBox(),
            ),
          ),
          Obx(() => Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: controller.isSendingOTP.value
                  ? Container(
                      alignment: Alignment.center,
                      color: Colors.black12,
                      child: Container(
                        height: 88,
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Đang gởi mã xác thực',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              controller.valueString.value,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  : const SizedBox()))
        ],
      )),
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 44,
        height: 44,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6F5FA),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.75))
            ],
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
