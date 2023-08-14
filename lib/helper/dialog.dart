import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static dialogWidthContentTitle(
      {String title, String content, dynamic item, Function fnc}) {
    title = '';
    // content = 'Custome dialog';

    showDialog(
        context: Get.context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      title == ''
                          ? SizedBox()
                          : Center(
                              child: Text(
                                title,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 30.0, right: 30.0, bottom: 12),
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.0),
                      )),
                  Divider(
                    height: 1,
                    color: Colors.grey[400],
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0)),
                            ),
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              height: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0)),
                              ),
                              child: Center(
                                child: Text(
                                  'Không',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 0.3,
                          color: Colors.grey,
                          height: 36,
                        ),
                        Expanded(
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0)),
                            ),
                            onTap: () {
                              fnc();
                              Get.back();
                            },
                            child: Container(
                              height: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0)),
                              ),
                              child: Center(
                                child: Text(
                                  'Hoàn thành',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static dialogLogout(
      {String title, String content, dynamic item, Function fnc}) {
    title = '';
    // content = 'Custome dialog';

    showDialog(
        context: Get.context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      title == ''
                          ? SizedBox()
                          : Center(
                              child: Text(
                                title,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 30.0, right: 30.0, bottom: 12),
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.0),
                      )),
                  Divider(
                    height: 1,
                    color: Colors.grey[400],
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0)),
                            ),
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              height: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0)),
                              ),
                              child: Center(
                                child: Text(
                                  'Huỷ bỏ',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 0.3,
                          color: Colors.grey,
                          height: 36,
                        ),
                        Expanded(
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0)),
                            ),
                            onTap: () {
                              fnc();
                              // Get.back();
                            },
                            child: Container(
                              height: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0)),
                              ),
                              child: Center(
                                child: Text(
                                  'Đăng xuất',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.redAccent),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static dialogRemoveAccount(
      {String title, String content, dynamic item, Function fnc}) {
    title = '';
    // content = 'Custome dialog';

    showDialog(
        context: Get.context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      title == ''
                          ? SizedBox()
                          : Center(
                              child: Text(
                                title,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 30.0, right: 30.0, bottom: 12),
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.0),
                      )),
                  Divider(
                    height: 1,
                    color: Colors.grey[400],
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0)),
                            ),
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              height: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0)),
                              ),
                              child: Center(
                                child: Text(
                                  'Huỷ bỏ',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 0.3,
                          color: Colors.grey,
                          height: 36,
                        ),
                        Expanded(
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0)),
                            ),
                            onTap: () {
                              fnc();
                              // Get.back();
                            },
                            child: Container(
                              height: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0)),
                              ),
                              child: Center(
                                child: Text(
                                  'Xác Nhận',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.redAccent),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static confirmDialogLogout(
      {String title, String content, dynamic item, Function fnc}) {
    title = '';

    showDialog(
        context: Get.context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      title == ''
                          ? SizedBox()
                          : Center(
                              child: Text(
                                title,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 30.0, right: 30.0, bottom: 12),
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.0),
                      )),
                  Divider(
                    height: 1,
                    color: Colors.grey[400],
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0)),
                            ),
                            onTap: () {
                              fnc();
                              Get.back();
                            },
                            child: Container(
                              height: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0)),
                              ),
                              child: Center(
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.redAccent),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static dialogWarning(
      {dynamic title, String content, dynamic item, Function fnc}) {
    title = '';
    // content = 'Custome dialog';

    showDialog(
        context: Get.context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      title == ''
                          ? SizedBox()
                          : Center(
                              child: Text(
                                title,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 30.0, right: 30.0, bottom: 12),
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13.0),
                      )),
                  Divider(
                    height: 1,
                    color: Colors.grey[400],
                  ),
                  InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(12.0)),
                    ),
                    onTap: () {
                      fnc();
                    },
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)),
                      ),
                      child: Center(
                        child: Text(
                          'Tôi đã hiểu',
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
