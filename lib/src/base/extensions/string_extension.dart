import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/app_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/localization/localization.dart';
import '../utils/constants/color_constant.dart';

extension StringExtension on String {
  String getInitials() => isNotEmpty
      ? trim().split(' ').map((e) => e[0]).take(2).join().toUpperCase()
      : '';

  Color hexToColor() =>
      isEmpty ? secondaryColor : Color(int.parse(replaceAll('#', "0xff")));

  bool _stringValidation(String value) {
    return RegExp(validStringRegex).hasMatch(value);
  }

  // Check String Validation
  String? isValidFullName() {
    if (trim().isEmpty) {
      return Localization.of().msgFullNameEmpty;
    } else if (!_stringValidation(trim())) {
      return Localization.of().msgFullNameInvalid;
    } else {
      return null;
    }
  }

  // Check Email Validation
  bool _emailValidation(String value) {
    return RegExp(validEmailRegex).hasMatch(value);
  }

  // Check Email Validation
  String? isValidEmail() {
    if (trim().isEmpty) {
      return Localization.of().msgEmailEmpty;
    } else if (!_emailValidation(trim())) {
      return Localization.of().msgEmailInvalid;
    } else {
      return null;
    }
  }

  // Empty Field Validation
  String? isFieldEmpty(String message) {
    if (trim().isEmpty) {
      return message;
    } else {
      return null;
    }
  }

  bool _passwordValidation(String value) {
    return RegExp(validPasswordRegex).hasMatch(value);
  }

  // Check Password Validation
  String? isValidPassword() {
    if (trim().isEmpty) {
      return Localization.of().msgPasswordEmpty;
    } else if (!_passwordValidation(trim())) {
      return Localization.of().msgPasswordError;
    } else {
      return null;
    }
  }

  // Check Valid Confirm Password
  String? isValidConfirmPassword(String newPassword) {
    if (trim().isEmpty) {
      return Localization.of().msgConfirmPasswordEmpty;
    } else if (newPassword.trim() != trim()) {
      return Localization.of().msgPasswordNotMatch;
    } else {
      return null;
    }
  }

  // Check String Validation
  String? isValidtradeName() {
    if (trim().isEmpty) {
      return Localization.of().msgTradeNameEmpty;
    } else if (!_stringValidation(trim())) {
      return Localization.of().msgTradeNameInvalid;
    } else {
      return null;
    }
  }

  // Check String Validation
  String? isValidCR() {
    if (trim().isEmpty) {
      return Localization.of().msgCREmpty;
    } else if (!_stringValidation(trim())) {
      return Localization.of().msgCRInvalid;
    } else {
      return null;
    }
  }

  // Check String Validation
  String? isValidCity() {
    if (trim().isEmpty) {
      return Localization.of().msgCityEmpty;
    } else if (!_stringValidation(trim())) {
      return Localization.of().msgCityInvalid;
    } else {
      return null;
    }
  }

  // Check String Validation
  String? isValidVAT() {
    if (trim().isEmpty) {
      return Localization.of().msgVATEmpty;
    } else if (!_stringValidation(trim())) {
      return Localization.of().msgVATInvalid;
    } else {
      return null;
    }
  }
}

extension ColorExtension on Color {
  String colorToHex() => "#${value.toRadixString(16).substring(2)}";
}
