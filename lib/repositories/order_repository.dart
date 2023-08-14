import 'package:gsgr/api/api_manager.dart';
import 'package:gsgr/responses/order_response.dart';
import 'package:gsgr/responses/task_order_response.dart';
import 'package:gsgr/value/constants.dart';

class OrderRepository {
  ApiManager api = ApiManager();

  Future<OrderRespose> orderProduct(
      {String customerID,
      String addressFrom,
      String noteFrom,
      String addressTo,
      String noteTo,
      String orderStart,
      String rangerTimeStart,
      String orderEnd,
      String rangerTimeEnd,
      String couponID,
      String reMark,
      Map<String, dynamic> listProduct}) async {
    Map<String, dynamic> body = {
      'customer_id': customerID,
      'address_from': addressFrom,
      'note_from': noteFrom,
      'address_to': addressTo,
      'note_to': noteTo,
      'order_start': orderStart,
      'range_time_start': rangerTimeStart,
      'order_end': orderEnd,
      'range_time_end': rangerTimeEnd,
      'coupon_id': couponID,
      'remark': reMark,
      'products': listProduct
    };
    OrderRespose resutl;
    try {
      final respo = await api.postWithHeader(Constants.apiPostOrder, body);
      resutl = OrderRespose.fromJson(respo);
    } on Exception {
      return resutl;
    }

    return resutl;
  }

  Future<OrderRespose> updateOrder(
      {String staffID,
      String totalPrice,
      String status,
      Map<String, dynamic> listProduct}) async {
    Map<String, dynamic> body = {
      '_method': 'PUT',
      'staff_id': staffID,
      'total_price': totalPrice,
      'products': listProduct,
      'status': status
    };
    final respo = await api.postWithHeader(Constants.apiPostOrder, body);
    return OrderRespose.fromJson(respo);
  }

  Future<List<Order>> getOrderbyStaff({int staffId}) async {
    final respo = await api.get(Constants.apiPostOrder);
    var mapResponse = TaskOrderResponse.fromJson(respo);
    List<Order> listOrder = [];
    mapResponse.data.order.forEach((element) {
      if (element.staffId == staffId) {
        listOrder.add(element);
      }
    });
    print(listOrder.length);
    return listOrder;
  }

  Future<List<Order>> getOrderbyShiper({int staffId}) async {
    final respo = await api.get(Constants.apiPostOrder);
    var mapResponse = TaskOrderResponse.fromJson(respo);
    List<Order> listOrder = [];
    mapResponse.data.order.forEach((element) {
      if (element.shiperId == staffId &&
              element.status == STATUSORDER.MOI.value ||
          element.shiperId == staffId &&
              element.status == STATUSORDER.SHIPER_NHAN_HANG.value ||
          element.shiperId == staffId &&
              element.status == STATUSORDER.STORE_GIAO_HANG.value ||
          element.shiperId == staffId &&
              element.status == STATUSORDER.SHIPER_TRA_HANG.value) {
        listOrder.add(element);
      }
    });
    return listOrder;
  }

  Future<Order> doneTask(
      {int orderId,
      int status,
      int roleId,
      int customerId,
      String noteShip,
      String noteStore}) async {
    Map<String, dynamic> body = {
      '_method': 'PUT',
      'status': status,
      'customer_id': customerId,
    };
    Map<String, dynamic> body2 = {
      '_method': 'PUT',
      'status': status,
      'ship_id': 'setNull',
      'customer_id': customerId,
    };

    if (noteShip != '') {
      body2['shipper_note'] = noteShip;
    }
    if (noteStore != null) {
      body['store_note'] = noteStore;
    }

    String url = '${Constants.apiUpdateTask}$orderId';
    var response;
    if (roleId == 3) {
      response = await api.postWithHeader(url, body);
    } else {
      response = await api.postWithHeader(url, body2);
    }
    return Order.fromJson(response);
  }

  Future<Order> recieveTask({int orderId, int status, int userId}) async {
    Map<String, dynamic> body = {
      '_method': 'PUT',
      'status': status,
      'customer_id': userId
    };
    var url = '${Constants.apiUpdateTask}$orderId';
    final response = await api.postWithHeader(url, body);
    return Order.fromJson(response);
  }

  Future<Order> transferOrder(
      {String orderId, String shiperId, dynamic storeId}) async {
    Map<String, dynamic> body = {
      'shiper': shiperId,
      'sub_store': storeId,
    };
    Map<String, dynamic> body2 = {'shiper': shiperId};
    String url = '${Constants.apiTransferOrder}$orderId';
    var response;
    if (storeId != null) {
      response = await api.post(url, body);
    } else {
      response = await api.post(url, body2);
    }
    return Order.fromJson(response);
  }

  Future<Order> updateOrderPrice({
    String orderId,
    Map<String, dynamic> products,
  }) async {
    Map<String, dynamic> body = {
      '_method': 'PUT',
    };
    products.forEach((key, value) {
      body['products[$key]'] = value;
    });

    String url = '${Constants.apiPostOrder}/$orderId';
    final response = await api.post(url, body);
    var b = response['data']['order'];
    var a = Order.fromJson(b);
    return a;
  }

  Future<Order> getOrderById({String orderId}) async {
    String url = '${Constants.apiPostOrder}/$orderId';
    final response = await api.get(url);
    var b = response['data']['order'];
    var a = Order.fromJson(b);
    return a;
  }
}
