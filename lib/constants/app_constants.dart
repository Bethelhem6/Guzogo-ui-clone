import 'package:flutter/material.dart';

class AppConstants {
  // Fonts
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  // Colors
  static const Color primaryColor = Color(0xFF1C1D59);
  static const Color secondaryColor = Color(0xFFF1DE3E);
  static const Color primaryColorVeryLight = Color.fromARGB(255, 61, 67, 121);
  static const Color black = Color(0xFF171D29);
  static const Color textGrey = Color(0xFF919191);
  static const Color iconGrey = Color(0xFF8F8E94);
  static const Color grey100 = Color(0xFFFAFAFA);
  static const Color grey200 = Color(0xFFF5F5F5);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF424242);
  static const Color backgroundColor = Color(0xFFFAFAFA);

  // Margins
  static const double smallMargin = 10.0;
  static const double mediumMargin = 16.0;
  static const double largeMargin = 24.0;
  // Font
  static const double smallFont = 12.0;
  static const double mediumFont = 16.0;
  static const double largeFont = 24.0;

  // Paddings
  static const EdgeInsets smallPadding = EdgeInsets.all(8.0);
  static const EdgeInsets mediumPadding = EdgeInsets.all(16.0);
  static const EdgeInsets largePadding = EdgeInsets.all(24.0);

  // Label Styles
  static const TextStyle labelTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // Button Styles
  static ButtonStyle primaryButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    ),
    textStyle: MaterialStateProperty.all<TextStyle>(
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );
}
