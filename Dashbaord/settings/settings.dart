import 'package:dating_app/Dashbaord/settingspages/billingsettings/billingsettings.dart';
import 'package:dating_app/Dashbaord/settingspages/notificationsettings.dart';
import 'package:dating_app/Dashbaord/settingspages/privacypolicy/privacypolicy.dart';
import 'package:dating_app/Dashbaord/settingspages/profilesettings/profilesettings.dart';
import 'package:dating_app/block-flagged/blocked.dart';
import 'package:dating_app/block-flagged/flagged.dart';
import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/the_pairup_logo_black.png',
          height: 80,
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          _buildSettingsItem(
            context,
            icon: Icons.person_outline,
            title: "Profile Setting",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfileScreen(),
                ),
              );
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.notifications_outlined,
            title: "Notification Setting",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationSettingsScreen(),
                ),
              );
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.subscriptions_outlined,
            title: "Manage Your Subscription",
            onTap: () {
              // Navigate to Subscription Management Screen
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.privacy_tip_outlined,
            title: "Privacy Policy",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyPolicyScreen(),
                ),
              );
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.history_outlined,
            title: "Billing History",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BillingHistoryScreen(),
                ),
              );
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.power_settings_new_outlined,
            title: "Deactivate Account",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountFlaggedScreen(),
                ),
              );
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.delete_outline,
            title: "Delete Account",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Blocked(),
                ),
              );
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.logout,
            title: "Logout",
            onTap: () {
              // Handle Logout Action
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          horizontalTitleGap: 10,
          minLeadingWidth: 0,
          leading: Icon(icon, color: Colors.black87, size: 18),
          title: Text(
            title,
            style: AppTheme.textTheme.labelLarge?.copyWith(
              color: const Color(0xFF111827), // ✅ updated to #111827
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black45),
          onTap: onTap,
        ),
        const Divider(
          thickness: 0.6,
          height: 0,
          color: Colors.black12,
        ),
      ],
    );
  }
}
