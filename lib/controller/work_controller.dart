import 'package:get/get.dart';
import 'package:gsgr/models/history_order_model.dart';
import 'package:gsgr/repositories/history_repository.dart';
import 'package:gsgr/repositories/order_repository.dart';
import 'package:gsgr/value/constants.dart';

class WorkController extends GetxController {
  HistoryRepository _historyRepository = HistoryRepository();
  OrderRepository _orderRepository = OrderRepository();

  var listData = [].obs;
  var dataNew = [].obs;
  var datacomming = [].obs;
  var dataDoing = [].obs;
  var dataComplet = [].obs;
  var isLoadding = false.obs;
  var dataDoneWash = [].obs;
  var isShowingForm = false.obs;

  @override
  onReady() {
    super.onReady();
    getDataOrder();
  }

  Future getDataOrder() async {
    isLoadding.toggle();

    await _historyRepository
        .getListAllOrderForAdminByType(STATUSORDER.MOI.value)
        .then((value) {
      if (value.status == 200) {
        dataNew.clear();
        dataNew.addAll(value.data.order);
      }
    });
    await _historyRepository
        .getListAllOrderForAdminByType(STATUSORDER.STORE_GIAO_HANG.value)
        .then((value) {
      if (value.status == 200) {
        dataDoneWash.clear();
        dataDoneWash.addAll(
            value.data.order.where((element) => element.isShipper == 1));
      }
    });

    await _historyRepository.getListAllOrderForAdminByType(3).then((value) {
      if (value.status == 200) {
        dataDoing.clear();
        dataDoing.addAll(value.data.order);
      }
    });

    await _historyRepository.getListAllOrderForAdminByType(4).then((value) {
      if (value.status == 200) {
        dataComplet.clear();
        dataComplet.addAll(value.data.order);
      }
    });
    isLoadding.toggle();
  }

  Future updateOrder(String total, String status, String idStaff,
      Map<String, dynamic> listProduct) async {
    _orderRepository.updateOrder(
        totalPrice: total,
        staffID: idStaff,
        listProduct: listProduct,
        status: status);
  }
}
