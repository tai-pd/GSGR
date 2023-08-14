import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/contact_controller.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/widget/top_nav.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  static const String routeName = '/contact';
  static final route = GetPage(name: routeName, page: () => ContactScreen());

  final controller = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMaincolor,
      body: SafeArea(
        child: Container(
          color: AppColors.kMainBackground,
          child: Column(children: [
            WidgetTopNav(
              title: 'Liên hệ',
            ),
            SizedBox(height: 12),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      launch("tel://0905576921");
                    },
                    child: WidgetItemContact(
                      title: 'Tổng đài',
                      content: '0905576921',
                      icon: Icon(
                        Icons.phone_in_talk,
                        color: AppColors.kMaincolor,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: 1,
                      color: Colors.black12),
                  InkWell(
                    onTap: () {
                      controller.sendMail('');
                    },
                    child: WidgetItemContact(
                      title: 'Email',
                      content: 'giatsaygiare@gmail.com',
                      icon: Icon(
                        Icons.email,
                        color: AppColors.kMaincolor,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: 1,
                      color: Colors.black12),
                  InkWell(
                    onTap: () {
                      controller.launchURL();
                    },
                    child: WidgetItemContact(
                      title: 'Website',
                      content: 'giatsaygiare.vn',
                      icon: Icon(
                        Icons.language_sharp,
                        color: AppColors.kMaincolor,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: 1,
                      color: Colors.black12),
                  InkWell(
                    onTap: () {
                      controller.launchFacebook();
                    },
                    child: WidgetItemContact(
                      title: 'Facebook',
                      content: 'facebook.com/gsgr',
                      icon: Icon(
                        Icons.thumb_up_alt_outlined,
                        color: AppColors.kMaincolor,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: 1,
                      color: Colors.black12),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class WidgetItemContact extends StatelessWidget {
  final String title;
  final String content;
  final Icon icon;
  const WidgetItemContact({
    this.title,
    this.content,
    this.icon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$title ', style: TextStyle(fontSize: 16)),
              SizedBox(height: 4),
              Text('$content', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 12,
          color: AppColors.kMaincolor,
        )
      ],
    );
  }
}
