import 'package:flutter/material.dart';
import 'package:gsgr/value/colors.dart';

class LineDashedPainter extends StatelessWidget {
  final double height;
  final Color color;

  const LineDashedPainter(
      {this.height = 1, this.color = AppColors.kMainBackground});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final dashHeight = 10.0;
        return Flex(
          children: List.generate(5, (_) {
            return Container(
              margin: EdgeInsets.all(4),
              width: dashHeight,
              height: dashHeight,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(20)),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
        );
      },
    );
  }
}
