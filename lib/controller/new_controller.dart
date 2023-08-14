import 'package:get/get.dart';
import 'package:gsgr/repositories/news_repository.dart';

class NewController extends GetxController {
  var list = [].obs;
  NewsRepository repository = NewsRepository();

  @override
  void onInit() async {
    super.onInit();
    await repository.getNewsData().then((value) {
      if (value.status == 200) {
        list.addAll(value.data.newses);
      }
    });
  }

  Future loadNews() async {
    await repository.getNewsData().then((value) {
      if (value.status == 200) {
        list.clear();
        list.addAll(value.data.newses);
      }
    });
  }
}
