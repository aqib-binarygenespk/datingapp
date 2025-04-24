import 'package:flutter/material.dart';

class AppTheme {
  // Colors based on the Figma design
  static const Color primaryColor = Color(0xFFFFE8E8); // Lighter soft pink (background)
  static const Color actionColor = Color(0xFF4E3B31); // Dark brown color for text (buttons)
  static const Color backgroundColor = Color(0xFFFFF0F0); // Lighter pink background (soft and clean)

  // Text styles based on the Figma design
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32, // Large font size for main headings
      fontWeight: FontWeight.bold,
      color: actionColor, // Dark brown color
    ),
    titleLarge: TextStyle(
      fontSize: 20, // Medium font size for smaller titles
      fontWeight: FontWeight.bold,
      color: actionColor, // Dark brown for titles
    ),
    bodyLarge: TextStyle(
      fontSize: 16, // Regular text size for body content
      color: actionColor, // Action color for text
    ),
    labelLarge: TextStyle(
      fontSize: 18, // Text size for button labels
      fontWeight: FontWeight.bold,
      color: Colors.white, // White for button text to contrast
    ),
    // Text style for input labels (like "Email" and "Password")
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: actionColor, // Dark brown color for input labels
    ),
    // Text style for the placeholder text
    bodySmall: TextStyle(
      fontSize: 14,
      color: Colors.grey, // Grey color for hint text
    ),
  );

  static ThemeData get themeData {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor, // Light pink background for the app
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: actionColor),
        titleTextStyle: TextStyle(
          color: actionColor, // Dark brown color for app bar title
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: textTheme,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white, // White background for input fields
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners for input fields
          borderSide: BorderSide.none,
        ),
        hintStyle: textTheme.bodySmall, // Use bodySmall for hint text style
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, // Text color for buttons
          backgroundColor: actionColor, // Button background color (dark brown)
          textStyle: textTheme.labelLarge, // Button text style
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners for buttons
          ),
        ),
      ),
      cardColor: backgroundColor, // Ensures cards also get the theme background
    );
  }
}
