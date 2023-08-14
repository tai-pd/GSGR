import 'package:flutter/material.dart';
import 'package:gsgr/helper/data.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/view/setting/page/history/history_detail.dart';

class StatusOrder extends StatelessWidget {
  const StatusOrder({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final HistoryDetail widget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(widget.item.orderHistories.length, (index) {
          return Container(
            margin: EdgeInsets.only(top: 6),
            child: Row(
              children: [
                CheckBoxSelected(),
                SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 120,
                  child: Text(getStatusContent(
                          widget.item.orderHistories[index].orderStatusId) ??
                      ''),
                ),
                SizedBox(width: 12),
                Text(
                    '${widget.item.orderHistories[index].updatedAt.substring(0, 10)}'),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.item.orderHistories[index].createdAt.substring(11, 19)}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text('${widget.item.orderHistories[index].customerId}')
              ],
            ),
          );
        }),
      ),
    );
  }
}

class CheckBoxSelected extends StatelessWidget {
  const CheckBoxSelected({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 22,
      decoration: BoxDecoration(
          color: AppColors.kMaincolor, borderRadius: BorderRadius.circular(6)),
      child: Center(
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }
}
