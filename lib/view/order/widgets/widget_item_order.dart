import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/cart_controller.dart';
import 'package:gsgr/controller/order_controller.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/models/product_model.dart';
import 'package:gsgr/value/colors.dart';

class WidgetItemOrder extends StatefulWidget {
  WidgetItemOrder({
    Key key,
  }) : super(key: key);

  @override
  _WidgetItemOrderState createState() => _WidgetItemOrderState();
}

class _WidgetItemOrderState extends State<WidgetItemOrder> {
  final controller = Get.find<OrderController>();

  final cardController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 22),
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 22),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sản phẩm ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  child: const Text('Thêm sản phẩm'),
                  onPressed: () {
                    Get.back();
                  },
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: List.generate(cardController.listItem.length, (index) {
              Products item = cardController.listItem[index];
              return Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      item.image,
                      width: 54,
                      height: 54,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${item.name}'),
                          Text(
                              '${Helper.convertPrice(item.price.toString())}/${Helper.convertTypeProducts(item.unit)}')
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            if (item.quantity == 1) {
                              Helper.showDialogConfirm('Xoá Sản phẩm',
                                  'Bạn chắc chắn muốn xoá sản phẩm ${item.name} khỏi giỏ hàng của bạn?',
                                  onBack: () {
                                cardController.listItem.removeWhere(
                                    (element) => element.id == item.id);
                                cardController.countItemQuatity();
                              });
                            } else {
                              setState(() {
                                cardController.removeItemTocar(item);
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.kMaincolor),
                            child: Icon(
                              Icons.remove_circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 32,
                          child: Center(
                            child: Text(
                              '${cardController.getNumberQuatity(item) ?? 0}',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              cardController.addItemtoCart(item);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.kMaincolor),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
          const Divider(
            color: Colors.black12,
            thickness: .5,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Phí giao nhận ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/ic_logo.png',
                  width: 54,
                  height: 54,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(' Phí nhận hàng'),
                      const Text('10.000đ ')
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/ic_logo.png',
                  width: 54,
                  height: 54,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(' Phí giao hàng '), Text('10.000đ ')],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.red, width: .5)),
            child: const Text(
              'Tổng tiền cần thanh toán sẽ được chúng tôi cập nhật sau khi quá trình giặt kết thúc.',
              style: TextStyle(
                  color: Colors.red, fontStyle: FontStyle.italic, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
