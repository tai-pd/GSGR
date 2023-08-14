import 'package:gsgr/api/api_manager.dart';
import 'package:gsgr/responses/user_reponse.dart';
import 'package:gsgr/value/constants.dart';

class UserRepository {
  ApiManager api = ApiManager();

  Future<UserReponse> getUserbyRole(int idRole) async {
    String url = Constants.apiGetCustomer + 'role_id=$idRole';
    final result = await api.get(url);
    return UserReponse.fromJson(result);
  }

  Future<UserReponse> getUserbyPhone(String phone) async {
    String url = Constants.apiGetCustomerByPhone;
    final result = await api.post(url, {
      '_method': 'POST',
      'phone_number': phone,
    });
    return UserReponse.fromJson(result);
  }

  Future<void> logout(String customerID) async {
    String url = Constants.apiLogOut;

    await api.post(url, {
      'id': customerID,
    }).then((value) {});
  }
}
