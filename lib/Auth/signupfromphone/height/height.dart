// height.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../themesfolder/theme.dart';
import 'height_controller.dart';

class HeightSelection extends StatelessWidget {
  const HeightSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final HeightSelectionController controller = Get.put(HeightSelectionController());

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black, size: 28),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            // Title
            Text(
              "Height",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 50),

            // Slider
            Obx(() => SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 2.0,
                activeTrackColor: Colors.black,
                inactiveTrackColor: Colors.black26,
                thumbColor: Colors.black,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                overlayShape: SliderComponentShape.noOverlay,
                tickMarkShape: SliderTickMarkShape.noTickMark,
                trackShape: const RectangularSliderTrackShape(),
              ),
              child: Slider(
                value: controller.heightInInches.value,
                min: 36,
                max: 84,
                divisions: 48,
                onChanged: controller.updateHeight,
              ),
            )),

            const SizedBox(height: 8),

            // Value display under thumb
            Center(
              child: Obx(() => Text(
                controller.heightInFeetAndInches,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              )),
            ),

            const Spacer(),

            // Next button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/interestedin'),
                child: const Text("Next"),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}