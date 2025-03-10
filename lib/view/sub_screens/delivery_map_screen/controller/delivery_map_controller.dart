import 'dart:developer';

import 'package:fizz/app_imports.dart';
import 'package:fizz/view/sub_screens/delivery_map_screen/controller/location_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryMapLocation extends GetxController {
  late GoogleMapController mapController;
  final Set<Marker> markers = {};
  String currentAddress = '';
  LatLng? selectedLatLong;
  void onMapCreated(GoogleMapController controller) async {
    mapController = controller;

    // Get the current location and initialize the map
    await _initializeMap();

    // Animate the camera to district location if available
    _animateCameraToDistrict();
  }

  Future<void> _initializeMap() async {
    try {
      await Get.find<LocationController>().getCurrentLocation();

      final Uint8List markerImage = await AppFunctions.getBytesFromAssets(
        path: AppAssets.addresses,
        height: 80,
        width: 80,
      );
      _addMarker(
        const LatLng(30.0, 30.0),
        markerImage,
      );
    } catch (e) {
      log('Error initializing map: $e');
    }
  }

  void _addMarker(LatLng position, Uint8List markerImage) {
    final marker = Marker(
      markerId: const MarkerId("selected-location"),
      position: position,
      icon: BitmapDescriptor.fromBytes(markerImage),
    );

    markers.add(marker);
    update();
  }

  void _animateCameraToDistrict() {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(target: LatLng(30.0, 30.0), zoom: 9.0),
      ),
    );
  }
}
