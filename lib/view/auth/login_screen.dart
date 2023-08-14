import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/login_controller.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/widget/button.dart';
import 'package:gsgr/widget/card_form.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widget/input_field.dart';

class LoginSreen extends StatelessWidget {
  static const routeName = '/login';
  static final route = GetPage(name: routeName, page: () => LoginSreen());

  final ctl = Get.put(LoginController());
  final textfieldController = TextEditingController();

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          body: ctl.isloading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(alignment: Alignment.center, children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: Get.height / 2,
                      child: Image.asset(
                        'assets/images/banner_login_1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: Get.height / 4,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 32),
                                      Text('Chào mừng bạn đến với',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                  fontSize: 16,
                                                  color: Colors.white)),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Giặt Sấy Giá Rẻ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            ?.copyWith(
                                                fontSize: 40,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                shadows: [
                                              Shadow(
                                                  color: Colors.black,
                                                  offset: Offset(0, 3),
                                                  blurRadius: 8)
                                            ]),
                                      ),
                                    ])
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          SingleChildScrollView(
                            child: CardForm.button(
                              children: [
                                InputField(
                                  // label: 'Nhập số điện thoại ',
                                  child: Container(
                                    margin: EdgeInsets.only(top: 12),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black12, width: 1),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Icon(
                                            Icons.star,
                                            size: 8,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Text('+84'),
                                        SizedBox(width: 12),
                                        Container(
                                            width: 1, color: Colors.black),
                                        SizedBox(width: 12),
                                        Expanded(
                                          child: TextFormField(
                                            controller: textfieldController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: 'Nhập số điện thoại ',
                                              border: InputBorder.none,
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                              ],
                              button: CustomButton(
                                  color: AppColors.kMaincolor,
                                  onPressed: () =>
                                      ctl.login(textfieldController.text),
                                  label: Text(
                                    'Đăng nhập',
                                    style: TextStyle(fontSize: 16),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          bottomNavigationBar:
              Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    launch("tel://0905576921");
                  },
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                        color: AppColors.kMaincolor,
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                InkWell(
                  onTap: () {
                    ctl.launchFacebook();
                  },
                  child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                          color: AppColors.kMaincolor,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Text(
                        'f',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ))),
                )
              ],
            ),
            SizedBox(height: 12),
            Text(
              'Chính sách và điều khoản',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            TextButton(
              child: Text('Copyright Kcod Team'),
              onPressed: () {
                // Get.toNamed(RegisterScreen.routeName)
              },
              style: TextButton.styleFrom(
                primary: Theme.of(context).textTheme.bodyText1?.color,
                minimumSize: Size(88, 26),
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const SizedBox(height: 34),
          ]),
        ),
      ));
}
