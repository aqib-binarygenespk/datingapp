import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../themesfolder/theme.dart';
import 'bonding_controller.dart';

class BondingMomentsScreen extends StatelessWidget {
  const BondingMomentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BondingMomentsController());
    final double boxWidth = (MediaQuery.of(context).size.width - 48) / 2;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text('Bonding Moments', style: Theme.of(context).textTheme.displayLarge),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Scrollbar(
          thumbVisibility: true,
          thickness: 4,
          radius: const Radius.circular(12),
          child: ListView.separated(
            itemCount: controller.bondingOptions.length,
            separatorBuilder: (_, __) => const Divider(height: 20, thickness: 1, color: Colors.black12),
            itemBuilder: (_, rowIndex) {
              final row = controller.bondingOptions[rowIndex];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: row.map((option) {
                  return Obx(() {
                    final isSelected = controller.selectedOptions[rowIndex] == option;
                    return GestureDetector(
                      onTap: () => controller.toggleSelection(rowIndex, option),
                      child: Container(
                        width: boxWidth,
                        height: 72,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? Colors.black : Colors.black26,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomCircularCheckBox(isSelected: isSelected),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                option,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: isSelected ? Colors.white : Colors.grey.shade800,
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                }).toList(),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: SizedBox(
          height: 52,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/aboutme'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("Next"),
          ),
        ),
      ),
    );
  }
}

class CustomCircularCheckBox extends StatelessWidget {
  final bool isSelected;
  const CustomCircularCheckBox({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.white : Colors.black38,
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
        child: Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      )
          : null,
    );
  }
}
