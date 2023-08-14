import 'package:flutter/material.dart';
import 'package:gsgr/value/colors.dart';

class WidgetButtonAcceptAddress extends StatelessWidget {
  const WidgetButtonAcceptAddress({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.kMaincolor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black45, offset: Offset(0, 3), blurRadius: 8),
          ]),
      height: 44,
      child: Center(
        child: Text(
          'Xác nhận',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
