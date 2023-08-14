import 'package:get/get.dart';
import 'package:gsgr/repositories/order_repository.dart';
import 'package:gsgr/responses/task_order_response.dart';
import 'package:gsgr/value/constants.dart';
import 'package:gsgr/value/session_manager.dart';

class TaskController extends GetxController {
  OrderRepository _oderRepo = OrderRepository();
  var isLoadding = false.obs;
  var isLoaddingDialog = false.obs;
  var listProduct = [].obs;
  var totalPrice = 0.obs;
  var list1 = [].obs;
  var list2 = [].obs;
  var dataAll = [].obs;
  int roleId = 0;
  int userId = -1;
  var isShowingForm = false.obs;
  SessionManager sessionManager = SessionManager();

  Map<String, dynamic> item = {};

  @override
  void onInit() {
    super.onInit();
    getOrders();
    getRoleId();
    getUserId();
  }

  Future getRoleId() async {
    roleId = await sessionManager.getInt(sessionManager.roleId);
  }

  Future getUserId() async {
    userId = await sessionManager.getInt(sessionManager.userId);
  }

  Future getOrders() async {
    isLoadding.toggle();
    int userId = 0, roleId = 0;
    await sessionManager
        .getInt(sessionManager.userId)
        .then((value) => userId = value);
    await sessionManager
        .getInt(sessionManager.roleId)
        .then((value) => roleId = value);
    if (roleId == 3) {
      await _oderRepo.getOrderbyStaff(staffId: userId).then((value) {
        dataAll.clear();
        dataAll.addAll(value);
        list1.clear();
        list2.clear();
        value.forEach((element) {
          if (element.status == STATUSORDER.SHIPER_GIAO_HANG.value ||
              element.status == STATUSORDER.STORE_NHAN_HANG.value) {
            Future.delayed(Duration(microseconds: 100), () {
              list1.add(element);
            });
          }
          if (element.status == STATUSORDER.STORE_GIAO_HANG.value) {
            Future.delayed(Duration(microseconds: 100), () {
              list2.add(element);
            });
          }
        });
      });
    }
    if (roleId == 2) {
      await _oderRepo.getOrderbyShiper(staffId: userId).then((value) {
        dataAll.clear();
        dataAll.addAll(value);
        list1.clear();
        list2.clear();
        value.forEach((element) {
          if (element.status == 1 || element.status == 2) {
            Future.delayed(Duration(microseconds: 100), () {
              list1.add(element);
            });
          } else {
            Future.delayed(Duration(microseconds: 100), () {
              list2.add(element);
            });
          }
        });
      });
    }
    isLoadding.toggle();
  }

  Future doneTask(
      {int orderId,
      int status,
      int roleId,
      int customerId,
      String noteShip,
      String noteStore}) async {
    isLoadding.toggle();
    await _oderRepo
        .doneTask(
            orderId: orderId,
            status: status,
            roleId: roleId,
            noteShip: noteShip ?? '',
            noteStore: noteStore ?? '',
            customerId: userId)
        .then((value) {
      if (value.status == 200) {
        getOrders();
      }
    });
    isLoadding.toggle();
  }

  Future recieveTask({int orderId, int status}) async {
    await _oderRepo
        .recieveTask(orderId: orderId, status: status, userId: userId)
        .then((value) {
      if (value.status == 200) {
        list1.clear();
        list2.clear();
        getOrders();
      }
    });
  }

  Future getMapProducts({Order order}) async {
    item.clear();
    order.products.forEach((product) {
      Map<String, dynamic> map = {
        product.id.toString(): product.pivot.quantity.toString()
      };
      item.addAll(map);
    });
  }

  Future updateOrderPrice({String orderId, Map<String, dynamic> item}) async {
    isLoaddingDialog.toggle();
    Order tmp =
        await _oderRepo.updateOrderPrice(orderId: orderId, products: item);
    getMapProducts(order: tmp);
    await getDetailOrderByID(orderId);
    totalPrice.value = tmp.totalPrice;
    list1[list1.indexWhere((element) => element.id == tmp.id)] = tmp;
    isLoaddingDialog.toggle();
  }

  Future getDetailOrderByID(String id) async {
    await _oderRepo.getOrderById(orderId: id).then((order) {
      listProduct.clear();
      if (order.products != null && order.products.length > 0) {
        listProduct.addAll(order.products);
      }
    });
  }

  Future ModifyProductToListOrder(
      int valueOrderId, product, String method) async {
    if (method == 'add') {
      Products productItem = new Products();

      productItem.id = product.id;
      productItem.name = product.name;
      productItem.groupId = product.groupId;
      productItem.remark = product.remark;
      productItem.appProductId = product.appProductId;
      productItem.process = product.process;
      productItem.price = product.price;
      productItem.unit = product.unit;
      productItem.image = product.image;
      productItem.discountType = product.discountType;
      productItem.discountNumber = product.discountNumber;
      productItem.createdAt = product.createdAt;
      productItem.updatedAt = product.updatedAt;
      productItem.deletedAt = product.deletedAt;
      productItem.pivot = new Pivot(
        orderId: valueOrderId,
        productId: product.id,
        quantity: '1',
      );

      listProduct.add(productItem);

      item.clear();
      listProduct.forEach((product) {
        Map<String, dynamic> map = {
          product.id.toString(): product.pivot.quantity.toString()
        };
        item.addAll(map);
      });
    } else if (method == 'remove') {
      if (listProduct.length > 1) {
        listProduct.removeAt(
            listProduct.indexWhere((element) => element.id == product.id));

        item.clear();
        listProduct.forEach((Products) {
          Map<String, dynamic> map = {
            product.id.toString(): product.pivot.quantity.toString()
          };
          item.addAll(map);
        });
      }
    }
  }

  seachDataLocal(String idDonhang, String phone) {
    isLoadding.toggle();
    list1.clear();
    list2.clear();
    dataAll.forEach((element) {
// only don hang
      if (idDonhang != '' && phone == '') {
        if (roleId == 2) {
          if (element.status == 2) {
            Future.delayed(Duration(microseconds: 100), () {
              if ((element as Order).id == int.parse(idDonhang))
                list1.add(element);
            });
          } else {
            Future.delayed(Duration(microseconds: 100), () {
              if ((element as Order).id == int.parse(idDonhang))
                list2.add(element);
            });
          }
        } else {
          if (element.status == STATUSORDER.SHIPER_GIAO_HANG.value ||
              element.status == STATUSORDER.STORE_NHAN_HANG.value) {
            Future.delayed(Duration(microseconds: 100), () {
              if ((element as Order).id == int.parse(idDonhang))
                list1.add(element);
            });
          }
          if (element.status == STATUSORDER.STORE_GIAO_HANG.value) {
            Future.delayed(Duration(microseconds: 100), () {
              if ((element as Order).id == int.parse(idDonhang))
                list2.add(element);
            });
          }
        }
      } else if (idDonhang == '' && phone != '') {
        // only Phone
        if (roleId == 2) {
          if (element.status == 2) {
            Future.delayed(Duration(microseconds: 100), () {
              if ((element as Order).tel.contains(phone)) list1.add(element);
            });
          } else {
            Future.delayed(Duration(microseconds: 100), () {
              if ((element as Order).tel.contains(phone)) list2.add(element);
            });
          }
        } else {
          if (element.status == STATUSORDER.SHIPER_GIAO_HANG.value ||
              element.status == STATUSORDER.STORE_NHAN_HANG.value) {
            Future.delayed(Duration(microseconds: 100), () {
              if ((element as Order).tel.contains(phone)) list1.add(element);
            });
          }
          if (element.status == STATUSORDER.STORE_GIAO_HANG.value) {
            Future.delayed(Duration(microseconds: 100), () {
              if ((element as Order).tel.contains(phone)) list2.add(element);
            });
          }
        }
      } else if (idDonhang != '' && phone != '') {
//   Phone and id don hang
        if (roleId == 2) {
          if (element.status == 2) {
            Future.delayed(Duration(microseconds: 100), () {
              if ((element as Order).tel.contains(phone) &&
                  (element as Order).id == int.parse(idDonhang))
                list1.add(element);
            });
          } else {
            Future.delayed(Duration(microseconds: 100), () {
              if ((element as Order).tel.contains(phone) &&
                  (element as Order).id == int.parse(idDonhang))
                list2.add(element);
            });
          }
        } else {
          if (element.status == STATUSORDER.SHIPER_GIAO_HANG.value ||
              element.status == STATUSORDER.STORE_NHAN_HANG.value) {
            Future.delayed(Duration(microseconds: 100), () {
              if ((element as Order).tel.contains(phone) &&
                  (element as Order).id == int.parse(idDonhang))
                list1.add(element);
            });
          }
          if (element.status == STATUSORDER.STORE_GIAO_HANG.value) {
            Future.delayed(Duration(microseconds: 100), () {
              if ((element as Order).tel.contains(phone) &&
                  (element as Order).id == int.parse(idDonhang))
                list2.add(element);
            });
          }
        }
      } else {
        if (roleId == 2) {
          if (element.status == 2) {
            Future.delayed(Duration(microseconds: 100), () {
              list1.add(element);
            });
          } else {
            Future.delayed(Duration(microseconds: 100), () {
              list2.add(element);
            });
          }
        } else {
          if (element.status == STATUSORDER.SHIPER_GIAO_HANG.value ||
              element.status == STATUSORDER.STORE_NHAN_HANG.value) {
            Future.delayed(Duration(microseconds: 100), () {
              list1.add(element);
            });
          }
          if (element.status == STATUSORDER.STORE_GIAO_HANG.value) {
            Future.delayed(Duration(microseconds: 100), () {
              list2.add(element);
            });
          }
        }
      }
    });
    Future.delayed(Duration(microseconds: 100), () {
      isLoadding.toggle();
    });
  }
}
