import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:dating_app/routes/Routes.dart'; // Your routes file
import 'package:dating_app/themesfolder/theme.dart'; // Your theme file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.themeData, // Use your custom theme
      initialRoute: '/', // Set the initial route
      getPages: AppRoutes.routes, // Use GetX's route system
    );
  }
}