import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gsgr/repositories/category_repository.dart';

class CategoryControllor extends GetxController {
  final categoryOrder = [].obs;

  get category => this.categoryOrder;
  CategoryReposity _categoryReposity = CategoryReposity();

  @override
  void onInit() {
    super.onInit();
    _categoryReposity.getListCateGory().then((value) {
      if (value.status == 200) {
        categoryOrder.addAll(value.data.groups);
      }
    });
  }

  Future permisionLocation() async {
    LocationPermission permission;
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
  }
}
