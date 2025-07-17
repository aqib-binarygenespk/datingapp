import 'package:dating_app/Dashbaord/profile/profile_controller.dart';
import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        children: [
          // ✅ SafeArea with logo
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/the_pairup_logo_black.png',
                height: 80,
              ),
            ),
          ),

          const Divider(thickness: 0.5, height: 0.7, color: Colors.black12),

          // ✅ Title row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: Text(
                      'Dating Profile',
                      style: AppTheme.textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ✅ Profile content
          Expanded(
            child: Obx(() => SingleChildScrollView(
              child: Column(
                children: [
                  // Profile video image with play button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage('assets/profilevideoimage.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: const Center(
                          child: Icon(Icons.play_circle_outline, size: 50, color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.userName.value,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          controller.ageHeight.value,
                          style: const TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 16),

                        // Profile sections
                        ...controller.profileDetails.map((section) => Column(
                          children: [
                            buildProfileSection(context, section['title']!, section['content']!),
                            const Divider(color: Colors.grey, thickness: 0.5),
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }

  Widget buildProfileSection(BuildContext context, String title, String content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.textTheme.bodyMedium, // ✅ title uses bodyMedium
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: AppTheme.textTheme.bodySmall, // ✅ content uses bodySmall
          ),
        ],
      ),
    );
  }
}
