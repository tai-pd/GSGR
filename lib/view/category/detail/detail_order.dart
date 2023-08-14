import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/cart_controller.dart';
import 'package:gsgr/models/product_model.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/value/styles.dart';
import 'package:gsgr/view/order/order_screen.dart';
import 'package:gsgr/view/setting/page/faq/faq_screen.dart';

class DetailOrder extends StatefulWidget {
  final Products item;
  DetailOrder({this.item});

  @override
  _DetailOrderState createState() => _DetailOrderState();
}

class _DetailOrderState extends State<DetailOrder> {
  final orderController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMaincolor,
      body: SafeArea(
        child: Container(
          color: AppColors.kMainBackground,
          child: Column(
            children: [
              Container(
                height: 54,
                color: AppColors.kMaincolor,
                child: Row(
                  children: [
                    BackButton(
                      color: Colors.white,
                    ),
                    Text('Chi tiết sản phẩm', style: AppStyles.kTitleBack)
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: widget.item.image != null
                          ? BoxDecoration(
                              color: Colors.redAccent.withOpacity(.5),
                              image: DecorationImage(
                                  image: NetworkImage(widget.item.image),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(0))
                          : BoxDecoration(),
                    ),
                    Positioned(
                      top: Get.height / 6,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.kMainBackground,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24)),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: Get.width,
                                height: 100,
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${widget.item.name ?? ''}',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          orderController
                                              .removeItemTocar(widget.item);
                                        });
                                      },
                                      child: Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                            color: AppColors.kMaincolor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(0, 4),
                                                  blurRadius: 8)
                                            ]),
                                        child: Center(
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${orderController.getNumberQuatity(widget.item) ?? 0}',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          orderController
                                              .addItemtoCart(widget.item);
                                        });
                                      },
                                      child: Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                            color: (widget.item.isMulti == 0 &&
                                                    orderController
                                                        .checkIssetItemInCart(
                                                            widget.item))
                                                ? Colors.grey
                                                : AppColors.kMaincolor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(0, 4),
                                                  blurRadius: 8)
                                            ]),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text('${widget.item?.process ?? ''}'),
                              ),
                              titleCategoryFAQ('2. Điều khoản '),
                              SizedBox(height: 8),
                              ExpanedItemFAQ(
                                content: """
 - Chúng tôi cam kết lưu trữ đồ khách hàng trong 30 ngày kể từ ngày nhận xử lý. Sau 30 ngày nếu chúng tôi đã liên hệ nhưng khách hàng không nhận hàng thì cửa hàng sẽ xin được phép hủy đơn hàng hóa và sẽ không hoàn trả lại bất cứ gì cho khách hàng.
 """,
                                title: 'Lưu trữ',
                              ),
                              ExpanedItemFAQ(
                                content: """
 - Chúng tôi sẽ cố gắng giao và nhận hàng của khách hàng trong 24h. 

 - Trong những điều kiện thời tiết khó khăn có thể chúng tôi áp dụng mức phí phụ thu trong vận chuyển.

 - Chúng tôi sẽ từ chối nhận vận nếu đơn hàng quá xa địa chỉ cửa hàng hoặc trong trường hợp cửa hàng quá tải.
                          """,
                                title: 'Giao nhận',
                              ),
                              ExpanedItemFAQ(
                                content: """
 - Đối với sản phầm giặt theo khối lượng kg :

  + Chúng tôi không nhận giặt tất, vớ và đồ nội y.
  + Các đồ ra màu quý khách hàng vui lòng tự phân tách và báo trước cho chúng tôi.

 - Khách hàng lưu ý kiểm tra đồ vật cá nhân còn sót trong quần áo trước khi giao cho chúng tôi xử lý.
                          """,
                                title: 'Lưu ý sản phẩm',
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Obx(() => orderController.countItemCar.value > 0
                        ? Positioned(
                            bottom: 12,
                            left: 8,
                            right: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(2, 2),
                                      blurRadius: 4)
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              height: 64,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Đơn hàng của bạn',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Số lượng sản phẩm:',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                  '${orderController.countItemCar.value} Sản phẩm',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  OrderScreen()))
                                          .then((value) {
                                        setState(() {});
                                      });
                                      // Get.toNamed(.routeName);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 8),
                                      width: 80,
                                      height: 54,
                                      decoration: BoxDecoration(
                                        color: AppColors.kMaincolor,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black45,
                                              offset: Offset(2, 2),
                                              blurRadius: 4)
                                        ],
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Đặt Hàng',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : SizedBox())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container titleCategoryFAQ(String title) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.only(top: 12, left: 8, right: 8),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.kMaincolor.withOpacity(.8)),
      child: Text(
        title ?? '',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
