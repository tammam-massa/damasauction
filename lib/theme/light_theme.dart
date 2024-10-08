import 'package:flutter/material.dart';

// Consider using a color scheme for consistency and accessibility
final ColorScheme lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blueAccent, // Adjust to your desired primary color
  brightness: Brightness.light,
  primary: Colors.white, // Use lighter shades for other colors
  secondary: Colors.blue[300], // Consider a slightly darker secondary
  background: Colors.white,
  surface: Colors.white,
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: lightColorScheme, // Use the defined color scheme
  textTheme: const TextTheme(
    bodyMedium:
        TextStyle(color: Colors.black), // Set text color for good contrast
  ),
  appBarTheme: AppBarTheme(
    color: lightColorScheme.primary, // Consistent with color scheme
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: lightColorScheme.secondary, // Consistent with color scheme
  ),
);
