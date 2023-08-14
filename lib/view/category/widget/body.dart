import 'package:easycartanimation/easycartanimation.dart';
import 'package:flutter/material.dart';
import 'package:gsgr/controller/cart_controller.dart';
import 'package:gsgr/controller/category_controller.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/models/category_model.dart';
import 'package:gsgr/models/product_model.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/view/category/detail/detail_order.dart';

import 'package:get/get.dart';
import 'package:gsgr/view/order/order_screen.dart';

class Body extends StatefulWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final controller = Get.put(CategoryControllor());

  final orderController = Get.put(CartController());
  GlobalKey _key = GlobalKey();
  Offset _endOffset;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((c) {
    //   // Get the location of the "shopping cart"
    //   _endOffset = (_key.currentContext.findRenderObject() as RenderBox)
    //       .localToGlobal(Offset.zero);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kMaincolor,
      child: SafeArea(
        child: Container(
          color: AppColors.kMainBackground,
          child: Column(
            children: [
              Obx(
                () => DefaultTabController(
                  length: controller.category.length,
                  child: Expanded(
                    child: Scaffold(
                      appBar: AppBar(
                        toolbarHeight: 12,
                        backgroundColor: AppColors.kMainBackground,
                        bottom: TabBar(
                            indicatorColor: Colors.lime,
                            labelColor: Colors.black,
                            isScrollable: true,
                            tabs: List.generate(controller.categoryOrder.length,
                                (index) {
                              return Tab(
                                iconMargin: EdgeInsets.only(bottom: 4),
                                text: (controller.categoryOrder[index]
                                        as Categorys)
                                    .name,
                              );
                            })),
                      ),
                      body: TabBarView(
                        children: List.generate(controller.categoryOrder.length,
                            (index) {
                          return Container(
                              child: SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                  (controller.categoryOrder[index] as Categorys)
                                      .products
                                      .length, (i) {
                                Products item = (controller.categoryOrder[index]
                                        as Categorys)
                                    .products[i];
                                return Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller
                                            .permisionLocation()
                                            .then((value) {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailOrder(
                                                        item: item,
                                                      )));
                                          // Get.to();
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 4),
                                        decoration: item.image != null
                                            ? BoxDecoration(
                                                color: Colors.redAccent
                                                    .withOpacity(.5),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        item.image),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(20))
                                            : BoxDecoration(),
                                        width: Get.width,
                                        height: 200,
                                      ),
                                    ),
                                    Positioned(
                                      top: 34,
                                      left: 4,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 8),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12))),
                                        child: Text(
                                          '${Helper.convertPrice(item.price.toString())} / ${Helper.convertTypeProducts(item.unit)}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 34,
                                      left: 4,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.black12,
                                        ),
                                        child: Text(
                                          '${item.name}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 12,
                                      bottom: 22,
                                      child: InkWell(
                                        onTap: () {
                                          controller
                                              .permisionLocation()
                                              .then((value) {
                                            // Navigator.of(context)
                                            //     .push(MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             DetailOrder(
                                            //               item: item,
                                            //             )))
                                            //     .then((value) {});
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            InkWell(
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 13),
                                                decoration: BoxDecoration(
                                                  color: AppColors.kMaincolor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black45,
                                                        offset: Offset(0, 3),
                                                        blurRadius: 4)
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Text(
                                                  '-',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  orderController
                                                      .removeItemTocar(item);
                                                });
                                              },
                                            ),
                                            VerticalDivider(
                                              width: 18,
                                            ),
                                            Text(
                                              '${orderController.getNumberQuatity(item) ?? 0}',
                                              style: TextStyle(
                                                  color:
                                                      AppColors.kMainBackground,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            VerticalDivider(
                                              width: 18,
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 18,
                                                            vertical: 13),
                                                    decoration: BoxDecoration(
                                                        color: (item.isMulti ==
                                                                    0 &&
                                                                orderController
                                                                    .checkIssetItemInCart(
                                                                        item))
                                                            ? Colors.grey
                                                            : AppColors
                                                                .kMaincolor,
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors
                                                                  .black45,
                                                              offset:
                                                                  Offset(0, 3),
                                                              blurRadius: 4)
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Text(
                                                      '+',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    // var _overlayEntry =
                                                    //     OverlayEntry(
                                                    //         builder: (_) {
                                                    //   RenderBox box = context
                                                    //       .findRenderObject();
                                                    //   var offset =
                                                    //       box.localToGlobal(
                                                    //           Offset.zero);
                                                    //   return EasyCartAnimation(
                                                    //       startPosition:
                                                    //           offset,
                                                    //       endPosition:
                                                    //           _endOffset);
                                                    // });
                                                    // // Show Overlay
                                                    // Overlay.of(context)
                                                    //     .insert(
                                                    //         _overlayEntry);
                                                    // Future.delayed(
                                                    //     Duration(
                                                    //         milliseconds:
                                                    //             800), () {
                                                    //   _overlayEntry
                                                    //       .remove();
                                                    //   _overlayEntry = null;
                                                    // });
                                                    setState(() {
                                                      orderController
                                                          .addItemtoCart(item);
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ));
                        }),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => orderController.countItemCar.value > 0
                    ? Container(
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
                        height: orderController.countItemCar.value > 0 ? 64 : 0,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                            '${orderController.countItemCar.value} Sản phẩm',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900))
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
                                        builder: (context) => OrderScreen()))
                                    .then((value) {});
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
                      )
                    : SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
