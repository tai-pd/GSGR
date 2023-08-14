import 'package:gsgr/models/point_friend_model.dart';
import 'package:gsgr/repositories/point_friend_repository.dart';
import 'package:get/get.dart';

class MycouponController extends GetxController {
  var mainPoint = '0'.obs;
  List<Friends> tmpList;
  var listFriends = [].obs;
  var isLoading = false.obs;
  var asc = true.obs;

  PointFriendRepository pointFriend = PointFriendRepository();

  @override
  void onInit() async {
    super.onInit();
    listFriends.clear();
    await pointFriend.getListFriend().then((value) => {
          if (value != null)
            {
              mainPoint.value = value.point.toString(),
              tmpList = value.friends,
              tmpList
                  .sort((a, b) => a.children.point.compareTo(b.children.point)),
              listFriends.addAll(tmpList)
            }
        });
  }

  void sorting() {
    if (!asc.value) {
      listFriends.clear();
      tmpList.sort((a, b) => a.children.point.compareTo(b.children.point));
      listFriends.addAll(tmpList);
    } else {
      listFriends.clear();
      tmpList.sort((b, a) => a.children.point.compareTo(b.children.point));
      listFriends.addAll(tmpList);
    }
    asc.value = !asc.value;
  }
}
