import 'package:flutter/foundation.dart';

class OtpProvider extends ChangeNotifier {
  late String countryCode;
  late String phoneNumber;

  void setCountryCode(String code) {
    countryCode = code;
    notifyListeners();
  }

  void setPhoneNumber(String number) {
    phoneNumber = number;
    notifyListeners();
  }

  bool validate() {
    if (phoneNumber.isEmpty || countryCode.isEmpty) {
      return true;
    }
    return false;
  }
}
