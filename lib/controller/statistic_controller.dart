import 'package:get/get.dart';
import 'package:gsgr/repositories/statistic_order_repository.dart';
import 'package:gsgr/responses/statistic_order_response.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class StatisticController extends GetxController {
  StatisticOrderRepository _oderRepo = StatisticOrderRepository();

  var fromDate = 'Từ ngày'.obs;
  var toDate = 'Đến ngày'.obs;
  var orderType = 'Phân loại'.obs;
  var orderId = ''.obs;
  var customerPhone = ''.obs;
  var loading = true.obs;
  var listData = [].obs;
  var totalPrice = ''.obs;
  var isLoadding = false.obs;

  final PagingController<int, Order> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  onReady() {
    super.onReady();
  }

  Future getOrders(
      {int pageKey,
      String orderStart,
      String orderEnd,
      String status,
      String orderId,
      String phone}) async {
    isLoadding.toggle();
    await _oderRepo
        .statisticOrder(
            pageKey: pageKey,
            orderStart: orderStart,
            orderEnd: orderEnd,
            status: status,
            phone: phone,
            idOrder: orderId)
        .then((value) {
      if (value.status == 200) {
        final isLastPage = value.data.order.length < 5;
        if (isLastPage) {
          pagingController.appendLastPage(value.data.order);
        } else {
          final nextPageKey = pageKey + value.data.order.length;
          pagingController.appendPage(value.data.order, nextPageKey);
        }
        totalPrice.value = value.data.sumTotalPrice;
      }
    });
    isLoadding.toggle();
  }

  Future searchOrders(
      {int pageKey,
      String orderStart,
      String orderEnd,
      String status,
      String orderId,
      String phone}) async {
    isLoadding.toggle();
    await _oderRepo
        .statisticOrder(
            pageKey: pageKey,
            orderStart: orderStart,
            orderEnd: orderEnd,
            status: status,
            phone: phone,
            idOrder: orderId)
        .then((value) {
      if (value.status == 200) {
        pagingController.refresh();

        final check = value.data.order.length < 5;
        if (!check) {
          final nextPageKey = pageKey ?? 0 + value.data.order.length;
          pagingController.appendPage(value.data.order, nextPageKey);
        }
        totalPrice.value = value.data.sumTotalPrice;
      }
    });
    isLoadding.toggle();
  }
}
