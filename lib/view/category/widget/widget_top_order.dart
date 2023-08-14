import 'package:flutter/material.dart';
import 'package:gsgr/value/colors.dart';

class WidgetTopOrder extends StatelessWidget {
  const WidgetTopOrder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kMaincolor,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('GSGR',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              )),
          Row(
            children: [
              Icon(
                Icons.call_outlined,
                color: Colors.white,
              ),
              SizedBox(width: 12),
              Icon(
                Icons.notifications_active_outlined,
                color: Colors.white,
              ),
              SizedBox(width: 12),
            ],
          ),
        ],
      ),
    );
  }
}
