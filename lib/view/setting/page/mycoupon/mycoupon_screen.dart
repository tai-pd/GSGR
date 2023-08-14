import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/mycoupon_controller.dart';
import 'package:gsgr/models/point_friend_model.dart';
import 'package:gsgr/value/colors.dart';

class MycouponScreen extends StatefulWidget {
  static const String routeName = '/mycoupon';
  static final route = GetPage(name: routeName, page: () => MycouponScreen());

  @override
  _MycouponState createState() => _MycouponState();
}

class _MycouponState extends State<MycouponScreen> {
  final controller = Get.put(MycouponController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMaincolor,
      body: SafeArea(
        top: true,
        child: Container(
          color: AppColors.kMainBackground,
          child: Column(
            children: [
              Container(
                color: AppColors.kMaincolor,
                child: Row(
                  children: [
                    BackButton(
                      color: Colors.white,
                    ),
                    Text(
                      'Mời bạn bè',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'TĂNG THÊM THU THẬP ĐIỂM THỤ ĐỘNG',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 22),
                        Image.asset(
                          'assets/images/step_11.png',
                          width: 64,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Bước 1',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Text(
                            'Đăng kí tài khoản trên app Giặt Sấy Giá Rẻ bằng số điện thoại của bạn.'),
                        const SizedBox(
                          height: 12,
                        ),
                        Image.asset(
                          'assets/images/step_22.png',
                          width: 64,
                        ),
                        const SizedBox(height: 22),
                        Text(
                          'Bước 2',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Text(
                            'Giới thiệu bạn bè tải app Giặt Sấy Giá Rẻ, đăng kí tài khoản và nhập Mã Giới Thiệu bước đăng kí là Số Điện Thoại của bạn ở bước 1.'),
                        const SizedBox(height: 22),
                        Image.asset(
                          'assets/images/step_33.png',
                          width: 64,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Khi giới thiệu thành công',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Text(
                            'Bạn sẽ nhận được 20% điểm thưởng của điểm tích luỹ mỗi đơn hàng khi bạn bè mình vừa hoàn thành.'),
                        const SizedBox(height: 12),
                        Obx(() => Container(
                            margin: EdgeInsets.only(top: 12),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(0, 3),
                                      blurRadius: 4)
                                ],
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              children: [
                                Text(
                                  'Điểm của bạn: ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${controller.mainPoint.value}',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ))),
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(0, 3),
                                    blurRadius: 4)
                              ],
                              borderRadius: BorderRadius.circular(6)),
                          child: ExpandableNotifier(
                              // initialExpanded: true,
                              child: Column(
                            children: [
                              ScrollOnExpand(
                                // scrollOnExpand: true,
                                // scrollOnCollapse: false,
                                child: ExpandablePanel(
                                  header: Text(
                                    'Danh sách bạn bè',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  collapsed: Obx(
                                      () => controller.listFriends.length > 0
                                          ? ListFriendAndPoint()
                                          : Center(
                                              child: Text('Danh sách trống'),
                                            )),
                                ),
                              ),
                            ],
                          )),
                        ),
                        const SizedBox(
                          height: 32,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // ExpandableNotifier(
              //   child: Column(
              //     children: [
              //       ScrollOnExpand(
              //           child: ExpandablePanel(
              //               header: Container(
              //                 decoration: BoxDecoration(
              //                     border: Border.all(
              //                         color: Colors.black12, width: 2)),
              //                 padding: EdgeInsets.symmetric(
              //                     horizontal: 12, vertical: 8),
              //                 child: Text(
              //                   'TĂNG THÊM THU THẬP ĐIỂM THỤ ĐỘNG CÁCH THỨC THAM GIA ',
              //                   style: TextStyle(
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.w500,
              //                   ),
              //                 ),
              //               ),
              //               collapsed: Column(
              //                 children: [

              //                 ],
              //               )))
              //     ],
              //   ),
              // ),

              //       Container(
              //         child: Row(
              //           children: [
              //             Expanded(
              //               flex: 1,
              //               child: Padding(
              //                 padding: const EdgeInsets.only(left: 8.0),
              //                 child: Text('Điểm của bạn: '),
              //               ),
              //             ),
              //             Expanded(
              //                 flex: 2,
              //                 child: Center(
              //                   child: Obx(
              //                     () => Text(
              //                       controller.mainPoint.value,
              //                       style: TextStyle(
              //                           fontSize: 24,
              //                           fontWeight: FontWeight.bold,
              //                           color: AppColors.kMaincolor),
              //                     ),
              //                   ),
              //                 )),
              //             Expanded(
              //               flex: 1,
              //               child: Container(),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Divider(
              //         height: 12,
              //       ),
              //       Container(
              //         alignment: Alignment.center,
              //         child: Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 8),
              //           child: HeaderButton(),
              //         ),
              //       ),
              //       Divider(
              //         height: 12,
              //       ),
              //       Expanded(
              //         child: Obx(
              //           () => controller.listFriends.length > 0
              //               ? ListFriendAndPoint()
              //               : Center(
              //                   child: Text('Chưa có thông tin'),
              //                 ),
              //         ),
              //       )
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderButton extends StatelessWidget {
  const HeaderButton({
    Key key,
  });

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<MycouponController>();
    return InkWell(
      child: Container(
        height: 36,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.kMaincolor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                'Sắp xếp',
                style: TextStyle(
                    color: AppColors.kMainBackground,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Obx(
                () => _controller.asc.value
                    ? Icon(
                        Icons.arrow_drop_down,
                        size: 28,
                      )
                    : Icon(
                        Icons.arrow_drop_up,
                        size: 28,
                      ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        _controller.sorting();
      },
    );
  }
}

class ListFriendAndPoint extends StatelessWidget {
  ListFriendAndPoint({
    Key key,
  });

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<MycouponController>();
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          children: List.generate(_controller.listFriends.length, (index) {
            var friend = _controller.listFriends[index] as Friends;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Container(
                width: Get.width,
                height: 68,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: Border.all(color: AppColors.kMaincolor),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 4,
                      left: 8,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: friend.children.image == null
                                ? DecorationImage(
                                    image: AssetImage(
                                        'assets/images/avatar_default.png'),
                                    fit: BoxFit.cover)
                                : DecorationImage(
                                    image: NetworkImage(friend.children.image),
                                    fit: BoxFit.cover)),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 48,
                      child: friend.children.name != null
                          ? Text(friend.children.name)
                          : Text(''),
                    ),
                    Positioned(
                      top: 44,
                      left: 8,
                      child: Text(
                        friend.children.tel,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 2),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 16,
                      child: Text(
                        friend.point.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Obx(
                      () => Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: _controller.isLoading.value
                            ? Container(
                                color: Colors.black12,
                                child:
                                    Center(child: CircularProgressIndicator()))
                            : SizedBox(),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
