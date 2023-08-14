import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/value/colors.dart';
import 'package:gsgr/widget/top_nav.dart';

class AboutScreen extends StatelessWidget {
  static const String routeName = '/about';
  static final route = GetPage(name: routeName, page: () => AboutScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMaincolor,
      body: SafeArea(
        child: Container(
          height: Get.height,
          color: AppColors.kMainBackground,
          child: SingleChildScrollView(
            child: Column(
              children: [
                WidgetTopNav(title: 'Về chúng tôi'),
                Container(
                  padding: EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Về chúng tôi',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                '\nĐược thành lập từ năm 2016 xuất phát từ nhu cầu cần thiết để phục vụ nhu cầu sống của mỗi người trở nên tiện lợi và tốt hơn. Giặt Sấy Giá Rẻ hướng đến phong cách làm việc chuyên nghiệp đi đầu về công nghệ, luôn không ngừng học hỏi thay đổi và hoàn thiện để mang đến sản phẩm dịch vụ tốt nhất.',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: '\n\nTrung Thực:',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                ' Tất cả đội ngũ của Giặt Sấy Giá Rẻ luôn đề cao sự trung thực trong quá trình làm việc và luôn xây dựng đức tính này để trở thành văn hóa của doanh nghiệp.',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: '\n\nTiên Tiến:',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                ' Giặt Sấy Giá Rẻ luôn học hỏi, cải tiến quy trình và máy móc tiên tiến để tạo ra sản phẩm dịch vụ hoàn hảo nhất. Một sản phẩm dịch vụ của khách hàng được hệ thống lưu trữ của chúng tôi ghi lại tất cả các khâu từ khi nhận đến khi trả sản phẩm hoàn thiện.',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: '\n\nPhù hợp và Tiện lợi:',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                '\n-  Hiểu được mong muốn của khách hàng, chúng tôi tạo ra nhiều sản phẩm giặt chất lượng, nhanh chóng và dịch vụ uy tín với mức giá phù hợp nhất.',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text:
                                '\n-  Dịch vụ giao nhận tận nhà qua các kênh đặt hàng qua app, hotline, fanpage...cùng với đội ngũ chuyên nghiệp giúp khách hàng đặt hàng nhanh chóng và thuận lợi.',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: '\n\nCam kết:',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                ' Giặt Sấy Giá Rẻ cam kết về chất lượng và uy tín dịch vụ được khách hàng tin dùng. Chịu hoàn toàn về các sai sót trong quá trình vận hành. ',
                            style: TextStyle(color: Colors.black)),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
