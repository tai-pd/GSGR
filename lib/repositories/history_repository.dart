import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:gsgr/api/api_manager.dart';
import 'package:gsgr/helper/data.dart';
import 'package:gsgr/models/history_order_model.dart';
import 'package:gsgr/value/constants.dart';
import 'package:gsgr/value/session_manager.dart';

class HistoryRepository {
  ApiManager api = ApiManager();
  SessionManager _sessionManager = new SessionManager();

  Future<HistoryOrder> getListHistoryOrder(
      String rulerID,
      RxString fromDate,
      RxString toDate,
      RxString orderType,
      String orderId,
      String customerTel,
      int offset,
      int limit) async {
    int userId;
    int status;
    await _sessionManager
        .getInt(_sessionManager.userId)
        .then((value) => userId = value);

    if (fromDate.compareTo('Từ ngày') == 0) {
      fromDate = null;
    }
    if (toDate.compareTo('Đến ngày') == 0) {
      toDate = null;
    }
    status = getStatusValue(orderType);

    String url = Constants.apiGetOrderHistory +
        'customer_id=$userId&role_id=$rulerID&from_date=$fromDate&to_date=$toDate&status=$status&order_id=$orderId&customer_tel=$customerTel&offset=$offset&limit=$limit';
    final repon = await api.get(url);

    return HistoryOrder.fromJson(repon);
  }

  Future<HistoryOrder> getListAllOrder() async {
    int userId;
    await _sessionManager
        .getInt(_sessionManager.userId)
        .then((value) => userId = value);
    String url = Constants.apiGetHistoryOrder + 'customer_id=$userId';
    final repon = await api.get(url);

    return HistoryOrder.fromJson(repon);
  }

  Future<HistoryOrder> getListAllOrderForAdminByType(int idStatus) async {
    String url = Constants.apiGetHistoryOrder + 'status=$idStatus';
    final repon = await api.get(url);

    return HistoryOrder.fromJson(repon);
  }

  Future<HistoryOrder> getListAllOrderForStaff() async {
    SessionManager _session = SessionManager();
    String staffID;
    await _session.getString(_session.userId).then((value) => staffID = value);
    String url = Constants.apiGetHistoryOrder + 'staff_id=$staffID';
    final repon = await api.get(url);

    return HistoryOrder.fromJson(repon);
  }
}
