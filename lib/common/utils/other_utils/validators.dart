import 'package:eshop/common/utils/other_utils/usefull_functions.dart';

class Validators {
  /// Validates if the provided email has a proper format.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // Trim trailing spaces
    final trimmedValue = value.trim();
    const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    if (!RegExp(emailRegex).hasMatch(trimmedValue)) {
      return 'Enter a valid email address';
    }
    return null; // Email is valid
  }

  /// Validates if the provided password meets the strength requirements.
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 8) {
      return 'At least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'At least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'At least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'At least one number';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'At least one special character';
    }
    return null; // Password is valid
  }

  /// Validates if the provided username meets the requirements.
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username cannot be empty';
    }
    // Trim trailing spaces
    final trimmedValue = value.trim();
    if (trimmedValue.length < 3) {
      return 'Username must be at least 3 characters long';
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(trimmedValue)) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    return null; // Username is valid
  }

  static String? validateDateOfBirth(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your date of birth';
    }
    // Regular expression to match the DD.MM.YYYY format
    final regex = RegExp(r'^\d{2}\.\d{2}\.\d{4}$');
    if (!regex.hasMatch(value)) {
      return 'Use DD.MM.YYYY';
    }
    // Convert string to DateTime
    final date = stringToDate(value);
    if (date == null) {
      return 'Invalid date';
    }
    // Split the date
    final parts = value.split('.');
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);

    // Check the number of days in the month
    final maxDaysInMonth =
        DateTime(year, month + 1, 0).day; // Handles leap years
    if (day > maxDaysInMonth) {
      return 'Invalid day for the given month';
    }
    // Check if the date is in the future
    if (date.isAfter(DateTime.now())) {
      return 'Date of birth cannot be in the future';
    }
    return null; // Date of birth is valid
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    // Regular expression to match a valid phone number
    final regex = RegExp(r'^\+?[0-9 ]{8,15}$');
    // Allows optional "+" at the start and requires 8-15 digits

    if (!regex.hasMatch(value)) {
      return 'Invalid phone number.';
    }

    return null; // Phone number is valid
  }
}
