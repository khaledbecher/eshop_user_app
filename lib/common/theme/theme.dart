import 'package:eshop/common/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
        primary: ThemeColors.kMainColor,
        // Customize your primary color
        secondary: ThemeColors.kLightGrey,
        tertiary: ThemeColors.kVeryLightGrey,
        onSecondaryFixed: ThemeColors.kGrey,
        onError: ThemeColors.kWhite,
        error: ThemeColors.kDarkRed,
        // Customize error color
        onTertiaryFixed: ThemeColors.kRed,
        onTertiary: ThemeColors.kPink,
        surface: ThemeColors.kWhite),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.dmSans(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: ThemeColors.kTextColor),
      headlineMedium: GoogleFonts.dmSans(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: ThemeColors.kTextColor),
      headlineSmall: GoogleFonts.dmSans(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: ThemeColors.kTextColor),
      titleLarge: GoogleFonts.dmSans(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: ThemeColors.kTextColor),
      titleMedium: GoogleFonts.dmSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: ThemeColors.kTextColor),
      titleSmall: GoogleFonts.dmSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: ThemeColors.kTextColor),
      bodyLarge: GoogleFonts.dmSans(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: ThemeColors.kTextColor),
      bodyMedium: GoogleFonts.dmSans(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: ThemeColors.kTextColor),
      bodySmall: GoogleFonts.dmSans(
          fontSize: 13,
          fontWeight: FontWeight.w300,
          color: ThemeColors.kTextColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ThemeColors.kWhite,
      selectedItemColor: ThemeColors.kBlack,
      unselectedItemColor: ThemeColors.kGrey,
      showUnselectedLabels: true,
    ),
    scaffoldBackgroundColor: ThemeColors.kWhite,
    appBarTheme: AppBarTheme(backgroundColor: ThemeColors.kWhite)
  );
  static final ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
        primary: ThemeColors.kWhite,
        secondary: ThemeColors.kDarkGrey,
        tertiary: ThemeColors.kVeryDarkGrey,
        onSecondaryFixed: ThemeColors.kGrey,
        onError: ThemeColors.kBlack,
        error: ThemeColors.kDarkRed,
        // Customize error color
        onTertiaryFixed: ThemeColors.kRed,
        onTertiary: ThemeColors.kPink,
        surface: ThemeColors.kDarkBackground),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.dmSans(
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: ThemeColors.kLightTextColor, // Lighter text color
      ),
      headlineMedium: GoogleFonts.dmSans(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: ThemeColors.kLightTextColor,
      ),
      headlineSmall: GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: ThemeColors.kLightTextColor,
      ),
      titleLarge: GoogleFonts.dmSans(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ThemeColors.kLightTextColor,
      ),
      titleMedium: GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ThemeColors.kLightTextColor,
      ),
      titleSmall: GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ThemeColors.kLightTextColor,
      ),
      bodyLarge: GoogleFonts.dmSans(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: ThemeColors.kLightTextColor,
      ),
      bodyMedium: GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: ThemeColors.kLightTextColor,
      ),
      bodySmall: GoogleFonts.dmSans(
        fontSize: 13,
        fontWeight: FontWeight.w300,
        color: ThemeColors.kLightTextColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ThemeColors.kBlack,
      selectedItemColor: ThemeColors.kWhite,
      unselectedItemColor: ThemeColors.kDarkGrey,
      showUnselectedLabels: true,
    ),
    scaffoldBackgroundColor:  ThemeColors.kDarkBackground,
    appBarTheme: AppBarTheme(backgroundColor: ThemeColors.kDarkBackground)
  );
}
