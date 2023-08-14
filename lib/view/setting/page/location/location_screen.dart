import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/view/setting/page/location/page/add_location.dart';
import 'package:gsgr/widget/top_nav.dart';

class LocationScreen extends StatelessWidget {
  static const routeName = '/location';
  static final route = GetPage(name: routeName, page: () => LocationScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kMaincolor,
      body: SafeArea(
        child: Container(
          color: AppColors.kMainBackground,
          child: Column(children: [
            WidgetTopNav(title: 'Địa chỉ đã lưu'),
            InkWell(
              onTap: () {
                Get.toNamed(AddLocation.routeName);
              },
              child: Container(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Thêm địa chỉ mới',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
