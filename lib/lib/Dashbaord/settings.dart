import 'package:dating_app/Dashbaord/settingspages/billingsettings.dart';
import 'package:dating_app/Dashbaord/settingspages/notificationsettings.dart';
import 'package:dating_app/Dashbaord/settingspages/privacypolicy.dart';
import 'package:dating_app/Dashbaord/settingspages/profilesettings.dart';
import 'package:dating_app/block-flagged/blocked.dart';
import 'package:dating_app/block-flagged/flagged.dart';
import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,

        elevation: 0,
        title: const Text(
          'The PairUp',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        children: [
          _buildSettingsItem(
            context,
            icon: Icons.person_outline,
            title: "Profile Setting",
            onTap: () {
              // Navigate to Profile Setting Screen
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
              // Navigate to Notification Setting Screen
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
              // Navigate to Privacy Policy Screen
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
              // Navigate to Billing History Screen
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
              // Navigate to Deactivate Account Screen
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
              // Navigate to Delete Account Screen
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
          leading: Icon(icon, color: Colors.black),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 15, color: Colors.black54),
          onTap: onTap,
        ),
        const Divider(
          thickness: 1,
          color: Colors.black12,
        ),
      ],
    );
  }
}
