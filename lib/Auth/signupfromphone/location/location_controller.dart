import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PairUpLocationController extends GetxController {
  final TextEditingController locationController = TextEditingController();
  var selectedLocation = Rxn<LatLng>();

  Future<void> updateLocation(LatLng position) async {
    selectedLocation.value = position;
    await getAddressFromLatLng(position);
  }

  Future<void> getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        locationController.text = "${place.locality}, ${place.country}";
      }
    } catch (e) {
      print("Error getting address: $e");
    }
  }

  @override
  void onClose() {
    locationController.dispose();
    super.onClose();
  }
}
