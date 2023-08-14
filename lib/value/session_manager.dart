import 'package:gsgr/models/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String expires = 'expires_in';
  final String isLoginUser = 'is_login_user';
  final String phone = 'phone';
  final String token = 'token';
  final String name = 'name';
  final String userId = 'userId';
  final String birthday = 'birthday';
  final String point = 'point';
  final String image = 'image';
  final String roleId = 'roleId';
  final String loginToken = 'loginToken';

  Future<void> setInt(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<int> getInt(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt(key);
  }

  Future<void> setString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> getString(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  Future<void> setDouble(String key, double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  Future<double> getDouble(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      return pref.getDouble(key);
    } on Exception {
      return pref.getInt(key).toDouble();
    }
  }

  Future<void> setBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(key);
  }

  Future<void> setListString(String key, List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  Future<List<String>> getListString(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getStringList(key);
  }

  Future<bool> removeForKey(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove(key);
  }

//set data into shared preferences like this
//   Future<void> setAuthToken(String auth_token) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString(this.auth_token, auth_token);
//     // return prefs.commit();
//   }

// //get value from shared preferences
//   Future<String> getAuthToken() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     String auth_token;
//     auth_token = pref.getString(this.auth_token);
//     return auth_token;
//   }

  Future<void> setLogin(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLoginUser, value);
    // prefs.
    clearData();
  }

  Future<bool> isLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(isLoginUser);
  }

  //Save User Info
  Future<void> saveUser(Customer user) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    await prefs.setInt(roleId, user.roleId);
    await prefs.setString(name, user.name);
    await prefs.setInt(userId, user.id);
    await prefs.setString(phone, user.tel);
    await prefs.setString(token, user.token);
    await prefs.setString(birthday, user.birthday ?? '');
    await prefs.setString(image, user?.image ?? '');
    await prefs.setDouble(point, user.point ?? 0.0);
    await prefs.setBool(isLoginUser, true);
    await prefs.setString(loginToken, user.loginToken ?? '');
  }

  Future<Customer> getUser() async {
    Customer cusomer = Customer();
    await getInt(userId).then((value) => cusomer.id = value);
    await getString(name).then((value) => cusomer.name = value);
    await getString(phone).then((value) => cusomer.tel = value);
    await getString(token).then((value) => cusomer.token = value);
    await getString(birthday).then((value) => cusomer.birthday = value);
    await getString(image).then((value) => cusomer.image = value ?? '');
    await getInt(roleId).then((value) => cusomer.roleId = value);
    await getString(loginToken)
        .then((value) => cusomer.loginToken = value ?? '');
    return cusomer;
  }

  Future<String> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(token);
  }

  Future<void> setToken(String valueToken) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (valueToken == null) {
      pref.remove(token);
    } else {
      pref.setString(token, valueToken);
    }
  }

  Future<String> getLoginToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(loginToken);
  }

  Future<void> setLoginToken(String tokenValue) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (tokenValue == null) {
      pref.remove(loginToken);
    } else {
      pref.setString(loginToken, tokenValue);
    }
  }

  Future<void> clearData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //remove user data
    prefs.remove(name);
    prefs.remove(phone);
    prefs.remove(birthday);
    prefs.remove(image);
    prefs.remove(point);
    prefs.remove(phone);
    prefs.remove(userId);
    prefs.remove(roleId);
    await prefs.setBool(isLoginUser, false);
  }
}
