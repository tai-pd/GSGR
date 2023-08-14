import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/value/colors.dart';

class WidgetButtonBackAddress extends StatelessWidget {
  const WidgetButtonBackAddress({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 54,
      left: 12,
      child: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Icon(
              Icons.arrow_back,
              color: AppColors.kMaincolor,
            ),
          )),
    );
  }
}
