import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/widget/top_nav.dart';

class FAQScreen extends StatelessWidget {
  static const String routeName = '/faq';
  static final route = GetPage(name: routeName, page: () => FAQScreen());
  final String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMaincolor,
      body: SafeArea(
        child: Container(
          color: AppColors.kMainBackground,
          child: Column(
            children: [
              WidgetTopNav(
                title: 'Câu hỏi thường gặp',
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleCategoryFAQ('1. Giới thiệu về Giặt Sấy Giá Rẻ'),
                        SizedBox(height: 8),
                        ExpanedItemFAQ(
                          content: """
 - Hotine: 0905576921
 - Email : giatsaygiare@gmail.com
 - Website: giatsaygiare.vn- giatsaygiare.com
 - facebook : giasaygiarevn""",
                          title: 'Thông tin liên hệ ',
                        ),
                        ExpanedItemFAQ(
                          content: """
 - Bước 1 : Sau khi nhận được đơn đặt hàng của bạn qua app, hotline, facebook: chúng tôi sẽ chủ động liên hệ với bạn về thời gian nhận đồ. 

 - Bước 2 : Nhân viên giao hàng sẽ đến nhận đồ theo lịch hẹn ( liên hệ với khách hàng trước 15-30 phút trước khi đến).

 - Bước 3 : Chúng tôi sẽ xử lý đồ theo yêu cầu danh mục sản phẩm khách hàng đã chọn.

 - Bước 4 : Sau khi hoàn thành xử lý, chúng tôi sẽ liên hệ với khách hàng về : thời gian giao hàng, giá thành dịch vụ sẽ giao hàng theo lịch hẹn.
                          """,
                          title: 'Cách thức hoạt động',
                        ),
                        SizedBox(height: 8),
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
              )
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
        '$title',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class ExpanedItemFAQ extends StatelessWidget {
  final String title;
  final String content;
  const ExpanedItemFAQ({
    @required this.content,
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                  ),
                  header: Padding(
                    padding:
                        EdgeInsets.only(top: 8, left: 8, right: 4, bottom: 4),
                    child: Text(
                      '$title ',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(bottom: 0),
                          child: Text(
                            '$content',
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          )),
                    ],
                  ),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, bottom: 4),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
