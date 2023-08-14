import 'package:gsgr/view/Base/main_screen.dart';
import 'package:gsgr/view/address/address_screen.dart';
import 'package:gsgr/view/auth/login_screen.dart';
import 'package:gsgr/view/order/order_screen.dart';
import 'package:gsgr/view/place/place_screen.dart';
import 'package:gsgr/view/regist/regist_screen.dart';
import 'package:gsgr/view/setting/page/about/about_screen.dart';
import 'package:gsgr/view/setting/page/contact/contact_screen.dart';
import 'package:gsgr/view/setting/page/faq/faq_screen.dart';
import 'package:gsgr/view/setting/page/history/history_order.dart';
import 'package:gsgr/view/setting/page/history/history_screen.dart';
import 'package:gsgr/view/setting/page/location/location_screen.dart';
import 'package:gsgr/view/setting/page/location/page/add_location.dart';
import 'package:gsgr/view/setting/page/mycoupon/mycoupon_screen.dart';
import 'package:gsgr/view/setting/page/notification/notification_screen.dart';
import 'package:gsgr/view/setting/page/profile/profile_screen.dart';
import 'package:gsgr/view/setting/page/rating/rating_screen.dart';
import 'package:gsgr/view/setting/setting_screen.dart';
import 'package:gsgr/view/splash/splash_page.dart';
import 'package:gsgr/view/suggest/suggest_screen.dart';

import 'view/coupon/coupon_screen.dart';
import 'view/setting/page/work/detail_order/detail_order.dart';
import 'view/setting/page/work/task_screen.dart';
import 'view/setting/page/work/work_sreen.dart';
import 'view/setting/page/work/statistic_screen.dart';

class AppRouters {
  AppRouters._();
  static final routers = [
    SplashScreen.route,
    MainScreen.route,
    LoginSreen.route,
    OrderScreen.route,
    AddressScreen.route,
    SuggestScreen.route,
    PlaceScreen.route,
    SettingScreen.route,
    HistoryScreen.route,
    HistoryOrderScreen.route,
    AboutScreen.route,
    FAQScreen.route,
    RatingScreen.route,
    ContactScreen.route,
    ProfileScreen.route,
    LocationScreen.route,
    AddLocation.route,
    RegistScreen.route,
    CouponScreen.route,
    TaskScreen.route,
    WorkScreen.route,
    StatisticScreen.route,
    DetailOrderScreen.route,
    NotificationScreen.route,
    MycouponScreen.route,
  ];
}
