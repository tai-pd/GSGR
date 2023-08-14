import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gsgr/controller/address_controller.dart';
import 'widget/widget_button_accept_address.dart';
import 'widget/widget_button_back_address.dart';
import 'widget/widget_form_input_address.dart';

class AddressScreen extends StatefulWidget {
  static const routeName = '/address';
  static final route = GetPage(name: routeName, page: () => AddressScreen());

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final controller = Get.put(AddressController());
  final Set<Marker> _markers = {};
  GoogleMapController mapController;
  Position location;

  @override
  void initState() {
    super.initState();
    controller.determinePosition().then((value) {
      setState(() {
        location = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          location == null
              ? SizedBox()
              : GoogleMap(
                  markers: _markers,
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  onTap: (value) {
                    controller.getAddressWithLat(value);
                  },
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                        location.latitude,
                        location.longitude,
                      ),
                      zoom: 15),
                ),
          WidgetButtonBackAddress(),
          Positioned(
            bottom: 32,
            left: 8,
            right: 8,
            child: Column(
              children: [
                WidgetFormInputAddress(),
                WidgetButtonAcceptAddress(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
