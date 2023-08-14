import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/cart_controller.dart';
import 'package:gsgr/controller/order_controller.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/value/styles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gsgr/view/order/widgets/widget_customer_order.dart';

import 'widgets/widget_addcode_order.dart';
import 'widgets/widget_addr_order.dart';
import 'widgets/widget_item_order.dart';
import 'widgets/widget_note_order.dart';
import 'widgets/widget_time_order.dart';

class OrderScreen extends StatefulWidget {
  static const String routeName = '/order';
  static final route = GetPage(name: routeName, page: () => OrderScreen());

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final controller = Get.put(OrderController());
  final cartController = Get.find<CartController>();
  final Set<Marker> _markers = {};
  Position location;

  GoogleMapController mapController;
  @override
  void initState() {
    super.initState();
    controller.determinePosition().then((value) {
      setState(() {
        location = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    controller.getInfo();
    return Scaffold(
      backgroundColor: AppColors.kMaincolor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Stack(
            children: [
              Container(
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
                            Text('Đặt hàng', style: AppStyles.kTitleBack)
                          ],
                        ),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                color: Colors.redAccent,
                                width: Get.width,
                                height: Get.height / 4,
                                child: location != null
                                    ? GoogleMap(
                                        markers: _markers,
                                        onMapCreated:
                                            (GoogleMapController controller) {
                                          mapController = controller;
                                        },
                                        initialCameraPosition: CameraPosition(
                                            target: LatLng(
                                              location.latitude,
                                              location.longitude,
                                            ),
                                            zoom: 15),
                                      )
                                    : SizedBox()),
                            SizedBox(height: 12),
                            WidgetCustomerOrder(),
                            SizedBox(height: 12),
                            WidgetAddressOrder(),
                            WidgetTimeOrder(),
                            WidgetItemOrder(),
                            WidgetAddCodeOrder(),
                            WidgetNoteOrder(),
                            Container(
                              margin: EdgeInsets.only(top: 12),
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: TextButton(
                                onPressed: () {
                                  if (cartController.listItem.length > 0 &&
                                      !controller.isLoadding.value) {
                                    controller.orderProduct();
                                  } else {
                                    Helper.showDialog('Thông báo',
                                        'Giỏ hàng của bạn không có sản phẩm, vui lòng thêm ít nhất một sản phẩm.',
                                        onBack: () {
                                      Get.back();
                                    });
                                  }
                                },
                                child: Center(
                                  child: Container(
                                    width: Get.width - 80,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        color: AppColors.kMaincolor,
                                        borderRadius:
                                            BorderRadius.circular(44)),
                                    child: Center(
                                        child: Text(
                                      'Đặt hàng',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                    ],
                  )),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Obx(
                  () => controller.isLoadding.value
                      ? Container(
                          color: Colors.black12,
                          child: Center(child: CircularProgressIndicator()))
                      : SizedBox(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
