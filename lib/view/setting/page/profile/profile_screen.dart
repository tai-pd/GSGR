import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/models/register_model.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/value/session_manager.dart';
import 'package:gsgr/widget/top_nav.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';
  static final route = GetPage(name: routeName, page: () => ProfileScreen());

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final SessionManager _sessionManager = SessionManager();
  Customer user;
  @override
  void initState() {
    super.initState();
    _sessionManager.getUser().then((value) {
      setState(() {
        user = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMaincolor,
      body: SafeArea(
        child: Container(
          color: AppColors.kMainBackground,
          child: Column(children: [
            WidgetTopNav(
              title: 'Thông tin cá nhân',
            ),
            // Container(
            //   height: 120,
            //   width: 120,
            //   child: Stack(
            //     children: [
            //       Center(
            //         child: CircleAvatar(
            //           child: Image.asset(
            //             'assets/images/ic_logo.png',
            //             width: 164,
            //             height: 164,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 18),
            Container(
              margin: EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.person_outline_rounded,
                    color: AppColors.kMaincolor,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Tên',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Container(
                width: Get.width,
                height: 48,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 1),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  '${user?.name ?? ''}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                )),
            Container(
              margin: EdgeInsets.only(left: 12, top: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.phone_android_rounded,
                    color: AppColors.kMaincolor,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Điện thoại',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width,
              height: 48,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                '${user?.tel ?? ''}',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12, top: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.date_range_rounded,
                    color: AppColors.kMaincolor,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Ngày sinh',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width,
              height: 48,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                '${user?.birthday ?? ''}',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
