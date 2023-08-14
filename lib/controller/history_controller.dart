import 'package:get/get.dart';
import 'package:gsgr/models/history_order_model.dart';
import 'package:gsgr/repositories/history_repository.dart';
import 'package:gsgr/value/session_manager.dart';

class HistoryOrderController extends GetxController {
  var listHistory = [].obs;
  var dataNew = [].obs;
  var datacomming = [].obs;
  var dataDoing = [].obs;
  var dataComplet = [].obs;

  var fromDate = 'Từ ngày'.obs;
  var toDate = 'Đến ngày'.obs;
  var orderType = 'Phân loại'.obs;
  var orderId = '';
  var customerTel = '';
  var loading = true.obs;
  var listData = [].obs;
  var isLoading = false.obs;
  var roleId = ''.obs;
  var currentPage = 0;
  var lastPosition = 2000.0;

  HistoryRepository _historyRepository = HistoryRepository();
  SessionManager _sessionManager = SessionManager();

  @override
  void onReady() {
    super.onReady();
  }

  Future getHistoryOrder() async {
    isLoading.value = true;
    await _sessionManager
        .getInt(_sessionManager.roleId)
        .then((value) => roleId.value = value.toString() ?? '1');
    await _historyRepository
        .getListHistoryOrder(roleId.value, fromDate, toDate, orderType, orderId,
            customerTel, 0, 20)
        .then((value) {
      if (value.status == 200) {
        listHistory.clear();
        currentPage++;
        listHistory.addAll(value.data.order);
      }
    });
    isLoading.value = false;
  }

  Future getHistoryOrderMore() async {
    isLoading.value = true;
    await _sessionManager
        .getInt(_sessionManager.roleId)
        .then((value) => roleId.value = value.toString() ?? '1');
    await _historyRepository
        .getListHistoryOrder(roleId.value, fromDate, toDate, orderType, orderId,
            customerTel, currentPage, 20)
        .then((value) {
      if (value.status == 200) {
        if (value != null && value.data.order.length > 0) {
          currentPage++;
          listHistory.addAll(value.data.order);
        }
      }
    });
    isLoading.value = false;
  }

  double sumPriceProductions(Order order) {
    var sum = 0.0;
    if (order.products.length > 0) {
      order.products.forEach((element) {
        double quantity = double.parse(element.pivot.quantity);
        sum += (element.price * quantity);
      });
    }

    return sum;
  }

  Future searchHistoryOrder(
      {String orderStart,
      String orderEnd,
      String status,
      String orderId,
      String customerTel}) async {
    isLoading.toggle();
    await _historyRepository
        .getListHistoryOrder(roleId.value, fromDate, toDate, orderType, orderId,
            customerTel, 0, 20)
        .then((value) {
      if (value.status == 200) {
        listHistory.clear();
        listHistory.addAll(value.data.order);
      }
    });
    isLoading.toggle();
  }
}
