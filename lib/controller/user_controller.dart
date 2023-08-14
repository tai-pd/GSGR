import 'package:get/get.dart';
import 'package:gsgr/models/cusomer_model.dart';
import 'package:gsgr/models/history_order_model.dart';
import 'package:gsgr/repositories/order_repository.dart';
import 'package:gsgr/repositories/user_repository.dart';
import 'package:gsgr/value/session_manager.dart';

class UserController extends GetxController {
  var listStaff = [].obs;
  var listCusomer = [].obs;
  var listShiper = [].obs;
  var nameStaff = ''.obs;
  var storeAddress = ''.obs;
  var idStaff = 0.obs;
  var idShiper = 0.obs;
  var nameShiper = ''.obs;
  var totalPrice = 0.obs;
  var transferSuccess = false.obs;
  var listProduct = [].obs;
  int roleId = 0;

  var isShipper = false.obs;

  SessionManager sessionManager = SessionManager();

  UserRepository _repository = UserRepository();
  OrderRepository _orderRepository = OrderRepository();

  @override
  void onInit() {
    super.onInit();
    getListStaff();
    getRoleId();
  }

  Future getRoleId() async {
    roleId = await sessionManager.getInt(sessionManager.roleId);
  }

  setListProducts(Order order) {
    order.products
      ..forEach((item) {
        // Map<String, String> data  = Map. item.pivot.productId.toString() , item.pivot.quantity;
        //   listProduct.add({'${listproduct.}'} );
      });
  }

  Future getListStaff() async {
    await _repository.getUserbyRole(2).then((repon) => {
          if (repon.status == 200) {listShiper.addAll(repon.data.customer)}
        });

    await _repository.getUserbyRole(1).then((repon) => {
          if (repon.status == 200) {listCusomer.addAll(repon.data.customer)}
        });

    await _repository.getUserbyRole(3).then((repon) => {
          if (repon.status == 200) {listStaff.addAll(repon.data.customer)}
        });
  }

  Future transferOrder(String orderId, String shiperId, dynamic storeId) async {
    await _orderRepository.transferOrder(
        orderId: orderId, shiperId: shiperId, storeId: storeId);
  }

  Customer getCustomeByID(int id) {
    Customer result = Customer();
    listCusomer.forEach((custome) {
      if ((custome as Customer).id == id) {
        result = custome;
      }
    });
    return result;
  }

  String getNameShiper(idShiper) {
    String shiperName = '';
    if (listShiper.length > 0) {
      listShiper.forEach((element) {
        Customer shiper = element;
        if (shiper.id == idShiper) {
          shiperName = shiper.name;
        }
      });
    }
    return shiperName;
  }
}
