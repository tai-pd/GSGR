import 'package:gsgr/api/api_manager.dart';
import 'package:gsgr/helper/data.dart';
import 'package:gsgr/responses/statistic_order_response.dart';
import 'package:gsgr/value/constants.dart';

class StatisticOrderRepository {
  ApiManager api = ApiManager();

  Future<StatisticOrderResponse> statisticOrder(
      {int pageKey,
      String orderStart,
      String orderEnd,
      String status,
      String phone,
      String idOrder}) async {
    Map<String, dynamic> body = {
      '_method': 'POST',
      'offset': pageKey,
      'limit': 10,
      'date_from': orderStart == 'Từ ngày' ? null : orderStart,
      'date_to': orderEnd == 'Đến ngày' ? null : orderEnd,
      'status': getStatusValue(status),
      'order_id': idOrder,
      'phone': phone
    };
    final respo = await api.postWithHeader(Constants.apiStatisticOrder, body);
    return StatisticOrderResponse.fromJson(respo);
  }
}
