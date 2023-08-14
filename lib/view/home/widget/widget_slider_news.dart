import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/home_controller.dart';
import 'package:gsgr/controller/new_controller.dart';
import 'package:gsgr/models/new_model.dart';
import 'package:gsgr/view/bottomSheets/BottomSheetNews.dart';

class WidgetSliderNews extends StatefulWidget {
  WidgetSliderNews({
    Key key,
  }) : super(key: key);

  @override
  _WidgetSliderNewsState createState() => _WidgetSliderNewsState();
}

class _WidgetSliderNewsState extends State<WidgetSliderNews> {
  final controller = Get.find<NewController>();

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final List<int> fixedList =
        Iterable<int>.generate(controller.list.length).toList();
    return Obx(() => controller.list.length == 0
        ? SizedBox()
        : CarouselSlider(
            items: fixedList.map((i) {
              return Builder(builder: (BuildContext bc) {
                Newses item = controller.list[i];
                return InkWell(
                  onTap: () {
                    Get.bottomSheet(
                      BottomSheetNews(
                        newsId: item.id,
                      ),
                      enableDrag: true,
                      isScrollControlled: true,
                    );
                  },
                  child: Container(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    height: 200,
                    decoration: item.image != null
                        ? BoxDecoration(
                            color: Colors.black12,
                            image: DecorationImage(
                                image: NetworkImage(item.image)))
                        : BoxDecoration(color: Colors.black12),
                  ),
                );
              });
            }).toList(),
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            ),
          ));
  }
}
