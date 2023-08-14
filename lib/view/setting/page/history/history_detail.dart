import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/helper/data.dart';
import 'package:gsgr/models/history_order_model.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/view/setting/page/history/widget/list_product_history_customer.dart';
import 'package:gsgr/view/setting/page/history/widget/slide_type_order.dart';
import 'package:gsgr/view/setting/page/history/widget/status_detail_order.dart';
import 'package:gsgr/widget/top_nav.dart';

class HistoryDetail extends StatefulWidget {
  static const String routeName = '/historyDetail';
  static final route = GetPage(name: routeName, page: () => HistoryDetail());
  final Order item;
  final double sum;

  HistoryDetail({this.item, this.sum});

  @override
  _HistoryDetailState createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
  double _size = 0;
  double _sizeText = 200;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _size = Get.width * percentStatus(widget.item.status);
        _sizeText = 200;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMaincolor,
      body: SafeArea(
        child: Container(
          color: AppColors.kMainBackground,
          child: Column(children: [
            WidgetTopNav(
              title: 'Chi tiết',
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SlideTypeOrder(
                      widget: widget,
                      size: _size,
                      sizeText: _sizeText,
                    ),
                    const SizedBox(height: 24),
                    Text('Chi tiết đơn hàng',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Divider(
                      color: Colors.black54,
                    ),
                    ListProductHistoryCustomer(widget: widget),
                    SizedBox(height: 14),
                    Divider(
                      color: Colors.black54,
                    ),
                    StatusDetailOrder(widget: widget),
                    Divider(
                      color: Colors.black54,
                    ),
                    Row(
                      children: [
                        Icon(Icons.note_alt, color: AppColors.kMaincolor),
                        SizedBox(width: 8),
                        Text(
                          'Ghi chú đơn hàng: ',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Expanded(child: Text(widget.item.remark ?? ''))
                      ],
                    ),
                    SizedBox(height: 32)
                  ],
                ),
              ),
            ))
          ]),
        ),
      ),
    );
  }
}
