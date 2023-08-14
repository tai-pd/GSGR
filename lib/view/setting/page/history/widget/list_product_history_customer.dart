import 'package:flutter/material.dart';
import 'package:gsgr/helper/helper.dart';
import '../history_detail.dart';

class ListProductHistoryCustomer extends StatelessWidget {
  const ListProductHistoryCustomer({Key key, @required this.widget})
      : super(key: key);

  final HistoryDetail widget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: List.generate(widget.item.products.length, (index) {
              return Row(
                children: [
                  Text(
                    '${widget.item.products[index].pivot.quantity.replaceFirst('.00', '')}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Text('x'),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.item.products[index].name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '${Helper.convertPrice('${(widget.item.products[index].price * double.parse(widget.item.products[index].pivot.quantity)).toString().replaceFirst('.0', '')}')}',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ],
              );
            }),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text('Phí nhận hàng'),
              ),
              (widget.item.isShipper == 1 && widget.item.type == 2)
                  ? Text('10.000đ')
                  : Text('0đ'),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text('Phí giao hàng'),
              ),
              widget.item.isShipper == 1 ? Text('10.000đ') : Text('0đ'),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text('Mã giảm giá'),
              ),
              Text(widget.item.couponName ?? '0')
            ],
          ),
          widget.item.payment != null
              ? Column(
                  children: [
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Đổi điểm',
                          ),
                        ),
                        Text(
                          '${Helper.convertPrice((double.parse(widget.item.payment.point) * 1000).toString())}',
                        ),
                      ],
                    ),
                  ],
                )
              : SizedBox(),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Tổng tiền',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '${Helper.convertPrice(widget.sum.toString())}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Thành tiền',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '${Helper.convertPrice(widget.item.totalPrice.toString())}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 12),
          widget.item.payment != null
              ? Column(
                  children: [
                    Text(
                      'Phương thức thanh toán',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                    Divider(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Điểm',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Text(
                          '${Helper.convertPrice((double.parse(widget.item.payment.point) * 1000).toString())}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Chuyển khoản',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Text(
                          '${Helper.convertPrice(widget.item.payment.transfer.toString())}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Tiền mặt',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Text(
                          '${Helper.convertPrice(widget.item.payment.cash.toString())}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(
                      height: 12,
                    )
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
    // SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Row(
    //     children: List.generate(widget.item.products.length, (index) {
    //       return Container(
    //         height: 180,
    //         margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
    //         decoration: BoxDecoration(
    //             color: AppColors.kMaincolor,
    //             borderRadius: BorderRadius.circular(8),
    //             boxShadow: [
    //               BoxShadow(
    //                   color: Colors.black38,
    //                   offset: Offset(0, 3),
    //                   blurRadius: 8)
    //             ]),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Container(
    //               decoration: BoxDecoration(
    //                   border: Border(
    //                       bottom: BorderSide(color: Colors.white24, width: 0))),
    //               child: Image.network(
    //                 widget.item.products[index].image,
    //                 width: 200,
    //                 height: 100,
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //             Container(
    //               padding: EdgeInsets.only(left: 8, top: 8),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     widget.item.products[index].name,
    //                     style: TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 14,
    //                         fontWeight: FontWeight.bold),
    //                   ),
    //                   Row(
    //                     children: [
    //                       Icon(Icons.monetization_on_outlined,
    //                           color: Colors.white),
    //                       SizedBox(width: 4),
    //                       Text(
    //                         '${Helper.convertPrice(widget.item.products[index].price.toString())}đ',
    //                         style: TextStyle(color: Colors.white),
    //                       ),
    //                     ],
    //                   ),
    //                   Row(
    //                     children: [
    //                       Icon(
    //                         Icons.playlist_add,
    //                         color: Colors.white,
    //                       ),
    //                       SizedBox(width: 4),
    //                       Text(
    //                         '${widget.item.products[index].pivot.quantity.replaceFirst('.00', '')}',
    //                         style: TextStyle(color: Colors.white),
    //                       ),
    //                     ],
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       );
    //     }),
    //   ),
    // );
  }
}
