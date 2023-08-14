import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/category_controller.dart';
import 'package:gsgr/controller/task_controller.dart';
import 'package:gsgr/controller/user_controller.dart';
import 'package:gsgr/helper/dialog.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/models/category_model.dart';
import 'package:gsgr/responses/task_order_response.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/value/constants.dart';
import 'package:gsgr/view/setting/page/work/task_screen.dart';
import 'package:gsgr/widget/top_nav.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:badges/badges.dart';

class TaskDetail extends StatefulWidget {
  static const String routeName = '/task_detail';
  static final route = GetPage(name: routeName, page: () => TaskDetail());
  final Order item;

  TaskDetail({this.item});

  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  final controller = Get.put(UserController());
  TextEditingController noteMemberEdit = TextEditingController();

  final taskController = Get.put(TaskController());
  final categoryController = Get.put(CategoryControllor());

  @override
  void initState() {
    super.initState();
    taskController.getDetailOrderByID(widget.item.id.toString());
    taskController.totalPrice.value = widget.item.totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMaincolor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
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
                                                    horizontal: 12,
                                                    vertical: 8),
                                                decoration: BoxDecoration(
                                                    color: AppColors.kMaincolor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .kMaincolor),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black26,
                                                          offset: Offset(0, 3),
                                                          blurRadius: 6)
                                                    ]),
                                                child: Text(
                                                  widget.item.id.toString(),
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
                                                widget.item.customerId
                                                    .toString(),
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
                                            '${controller.getCustomeByID(widget.item.customerId)?.name ?? ''}',
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
                                              launch(
                                                  "tel://${controller.getCustomeByID(widget.item.customerId).tel}");
                                            },
                                            child: Text(
                                              '${controller.getCustomeByID(widget.item.customerId)?.tel ?? ''}',
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
                                      horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Địa chỉ cửa hàng: ',
                                            style: TextStyle(fontSize: 14),
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            '${widget.item.storeAddress ?? ''}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
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
                                                '${widget.item.addressFrom}',
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
                                                '${widget.item.noteFrom ?? ''}',
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
                                                '${widget.item.addressTo}',
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
                                                '${widget.item.noteTo ?? ''}',
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
                                                '${widget.item.orderStart}     ${Helper.convertRangeTime(widget.item.rangeTimeStart)}',
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
                                                '${widget.item.orderEnd}     ${Helper.convertRangeTime(widget.item.rangeTimeEnd)}',
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
                                              '${Helper.convertStatusOrder(widget.item.status)}',
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
                                              'Mã giảm giá: ',
                                              style: TextStyle(fontSize: 14),
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            widget.item.couponName == null ||
                                                    widget.item.couponName == ''
                                                ? 'không có mã giảm giá cho đơn hàng này'
                                                // : Helper.convertCouponValue(
                                                //     type: item.couponType,
                                                //     value: item.couponValue)
                                                : widget.item.couponName,
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
                                              'Ghi chú: ',
                                              style: TextStyle(fontSize: 14),
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            widget.item.remark ?? '',
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
                                              'Ghi chú của cửa hàng',
                                              style: TextStyle(fontSize: 14),
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            widget.item.noteStore ?? '',
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
                                              'Ghi chú của shipper',
                                              style: TextStyle(fontSize: 14),
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            widget.item.noteShip ?? '',
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
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Card(
                                    color: Colors.grey[100],
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: TextField(
                                        controller: noteMemberEdit,
                                        maxLines: 4,
                                        decoration: InputDecoration.collapsed(
                                            hintText:
                                                'Ghi chú của store/shiper'),
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 12,
                                ),
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
                                        child: Obx(
                                          () => Text(
                                            '${Helper.convertPrice(taskController.totalPrice.value.toString())}đ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 12,
                                ),
                                Visibility(
                                  visible: ((widget.item.status ==
                                              STATUSORDER
                                                  .SHIPER_NHAN_HANG.value &&
                                          controller.roleId == 2) ||
                                      (widget.item.status ==
                                              STATUSORDER
                                                  .STORE_NHAN_HANG.value &&
                                          controller.roleId == 3) ||
                                      (widget.item.status ==
                                              STATUSORDER
                                                  .SHIPER_TRA_HANG.value &&
                                          controller.roleId == 2)),
                                  child: InkWell(
                                    child: Container(
                                      // width: Get.width / 2,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: AppColors.kMaincolor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: FittedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(4),
                                              child: Text(
                                                'Chỉnh sửa sản phẩm',
                                                style: TextStyle(
                                                    color: AppColors
                                                        .kMainBackground),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 4),
                                              child: Icon(
                                                Icons.add,
                                                color:
                                                    AppColors.kMainBackground,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () => {
                                      Get.bottomSheet(
                                        ModifyProduct(
                                            taskController: taskController,
                                            categoryController:
                                                categoryController,
                                            widget: widget),
                                      ),
                                    },
                                  ),
                                ),

                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(
                                        taskController.listProduct.length,
                                        (index) {
                                      return InkWell(
                                        onTap: controller.roleId != 3
                                            ? () {}
                                            : () {
                                                taskController.getMapProducts(
                                                    order: widget.item);
                                                if (widget.item.status ==
                                                    STATUSORDER.STORE_NHAN_HANG
                                                        .value) {
                                                  Get.bottomSheet(
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        16),
                                                                topRight: Radius
                                                                    .circular(
                                                                        16)),
                                                            color: AppColors
                                                                .kMainBackground,
                                                          ),
                                                          height: 400,
                                                          width: Get.width,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8.0,
                                                                    right: 8.0),
                                                            child: SliderImage(
                                                              item: widget.item,
                                                              controller:
                                                                  taskController,
                                                            ),
                                                          ),
                                                        ),
                                                        Obx(
                                                          () => taskController
                                                                  .isLoaddingDialog
                                                                  .value
                                                              ? Positioned(
                                                                  top: 0,
                                                                  bottom: 0,
                                                                  left: 0,
                                                                  right: 0,
                                                                  child:
                                                                      Container(
                                                                    color: Colors
                                                                            .grey[
                                                                        200],
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          CircularProgressIndicator(),
                                                                    ),
                                                                  ))
                                                              : SizedBox(),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }
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
                                                            color:
                                                                Colors.white24,
                                                            width: 0))),
                                                child: Image.network(
                                                  taskController
                                                      .listProduct[index].image,
                                                  width: 200,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Obx(
                                                () => Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 6),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          taskController
                                                              .listProduct[
                                                                  index]
                                                              .name,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .monetization_on_outlined,
                                                                color: Colors
                                                                    .white),
                                                            SizedBox(width: 4),
                                                            Text(
                                                              '${Helper.convertPrice(taskController.listProduct[index].price.toString())}đ',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .playlist_add,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            SizedBox(width: 4),
                                                            Text(
                                                              '${taskController.listProduct[index].pivot.quantity.replaceFirst('.00', '')}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                                Visibility(
                                  visible: ((widget.item.status ==
                                              STATUSORDER.MOI.value &&
                                          controller.roleId == 2) ||
                                      (widget.item.status ==
                                              STATUSORDER
                                                  .STORE_GIAO_HANG.value &&
                                          controller.roleId == 2) ||
                                      (widget.item.status ==
                                              STATUSORDER
                                                  .SHIPER_GIAO_HANG.value &&
                                          controller.roleId == 3)),
                                  child: RecieveOrder(
                                    controller: taskController,
                                    item: widget.item,
                                  ),
                                ),
                                Visibility(
                                  visible: ((widget.item.status ==
                                              STATUSORDER
                                                  .SHIPER_NHAN_HANG.value &&
                                          controller.roleId == 2) ||
                                      (widget.item.status ==
                                              STATUSORDER
                                                  .STORE_NHAN_HANG.value &&
                                          controller.roleId == 3) ||
                                      (widget.item.status ==
                                              STATUSORDER
                                                  .SHIPER_TRA_HANG.value &&
                                          controller.roleId == 2)),
                                  child: DoneOrder(
                                    controller: taskController,
                                    item: widget.item,
                                    edittext: noteMemberEdit,
                                    closeScreen: () {
                                      Get.back();
                                    },
                                  ),
                                ),
                                SizedBox(height: 22)
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
      ),
    );
  }
}

class ModifyProduct extends StatelessWidget {
  const ModifyProduct({
    @required this.taskController,
    @required this.categoryController,
    @required this.widget,
  });

  final TaskController taskController;
  final CategoryControllor categoryController;
  final TaskDetail widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.kMainBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'Danh sách sản phẩm',
              style: TextStyle(
                  color: AppColors.kMaincolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Badge(
            badgeContent: Obx(
              () => Text(
                taskController.listProduct.length.toString(),
              ),
            ),
            badgeColor: AppColors.kMaincolor,
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.blueGrey[200],
            ),
          ),
          Column(
            children: List.generate(
              categoryController.categoryOrder.length,
              (index) {
                Categorys category = categoryController.categoryOrder[index];
                return Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        category.products.length,
                        (i) {
                          var item = category.products[i];
                          return Stack(
                            children: [
                              Container(
                                width: Get.width - 16,
                                height: 98,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: item.image == null
                                    ? BoxDecoration()
                                    : BoxDecoration(
                                        color: Colors.redAccent.withOpacity(.5),
                                        image: DecorationImage(
                                          image: NetworkImage(item.image),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                              ),
                              Obx(
                                () => taskController.listProduct.indexWhere(
                                            (element) =>
                                                element.id == item.id) !=
                                        -1
                                    ? Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          width: Get.width - 16,
                                          height: 98,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey[50]
                                                .withOpacity(0.65),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ),
                              Positioned(
                                top: 52,
                                left: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.kMainBackground,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, top: 8, right: 8, bottom: 8),
                                    child: Text(
                                        '${Helper.convertPrice(item.price.toString())} / ${Helper.convertTypeProducts(item.unit)}'),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 4,
                                left: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.blueGrey[200].withOpacity(0.85),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, top: 8, right: 8, bottom: 8),
                                    child: Text(item.name),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 32,
                                right: 32,
                                child: Obx(
                                  () => taskController.listProduct.indexWhere(
                                              (element) =>
                                                  element.id == item.id) ==
                                          -1
                                      ? InkWell(
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: AppColors.kMaincolor,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(25),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: AppColors.kMainBackground,
                                            ),
                                          ),
                                          onTap: () {
                                            taskController
                                                .ModifyProductToListOrder(
                                                    widget.item.id,
                                                    item,
                                                    'add');
                                          },
                                        )
                                      : InkWell(
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.red[300],
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(25),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.remove,
                                              color: AppColors.kMainBackground,
                                            ),
                                          ),
                                          onTap: () {
                                            if (taskController
                                                    .listProduct.length >
                                                1) {
                                              taskController
                                                  .ModifyProductToListOrder(
                                                      widget.item.id,
                                                      item,
                                                      'remove');
                                            } else {
                                              DialogHelper.dialogWarning(
                                                  content:
                                                      'Đơn hàng phải có ít nhất một sản phẩm',
                                                  fnc: () {
                                                    Get.back();
                                                  });
                                            }
                                          },
                                        ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SliderImage extends StatelessWidget {
  const SliderImage({Key key, @required this.item, this.controller})
      : super(key: key);

  final TaskController controller;
  final Order item;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 12),
          Row(
            children: [
              Text(
                'Đơn giá :',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              VerticalDivider(
                width: 75,
              ),
              Expanded(
                child: Obx(
                  () => Text(
                    '${controller.totalPrice.value == 0 ? (item.totalPrice == null ? 0.toString() : Helper.convertPrice(item.totalPrice.toString())) : Helper.convertPrice(controller.totalPrice.value.toString())} vnđ',
                    style: TextStyle(
                      color: AppColors.kMaincolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Obx(
              () => CarouselSlider(
                items: controller.listProduct.map((i) {
                  TextEditingController editController =
                      TextEditingController();
                  editController.text = i.pivot.quantity.toString();
                  return Builder(
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Divider(
                              height: 12,
                            ),
                            Container(
                                height: 160,
                                width: Get.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(i.image),
                                        fit: BoxFit.cover))),
                            Divider(
                              height: 24,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 48,
                                          child: Row(
                                            children: [
                                              Text('Số lượng: '),
                                              Text(
                                                '${i.pivot.quantity}',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text('/Kg')
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 8,
                                        ),
                                        Text('Giá sản phẩm'),
                                      ],
                                    ),
                                    VerticalDivider(
                                      width: 16,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height: 48,
                                            child: Center(child: Text('|'))),
                                        Divider(
                                          height: 8,
                                        ),
                                        Text(':'),
                                      ],
                                    ),
                                    VerticalDivider(
                                      width: 16,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4),
                                          height: 48,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.kMaincolor)),
                                          width: 120,
                                          child: TextField(
                                            style: TextStyle(fontSize: 16),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Số lượng mới',
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.kMaincolor,
                                                ),
                                              ),
                                            ),
                                            cursorColor: AppColors.kMaincolor,
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    decimal: true),
                                            onChanged: (text) {
                                              controller.item[i.id.toString()] =
                                                  text.replaceAll(',', '.');
                                            },
                                          ),
                                        ),
                                        Divider(
                                          height: 8,
                                        ),
                                        Text(
                                            ' ${Helper.convertPrice(i.price.toString())} vnd')
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                ),
              ),
            ),
          ),
          Divider(
            height: 8,
            color: AppColors.kMaincolor,
          ),
          SizedBox(height: 4),
          Visibility(
            visible: controller.roleId == 3 ? true : false,
            child: GestureDetector(
              onTap: () {
                controller.updateOrderPrice(
                    orderId: item.id.toString(), item: controller.item);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppColors.kMaincolor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Text(
                    'Cập nhật',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}

class RecieveOrder extends StatelessWidget {
  const RecieveOrder({
    this.controller,
    this.item,
    Key key,
  }) : super(key: key);

  final TaskController controller;
  final Order item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        int roleId = await controller.sessionManager
            .getInt(controller.sessionManager.roleId);
        if (roleId == 2) // shiper
        {
          var status = item.status < STATUSORDER.SHIPER_NHAN_HANG.value
              ? STATUSORDER.SHIPER_NHAN_HANG.value
              : STATUSORDER.SHIPER_TRA_HANG.value;
          controller.recieveTask(orderId: item.id, status: status);
        } else // store
        {
          var status = STATUSORDER.STORE_NHAN_HANG.value;
          controller.recieveTask(orderId: item.id, status: status);
        }
        Get.offNamed(TaskScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green[600]),
            borderRadius: BorderRadius.circular(16),
            color: AppColors.kMaincolor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            'Nhận hàng',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class DoneOrder extends StatelessWidget {
  const DoneOrder(
      {Key key,
      @required this.controller,
      @required this.item,
      this.edittext,
      this.closeScreen})
      : super(key: key);

  final TaskController controller;
  final Order item;
  final Function closeScreen;
  final TextEditingController edittext;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        int roleId = await controller.sessionManager
            .getInt(controller.sessionManager.roleId);
        DialogHelper.dialogWidthContentTitle(
          title: '',
          content: roleId == 3
              ? 'Đơn hàng hàng đã được cập nhật số lượng rồi chứ ?'
              : 'Công việc này đã hoàn thành rồi chứ ?',
          fnc: () async {
            int status = 0;
            if (roleId == 2) //shiper
            {
              if (item.status == STATUSORDER.SHIPER_NHAN_HANG.value) {
                status = STATUSORDER.SHIPER_GIAO_HANG.value;
              } else if (item.status == STATUSORDER.SHIPER_TRA_HANG.value) {
                status = STATUSORDER.HOAN_THANH.value;
              }
            } else {
              status = STATUSORDER.STORE_GIAO_HANG.value;
            }
            controller.doneTask(
                orderId: item.id,
                status: status,
                roleId: roleId,
                noteShip: roleId == 2 ? edittext.text : '',
                noteStore: roleId == 3 ? edittext.text : '');
            closeScreen();
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green[600]),
            borderRadius: BorderRadius.circular(16),
            color: AppColors.kMaincolor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            'Hoàn thành',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
