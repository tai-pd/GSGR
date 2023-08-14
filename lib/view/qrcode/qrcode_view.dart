import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/value/colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../controller/home_controller.dart';

class QRCodeView extends StatefulWidget {
  const QRCodeView({Key key}) : super(key: key);

  @override
  State<QRCodeView> createState() => _QRCodeViewState();
}

class _QRCodeViewState extends State<QRCodeView> {
  final homeCtl = Get.find<HomeController>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Timer _timer;
  bool _changeLine = false;

  void startLoop() {
    const loopTime = const Duration(seconds: 2);
    _timer = Timer.periodic(loopTime, (Timer timer) {
      setState(() {
        _changeLine = !_changeLine;
      });
    });
  }

  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      homeCtl.controllerQRCode.pauseCamera();
    } else if (Platform.isIOS) {
      homeCtl.controllerQRCode.resumeCamera();
    }
  }

  @override
  void initState() {
    super.initState();
    startLoop();
  }

  @override
  void dispose() {
    homeCtl.controllerQRCode?.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          QRView(key: qrKey, onQRViewCreated: homeCtl.onQRViewCreated),
          Positioned(
            left: 30,
            right: 30,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/qr_image_border_1.png'),
                AnimatedPositioned(
                    duration: Duration(seconds: 2),
                    top: _changeLine ? 24 : Get.width - 60 - 24,
                    left: 32,
                    right: 32,
                    child: Container(
                      height: 4,
                      decoration:
                          BoxDecoration(color: Colors.yellow.withOpacity(.3)),
                      child: Center(
                        child: Divider(
                          color: Colors.yellow,
                          thickness: 2,
                        ),
                      ),
                    )),
              ],
            ),
            // top: (Get.height - Get.width - 30) / 2,
            // left: 30,
          ),
          // Positioned(
          //     // top: (Get.width - 60) / 2 + 24,
          //     child: AnimatedContainer(
          //   duration: Duration(seconds: 2),
          //   decoration: BoxDecoration(
          //       boxShadow: [],
          //       border:
          //           Border(bottom: BorderSide(color: Colors.yellow, width: 1))),
          //   width: Get.width - 60 - 32,
          //   height: _changeLine ? Get.width - 60 - 44 : 1,
          // )),
          Positioned(
              left: 24,
              top: 42,
              child: GestureDetector(
                onTap: (() => Get.back()),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      color: AppColors.kMaincolor,
                      borderRadius: BorderRadius.circular(45)),
                  child: Center(
                      child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
                ),
              ))
        ],
      ),
    );
  }
}
