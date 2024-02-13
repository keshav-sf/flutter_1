import 'localization.dart';

class LocalizationEN implements Localization {
  @override
  String get appName => "Flutter Boilerplate";

  @override
  String get ok => "OK";

  @override
  String get cancel => "Cancel";

  @override
  String get alertPermissionNotRestricted =>
      "Please grant permission from settings to access this feature";

  @override
  String get internetNotConnected =>
      "No internet connection. Please check your internet connection";

  @override
  String get poorInternetConnection =>
      "Poor internet connection. Please check your internet connection";

  @override
  String get delete => "Delete";

  @override
  String get edit => "Edit";

  @override
  String get done => "Done";

  @override
  String get cameraTitle => "Camera";

  @override
  String get galleryTitle => "Gallery";

  @override
  String get no => "No";

  @override
  String get yes => "Yes";

  @override
  String get logout => "Logout";

  @override
  String get save => "Save";

  @override
  String get search => "Search";

  // Auth Strings
  @override
  String get fullname => "Full Name";

  @override
  String get email => "Email";

  @override
  String get password => "Password";

  @override
  String get confirmPassword => "Confirm Password";

  @override
  String get msgFullNameEmpty => "Full Name is empty";

  @override
  String get msgFullNameInvalid => "Full Name is not valid";

  @override
  String get msgEmailEmpty => "Email is empty";

  @override
  String get msgEmailInvalid => "Email is not valid";

  @override
  String get msgPasswordEmpty => "Password is empty";

  @override
  String get msgConfirmPasswordEmpty => "Confirm Password is empty";

  @override
  String get msgPasswordNotMatch => "Password doesn't match";

  @override
  String get msgPasswordError =>
      "Password should be atleast 8 characters long and have atleast one uppercase, one alphanumeric and one number.";

  @override
  String get tradeName => "Trade Name";

  @override
  String get msgTradeNameEmpty => "Trade is empty";

  @override
  String get msgTradeNameInvalid => "Trade is not valid";

  @override
  String get cr => "CR";

  @override
  String get msgCREmpty => "CR is empty";

  @override
  String get msgCRInvalid => "CR is not valid";

  @override
  String get city => "City";

  @override
  String get msgCityEmpty => "City is empty";

  @override
  String get msgCityInvalid => "City is not valid";

  @override
  String get vat => "VAT";

  @override
  String get msgVATEmpty => "VAT is empty";

  @override
  String get msgVATInvalid => "VAT is not valid";
}
