import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/controller/new_controller.dart';
import 'package:gsgr/value/colors.dart';

class BottomSheetNews extends StatelessWidget {
  BottomSheetNews({
    this.newsId,
    Key key,
  }) : super(key: key);

  final int newsId;
  final controller = Get.put(NewController());

  @override
  Widget build(BuildContext context) {
    controller.loadNews();
    var news = controller.list.firstWhere((news) => news.id == newsId);
    return Container(
      height: Get.height - 100,
      decoration: BoxDecoration(
        color: AppColors.kMainBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Text(news.title.toString()),
            ),
            const Divider(
              height: 8.0,
            ),
            Container(
              width: Get.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: news == null
                        ? AssetImage('assets/images/ic_logo.png')
                        : NetworkImage('${news.image}'),
                    fit: BoxFit.cover),
              ),
            ),
            Divider(
              height: 12.0,
              color: AppColors.kMainBackground,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: Container(
                  child: SingleChildScrollView(
                    child: Text(
                      news.description,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
