import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/user_controller.dart';
import 'package:gsgr/controller/work_controller.dart';
import 'package:gsgr/helper/dialog.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/models/cusomer_model.dart';
import 'package:gsgr/models/history_order_model.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/value/constants.dart';
import 'package:gsgr/widget/top_nav.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailOrderScreen extends StatelessWidget {
  static const String routeName = '/detail_order';
  static final route =
      GetPage(name: routeName, page: () => DetailOrderScreen());
  final Order item;

  final controller = Get.put(UserController());

  DetailOrderScreen({this.item});

  final TextEditingController _editingController = TextEditingController();
  final ordercontroller = Get.find<WorkController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMaincolor,
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Row(
                children: [
                  Expanded(child: WidgetTopNav(title: 'Đơn hàng ')),
                ],
              ),
              Expanded(
                child: Container(
                  color: AppColors.kMainBackground,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text(
                                            'ID đơn hàng',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 12),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 8),
                                              decoration: BoxDecoration(
                                                  color: AppColors.kMaincolor,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color:
                                                          AppColors.kMaincolor),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black26,
                                                        offset: Offset(0, 3),
                                                        blurRadius: 6)
                                                  ]),
                                              child: Text(
                                                item.id.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22),
                                              ))
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text(
                                            'ID Khách hàng',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 12),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 8),
                                            decoration: BoxDecoration(
                                                color: Colors.blue[400],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: Colors.blue[400]),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black26,
                                                      offset: Offset(0, 3),
                                                      blurRadius: 6)
                                                ]),
                                            child: Text(
                                              '${item?.customerId ?? ''}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              //-----
                              SizedBox(height: 12),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Tên khách hàng: ',
                                          style: TextStyle(fontSize: 14),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          '${controller.getCustomeByID(item.customerId).name ?? '_'}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Số điện thoại: ',
                                          style: TextStyle(fontSize: 14),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: InkWell(
                                          onTap: () {
                                            if (controller
                                                    .getCustomeByID(
                                                        item.customerId)
                                                    .tel !=
                                                null) {
                                              launch(
                                                  "tel://${controller.getCustomeByID(item.customerId).tel}");
                                            }
                                          },
                                          child: Text(
                                            '${controller.getCustomeByID(item.customerId).tel ?? '_'}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueAccent,
                                                fontSize: 16),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(height: 12),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              'Địa chỉ gởi: ',
                                              style: TextStyle(fontSize: 14),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                              '${item.addressFrom}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ))
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              'Ghi chú gởi: ',
                                              style: TextStyle(fontSize: 14),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                              '${item.noteFrom ?? ''}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 12),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              'Địa chỉ nhận: ',
                                              style: TextStyle(fontSize: 14),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                              '${item.addressTo}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ))
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              'Ghi chú nhận: ',
                                              style: TextStyle(fontSize: 14),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                              '${item.noteTo ?? ''}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12),

                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              'Thời gian gởi: ',
                                              style: TextStyle(fontSize: 14),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                              '${item.orderStart}     ${Helper.convertRangeTime(item.rangeTimeStart)}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ))
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              'Thời gian nhận: ',
                                              style: TextStyle(fontSize: 14),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                              '${item.orderEnd}     ${Helper.convertRangeTime(item.rangeTimeEnd)}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Tình trạng đơn hàng : ',
                                            style: TextStyle(fontSize: 14),
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            '${Helper.convertStatusOrder(item.status)}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Mã giảm giá  : ',
                                            style: TextStyle(fontSize: 14),
                                          )),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          item.couponName == null ||
                                                  item.couponName == ''
                                              ? 'không có mã giảm giá cho đơn hàng này'
                                              : Helper.convertCouponValue(
                                                  type: item.couponType,
                                                  value: item.couponValue),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Nhận xét : ',
                                            style: TextStyle(fontSize: 14),
                                          )),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          item.remark ?? '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // SizedBox(height: 12),
                              // Container(
                              //   padding: EdgeInsets.symmetric(
                              //       horizontal: 12, vertical: 4),
                              //   decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     borderRadius: BorderRadius.circular(12),
                              //   ),
                              //   child: InkWell(
                              //     onTap: () {},
                              //     child: Row(
                              //       children: [
                              //         Expanded(
                              //             flex: 1,
                              //             child: Text(
                              //               'Nhận xét của cửa hàng',
                              //               style: TextStyle(fontSize: 14),
                              //             )),
                              //         Expanded(
                              //           flex: 2,
                              //           child: Text(
                              //             item.noteStore ?? '',
                              //             style: TextStyle(
                              //                 fontWeight: FontWeight.bold,
                              //                 fontSize: 16),
                              //           ),
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 12),
                              // Container(
                              //   padding: EdgeInsets.symmetric(
                              //       horizontal: 12, vertical: 4),
                              //   decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     borderRadius: BorderRadius.circular(12),
                              //   ),
                              //   child: InkWell(
                              //     onTap: () {},
                              //     child: Row(
                              //       children: [
                              //         Expanded(
                              //             flex: 1,
                              //             child: Text(
                              //               'Nhận xét của shipper',
                              //               style: TextStyle(fontSize: 14),
                              //             )),
                              //         Expanded(
                              //           flex: 2,
                              //           child: Text(
                              //             item.noteShip ?? '',
                              //             style: TextStyle(
                              //                 fontWeight: FontWeight.bold,
                              //                 fontSize: 16),
                              //           ),
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // ),

                              SizedBox(height: 12),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Tổng tiền: ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        '${Helper.convertPrice(item.totalPrice.toString())}đ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: AppColors.kMaincolor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Nhân viên:',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          '${controller.nameStaff}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white),
                                        )),
                                    InkWell(
                                      onTap: () {
                                        Get.bottomSheet(
                                          BottomSheetStaff(
                                            idOrder: item.id.toString(),
                                            orderStatus: item.status,
                                            storeAddress: item.storeAddress,
                                            currentShiper: item.shipId,
                                            onAccept: () async {
                                              Future.delayed(
                                                  Duration(milliseconds: 200),
                                                  () async {
                                                final workController =
                                                    Get.find<WorkController>();
                                                await workController
                                                    .getDataOrder()
                                                    .then((value) {
                                                  Get.back();
                                                  Get.back();
                                                });
                                              });
                                            },
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        Icons.person_search_sharp,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(item.products.length,
                                      (index) {
                                    _editingController.text =
                                        item.products[index].pivot.quantity;
                                    return InkWell(
                                      onTap: 1 == 1
                                          ? () {}
                                          : () {
                                              Get.bottomSheet(BottomSheetAddHow(
                                                  index: index,
                                                  item: item,
                                                  editingController:
                                                      _editingController));
                                            },
                                      child: Container(
                                        height: 200,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 12),
                                        decoration: BoxDecoration(
                                            color: AppColors.kMaincolor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black38,
                                                  offset: Offset(0, 3),
                                                  blurRadius: 8)
                                            ]),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors.white24,
                                                          width: 0))),
                                              child: Image.network(
                                                item.products[index].image,
                                                width: 200,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 6),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      item.products[index].name,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                            Icons
                                                                .monetization_on_outlined,
                                                            color:
                                                                Colors.white),
                                                        SizedBox(width: 4),
                                                        Text(
                                                          '${Helper.convertPrice(item.products[index].price.toString())}đ',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.playlist_add,
                                                          color: Colors.white,
                                                        ),
                                                        SizedBox(width: 4),
                                                        Text(
                                                          '${item.products[index].pivot.quantity.replaceFirst('.00', '')}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetStaff extends StatelessWidget {
  BottomSheetStaff(
      {@required this.idOrder,
      this.orderStatus,
      this.storeAddress,
      this.onAccept,
      this.currentShiper});

  final controller = Get.find<UserController>();
  final String idOrder;
  final int orderStatus;
  final String storeAddress;
  final int currentShiper;
  final Function onAccept;

  @override
  Widget build(BuildContext context) {
    controller.idShiper.value = currentShiper;
    controller.nameShiper.value = controller.getNameShiper(currentShiper);
    return Container(
      height: 450,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 12),
          Container(
            width: Get.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.kMaincolor, width: 1),
              ),
            ),
            child: Text(
              'Phân việc cho nhân viên',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                      height: 36,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Chọn nhanh dịch vụ grab',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () => {
                      controller.idShiper.value = Constants.grab['id'],
                      controller.nameShiper.value = Constants.grab['name']
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Text(
                      'Chọn Shiper',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {
                      Get.bottomSheet(
                        Obx(
                          () => Container(
                            color: Colors.white,
                            height: 400,
                            width: Get.width,
                            child: Column(
                              children: [
                                Container(
                                  height: 64,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 34, right: 12),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              'Nhân viên Shipper',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Icon(
                                            Icons.close,
                                            size: 22,
                                            color: Colors.black87,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: List.generate(
                                        controller.listShiper.length, (index) {
                                      Customer item =
                                          controller.listShiper[index];

                                      return Container(
                                          child: InkWell(
                                        onTap: () {
                                          controller.idShiper.value = item.id;
                                          controller.nameShiper.value =
                                              item.name;
                                          Get.back();
                                        },
                                        child: Container(
                                          height: 46,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black12,
                                                  width: 1),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(width: 12),
                                              Expanded(
                                                  child: Text(
                                                item.name,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                              Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                // color: AppColors.kListUserFormInputArrow,
                                                size: 22,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        'List shiper',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                  child: Center(
                      child: Text(
                'Shiper được chọn',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              )))
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Obx(() => Text(
                controller.nameShiper.value,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    decorationStyle: TextDecorationStyle.dotted,
                    fontStyle: FontStyle.normal),
              )),
          SizedBox(
            height: 12,
          ),
          Visibility(
            visible: orderStatus < STATUSORDER.STORE_NHAN_HANG.value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(
                        'Chọn Cửa hàng',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          Obx(
                            () => Container(
                              color: Colors.white,
                              height: 400,
                              width: Get.width,
                              child: Column(
                                children: [
                                  Container(
                                    height: 64,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 34, right: 12),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                'Cửa hàng giặt sấy',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Icon(
                                              Icons.close,
                                              size: 22,
                                              color: Colors.black87,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: List.generate(
                                          controller.listStaff.length, (index) {
                                        Customer staff =
                                            controller.listStaff[index];

                                        return Container(
                                            child: InkWell(
                                          onTap: () {
                                            controller.idStaff.value = staff.id;
                                            controller.storeAddress.value =
                                                staff.address;
                                            Get.back();
                                          },
                                          child: Container(
                                            height: 46,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.black12,
                                                    width: 1),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(width: 12),
                                                Expanded(
                                                    child: Text(
                                                  staff.address ?? '',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  // color: AppColors.kListUserFormInputArrow,
                                                  size: 22,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          'Chọn cửa hàng',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    (orderStatus < STATUSORDER.STORE_NHAN_HANG.value
                        ? 'Cửa hàng được chọn'
                        : 'Nhận từ cửa hàng'),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          (orderStatus < STATUSORDER.STORE_NHAN_HANG.value)
              ? Obx(
                  () => Text(
                    (controller.storeAddress.value ?? ''),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        decorationStyle: TextDecorationStyle.dotted,
                        fontStyle: FontStyle.normal),
                  ),
                )
              : Text(
                  storeAddress,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      decorationStyle: TextDecorationStyle.dotted,
                      fontStyle: FontStyle.normal),
                ),
          SizedBox(
            height: 12,
          ),
          // Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Text(
                      'Huỷ',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )),
                  ),
                )),
                SizedBox(width: 12),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    if (orderStatus < STATUSORDER.STORE_NHAN_HANG.value) {
                      if (controller.idShiper.value == 0 ||
                          controller.idStaff.value == 0) {
                        DialogHelper.dialogWarning(
                            title: null,
                            content:
                                'Xin mời chọn đầy đủ shiper và cửa hàng giặt sấy tương ứng !',
                            fnc: () {
                              Get.back();
                            });
                      } else {
                        controller
                            .transferOrder(
                                idOrder,
                                controller.idShiper.toString(),
                                controller.idStaff.toString())
                            .then((value) {
                          DialogHelper.dialogWarning(
                            content: 'Công việc đã được giao',
                            fnc: () async {
                              Get.back();
                              await onAccept();
                            },
                          );
                        });
                      }
                    } else {
                      if (controller.idShiper.value == 0) {
                        DialogHelper.dialogWarning(
                            title: null,
                            content: 'Xin mời chọn shipper',
                            fnc: () {
                              Get.back();
                            });
                      } else {
                        controller
                            .transferOrder(
                                idOrder, controller.idShiper.toString(), null)
                            .then((value) {
                          DialogHelper.dialogWarning(
                            content: 'Công việc đã được giao',
                            fnc: () async {
                              Get.back();
                              await onAccept();
                            },
                          );
                        });
                      }
                    }
                  },
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                        color: AppColors.kMaincolor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Text(
                      'Xác nhận',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )),
                  ),
                ))
              ],
            ),
          ),
          SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }
}

class BottomSheetAddHow extends StatelessWidget {
  final int index;
  final controller = Get.find<UserController>();
  BottomSheetAddHow({
    @required this.index,
    Key key,
    @required this.item,
    @required TextEditingController editingController,
  })  : _editingController = editingController,
        super(key: key);

  final Order item;
  final TextEditingController _editingController;

  @override
  Widget build(BuildContext context) {
    _editingController.text = item.products[index].pivot.quantity.toString();
    return Container(
      height: 400,
      padding: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 12),
          Container(
            width: Get.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: AppColors.kMaincolor, width: 1))),
            child: Text(
              '${item.products[index].name}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    'Đơn giá',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    '${Helper.convertPrice(item.products[index].price.toString())}đ/${Helper.convertTypeProducts(item.products[index].unit)}',
                    style: TextStyle(fontSize: 16),
                  )),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text('Số lượng',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500))),
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12),
                    child: Center(
                        child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                      controller: _editingController,
                      decoration: InputDecoration(border: InputBorder.none),
                    )),
                  )),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          // Row(
          //   children: [
          //     Expanded(
          //         flex: 1,
          //         child: Text(
          //           'Tổng tiền sản phẩm ',
          //           style: TextStyle(
          //               color: Colors.black,
          //               fontSize: 16,
          //               fontWeight: FontWeight.w500),
          //         )),
          //     Expanded(
          //       flex: 2,
          //       child: Text(
          //         '${Helper.convertPrice((item.products[index].price * double.parse(item.products[index].pivot.quantity)).round().toString())}đ',
          //         style: TextStyle(fontSize: 16),
          //       ),
          //     )
          //   ],
          // ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Text(
                      'Huỷ',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )),
                  ),
                )),
                SizedBox(width: 12),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Get.back();
                    item.products[index].pivot.quantity =
                        _editingController.text;
                  },
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                        color: AppColors.kMaincolor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Text(
                      'Xác nhận',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )),
                  ),
                ))
              ],
            ),
          ),
          SizedBox(
            height: 52,
          )
        ],
      ),
    );
  }
}
