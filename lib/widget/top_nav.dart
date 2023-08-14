import 'package:flutter/material.dart';
import 'package:gsgr/value/colors.dart';

class WidgetTopNav extends StatelessWidget {
  final String title;
  const WidgetTopNav({
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kMaincolor,
      child: Row(
        children: [
          BackButton(
            color: Colors.white,
          ),
          Text(
            '$title',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
