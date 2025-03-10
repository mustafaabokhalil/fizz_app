import 'package:fizz/app_imports.dart';
import 'package:fizz/view/sub_screens/delivery_map_screen/controller/delivery_map_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  Rxn<LatLng> currentPosition = Rxn<LatLng>();
  Future getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    } else {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      currentPosition.value = LatLng(position.latitude, position.longitude);
      Get.find<DeliveryMapLocation>().selectedLatLong = currentPosition.value;
      update();
    }
  }
}
