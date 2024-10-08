import 'package:flutter/material.dart';

// Consider using a color scheme for consistency and accessibility
final ColorScheme darkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.redAccent, // Adjust to your desired primary color
  brightness: Brightness.dark,
  primary: Colors.black, // Use appropriate shades for other colors
  secondary: Colors.red[300], // Consider lighter secondary
  background: Colors.black26, // Slightly lighter background
  surface: Colors.black,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: darkColorScheme, // Use the defined color scheme
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white), // Adjust text colors
  ),
  appBarTheme: AppBarTheme(
    color: darkColorScheme.primary, // Consistent with color scheme
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: darkColorScheme.secondary, // Consistent with color scheme
  ),
  // Explore other theme properties for customization (e.g., toggleable icons)
);
