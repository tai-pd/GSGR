import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/home_controller.dart';
import 'package:gsgr/controller/new_controller.dart';
import 'package:gsgr/service/notification_handler.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/view/bottomSheets/BottomSheetNews.dart';
import 'package:gsgr/view/home/home_screen.dart';
import 'package:gsgr/view/category/detail_screen.dart';
import 'package:gsgr/view/place/place_screen.dart';
import 'package:gsgr/view/qrcode/qrcode_view.dart';
import 'package:gsgr/view/setting/page/notification/notification_screen.dart';
import 'package:gsgr/view/setting/setting_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';
  static final route = GetPage(name: routeName, page: () => MainScreen());

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final homeCtl = Get.find<HomeController>();
  final newsCtl = Get.put(NewController());

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null) {
        await newsCtl.loadNews();
        if (message.data['is_news'] != null &&
            message.data['is_news'] == 'true') {
          Get.bottomSheet(
            BottomSheetNews(
              newsId: int.parse(message.data['news_id']),
            ),
            enableDrag: true,
            isScrollControlled: true,
          );
        }
      }
    });

    FirebaseMessaging.onMessage.listen((message) async {
      print(message.notification.title);
      print(message.notification.body);
      showNotificationWithDefaultSound(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print('A new onMessageOpenedApp event was published!');
      Get.to(MainScreen());
      await newsCtl.loadNews();
      if (message.data['is_news'] != null &&
          message.data['is_news'] == 'true') {
        Get.bottomSheet(
          BottomSheetNews(
            newsId: int.parse(message.data['news_id']),
          ),
          enableDrag: true,
          isScrollControlled: true,
        );
      }
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> showNotificationWithDefaultSound(RemoteMessage message) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'gsgr_channe_001', 'gsgr_channe_001', 'GSGR',
        importance: Importance.max, priority: Priority.high);

    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    NotificationHandler.flutterLocalNotificationPlugin.show(
      0,
      '${message?.notification?.title ?? ''}',
      '${message?.notification?.body ?? ''}',
      platformChannelSpecifics,
      payload: message?.data['news_id'] ?? null,
    );
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    print('Handling a background message ${message.messageId}');
    Get.to(MainScreen());
    newsCtl.loadNews();
    Get.bottomSheet(
      BottomSheetNews(
        newsId: 1,
      ),
      enableDrag: true,
    );
  }

  void _selectNotification(String id) async {
    await Firebase.initializeApp();
    Get.to(MainScreen());
    newsCtl.loadNews();
    Get.bottomSheet(
      BottomSheetNews(
        newsId: int.parse(id),
      ),
      enableDrag: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<CustomTab> tabs = <CustomTab>[
      CustomTab(
        text: 'Trang Chủ',
        icon: Icon(
          Icons.home_filled,
          color: AppColors.kMaincolor,
        ),
      ),
      CustomTab(
          text: 'Đặt hàng',
          icon: Icon(
            Icons.shopping_bag,
            color: AppColors.kMaincolor,
          )),
      CustomTab(
          text: 'Cửa Hàng',
          icon: Icon(
            Icons.location_city,
            color: AppColors.kMaincolor,
          )),
      CustomTab(
          text: 'Khác',
          icon: Icon(
            Icons.menu,
            color: AppColors.kMaincolor,
          )),
    ];

    List<Widget> bodyView = <Widget>[
      HomeScreen(),
      DetailScreen(),
      PlaceScreen(),
      SettingScreen(),
    ];
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.kMaincolor,
              title: Container(
                width: Get.width,
                child: Text('Giặt Sấy Giá Rẻ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              leadingWidth: 220,
              titleSpacing: 4,
              actions: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // ignore: unnecessary_statements
                        Get.to(() => QRCodeView());
                      },
                      child: Icon(
                        Icons.qr_code,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    InkWell(
                      onTap: () {
                        launch("tel://0905576921");
                      },
                      child: Icon(
                        Icons.call_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 12),
                    InkWell(
                      onTap: () {
                        Get.toNamed(NotificationScreen.routeName);
                      },
                      child: Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 12),
                  ],
                ),
              ],
            ),
            body: TabBarView(
              controller: homeCtl.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: bodyView,
            ),
            bottomNavigationBar: CustomTabBar(
              controller: homeCtl.tabController,
              tabs: tabs,
            )));
  }
}

class CustomTabBar extends StatefulWidget {
  final List<Widget> tabs;
  final TabController controller;
  final Function(int) onTap;

  final HomeController homeController = Get.put(HomeController());

  CustomTabBar({
    @required this.tabs,
    @required this.controller,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  void _handleTap(int index) {
    assert(index >= 0 && index < widget.tabs.length);
    widget.controller.animateTo(index);
    //   widget.onTap?.call(index);
    if (index == 0) {
      widget.homeController.reloadListCoupon();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> wrappedTabs =
        List.filled(widget.tabs.length, SizedBox());

    for (int index = 0; index < widget.tabs.length; index += 1) {
      wrappedTabs[index] = Expanded(
        child: InkWell(
          onTap: () => _handleTap(index),
          child: _TabStyle(
            selected: widget.controller.index == index,
            child: widget.tabs[index],
          ),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(44),
        color: AppColors.kMaincolor.withOpacity(.1),
        boxShadow: [
          const BoxShadow(
            color: Color.fromARGB(10, 0, 0, 0),
            blurRadius: 20,
            offset: Offset(0, -10),
          ),
          const BoxShadow(
            color: Color.fromARGB(10, 0, 0, 0),
            offset: Offset(0, 0.5),
          ),
        ],
      ),
      child: Row(children: wrappedTabs),
    );
  }
}

// ignore: must_be_immutable
class CustomTab extends StatelessWidget {
  final String text;
  final dynamic icon;
  final int badgeNumber;
  bool selected;

  CustomTab({
    Key key,
    this.text,
    this.icon,
    this.badgeNumber = 0,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetIcon = icon is AssetImage
        ? Image(
            image: icon,
            width: 16,
            color: selected ? Colors.white : AppColors.kMaincolor,
          )
        : icon is Widget
            ? icon
            : null;
    return Tab(
      text: text,
      icon: widgetIcon,
      iconMargin: EdgeInsets.only(bottom: 4),
    );
  }
}

class _TabStyle extends AnimatedWidget {
  final bool selected;
  final CustomTab child;

  const _TabStyle({
    Key key,
    @required this.selected,
    @required this.child,
  }) : super(key: key, listenable: kAlwaysDismissedAnimation);

  @override
  Widget build(BuildContext context) {
    child.selected = selected;

    return DefaultTextStyle(
      style: TextStyle(
          fontSize: 12,
          color: selected ? Colors.white : Colors.black.withOpacity(.8)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (selected)
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: !selected ? Colors.white : Colors.redAccent,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          Container(child: child),
        ],
      ),
    );
  }
}
