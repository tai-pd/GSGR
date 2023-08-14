import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/item_place.dart';

class PlaceScreen extends StatelessWidget {
  static const routeName = '/place';
  static final route = GetPage(name: routeName, page: () => PlaceScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    'Các cửa hàng khác',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/ic_logo.png',
                      width: 64,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: WidgetCarPlace(
                        title: 'Giặt Sấy Giá Rẻ CS1',
                        time: '7:00 - 22:00',
                        address:
                            '62 Phạm Văn Nghị - P. Thạc Gián - Q. Thanh Khê - TP. Đà Nẵng',
                        phone: '0901955705',
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/ic_logo.png',
                      width: 64,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: WidgetCarPlace(
                        title: 'Giặt Sấy Giá Rẻ CS2',
                        time: '7:00 - 22:00',
                        address:
                            '533 Hoàng Diệu - P. Hòa Thuận Đông - Q. Hải Châu - TP. Đà Nẵng',
                        phone: '0779401286',
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/ic_logo.png',
                      width: 64,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: WidgetCarPlace(
                        title: 'Giặt Sấy Giá Rẻ CS3',
                        time: '7:00 - 22:00',
                        address:
                            '130 Phan Thanh - P. Thạc Gián - Q. Thanh Khê - TP Đà Nẵng',
                        phone: '0774571050',
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/ic_logo.png',
                      width: 64,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: WidgetCarPlace(
                        title:
                            'Clean Mac - Spa Giày Đà Nẵng ( By Giatsaygiare.vn )',
                        time: '9:00 - 21:00',
                        address:
                            'Tầng 2, 130 Phan Thanh - P. Thạc Gián - Q. Thanh Khê - TP Đà Nẵng',
                        phone: '0905576921',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
