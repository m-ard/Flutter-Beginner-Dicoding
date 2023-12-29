import 'package:flutter/material.dart';
import 'package:submission_idcamp/components/theme/color.dart';

class CustomTheme {
  static ThemeData get lightTheme => ThemeData.light().copyWith(
      primaryColor: CustomColor.primaryColor,
      scaffoldBackgroundColor: CustomColor.backgroundColor,
      appBarTheme: const AppBarTheme(backgroundColor: CustomColor.primaryColor),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontFamily: "Poppins",
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            fontFamily: "Poppins",
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w600),
        bodySmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 12,
          color: Colors.black,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.grey, size: 30));
}
