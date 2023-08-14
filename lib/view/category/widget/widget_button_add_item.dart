import 'package:flutter/material.dart';

class WidgetButtonAddItem extends StatelessWidget {
  WidgetButtonAddItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 12,
      bottom: 34,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black45, offset: Offset(0, 3), blurRadius: 4)
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Text('-', style: TextStyle(color: Colors.brown, fontSize: 24)),
            SizedBox(width: 8),
            Text('0', style: TextStyle(color: Colors.black, fontSize: 18)),
            SizedBox(width: 8),
            Text('+', style: TextStyle(color: Colors.brown, fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
