import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/view/setting/page/history/history_detail.dart';

class SlideTypeOrder extends StatelessWidget {
  const SlideTypeOrder({
    Key key,
    @required this.widget,
    @required double size,
    this.sizeText,
  })  : _size = size,
        super(key: key);

  final HistoryDetail widget;
  final double _size;
  final double sizeText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 78,
          height: 54,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.kMaincolor, width: 1),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(widget.item.id.toString() ?? '',
                style: TextStyle(
                    color: AppColors.kMaincolor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              width: sizeText,
              alignment: Alignment.centerRight,
              duration: const Duration(seconds: 1),
              child: Text(
                widget.item.statusContent ?? '',
                style: TextStyle(
                    color: AppColors.kMaincolor, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.kMainBackground,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black54, width: 1)),
                    width: Get.width * 0.7,
                    height: 22,
                  ),
                  Positioned(
                    child: AnimatedContainer(
                      width: _size,
                      height: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.kMaincolor,
                      ),
                      duration: const Duration(seconds: 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
