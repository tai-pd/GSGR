import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressController extends GetxController {
  var currentLocation = null.obs;
  var address = ''.obs;

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

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
    Position locationPositon = await Geolocator.getCurrentPosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(
        locationPositon.latitude, locationPositon.longitude);
    Placemark placeMark = placemarks[0];
    String _address =
        '${placeMark.name} ${placeMark.subLocality} ${placeMark.subAdministrativeArea}  ${placeMark.locality} ${placeMark.country}  ';

    address.value = _address;
    return locationPositon;
  }

  void getAddressWithLat(LatLng latLng) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    Placemark placeMark = placemarks[0];
    String _address =
        '${placeMark.name} ${placeMark.subLocality} ${placeMark.subAdministrativeArea}  ${placeMark.locality} ${placeMark.country}  ';
    print(placeMark);
    address.value = _address;
  }
}
