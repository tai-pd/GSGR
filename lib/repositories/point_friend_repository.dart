import 'package:gsgr/api/api_manager.dart';
import 'package:gsgr/models/point_friend_model.dart';
import 'package:gsgr/value/constants.dart';
import 'package:gsgr/value/session_manager.dart';

class PointFriendRepository {
  ApiManager api = ApiManager();
  SessionManager _sessionManager = SessionManager();

  Future<PointFriend> getListFriend() async {
    int userId;
    await _sessionManager
        .getInt(_sessionManager.userId)
        .then((value) => userId = value);
    final url = '${Constants.pointFriend}/$userId';
    PointFriend result;
    try {
      await api
          .get(url)
          .then((value) => {result = PointFriend.fromJson(value['data'][0])});
      return result;
    } on Exception {
      return null;
    }
  }
}
