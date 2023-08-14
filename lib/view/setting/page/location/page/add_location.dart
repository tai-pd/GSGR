import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/view/address/address_screen.dart';
import 'package:gsgr/widget/top_nav.dart';

class AddLocation extends StatelessWidget {
  static const String routeName = '/addlocation';
  static final route = GetPage(name: routeName, page: () => AddLocation());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kMaincolor,
      body: SafeArea(
        child: Container(
          color: AppColors.kMainBackground,
          child: Column(children: [
            WidgetTopNav(title: 'Thêm địa chỉ mới'),
            Container(
              margin: EdgeInsets.only(top: 12),
              color: Colors.white,
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tên địa chỉ'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nhà/Cơ quan/...'),
                    ),
                  ),
                  Container(
                      color: Colors.black12,
                      height: 1,
                      margin: EdgeInsets.symmetric(horizontal: 12)),
                  SizedBox(height: 12),
                  Text('Địa chỉ *'),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AddressScreen.routeName);
                    },
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        child: Row(
                          children: [
                            Expanded(child: Text('Chọn Địa chỉ ')),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: AppColors.kMaincolor,
                            )
                          ],
                        )),
                  ),
                  Container(
                      color: Colors.black12,
                      height: 1,
                      margin: EdgeInsets.symmetric(horizontal: 12)),
                  SizedBox(height: 12),
                  Text('Ghi chú'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      maxLines: 2,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Ghi chú (số nhà, tên đường,...'),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
