import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool allOn = false;
  bool allOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Notification Setting',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            SwitchListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              title: const Text(
                "All On",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              value: allOn,
              onChanged: (value) {
                setState(() {
                  allOn = value;
                  allOff = !value;
                });
              },
              activeColor: Colors.black,
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              title: const Text(
                "All Off",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              value: allOff,
              onChanged: (value) {
                setState(() {
                  allOff = value;
                  allOn = !value;
                });
              },
              activeColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
