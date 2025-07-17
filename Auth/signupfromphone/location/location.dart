import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../themesfolder/theme.dart';
import 'location_controller.dart';
import 'mapselection.dart';


class PairUpLocationScreen extends StatelessWidget {
  const PairUpLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PairUpLocationController controller = Get.put(PairUpLocationController());

    Future<void> _openMapScreen() async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MapSelectionScreen()),
      );

      if (result != null && result is LatLng) {
        controller.updateLocation(result);
      }
    }

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Pair Up Location',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Your PairUp Location',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 30),
            const Text(
              'Location',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller.locationController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Choose a location',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _openMapScreen,
              icon: const Icon(Icons.location_on_outlined, color: Colors.black),
              label: const Text('Choose Location on Map', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[50],
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/gettoknow');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF111827),
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
