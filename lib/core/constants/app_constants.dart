import 'package:flutter/material.dart';

class AppConstants {
  const AppConstants._();

  // titles
  static const getOtpTitle = 'Log in';
  static const verifyOtpTitle = 'OTP Verify';

  // Action texts
  static const btnGetOtp = 'Get OTP';
  static const btnVerifyOtp = 'Verify OTP';

  //String
  static const termAndCondition =
      'By signing up, you agree with our Terms and conditions';
  static const otpMessage = 'Otp sending in Progress, please check your mobile';
  static const otpSendTo = 'OTP sent to';

  // Messages
  static const phoneNumberRequired = 'Phone Number required';
  static const dataSubmitted = 'Your details has been submitted';
}

class Paddings {
  const Paddings._();

  static const all_20 = EdgeInsets.all(20.0);
  static const all_22 = EdgeInsets.all(22.0);
  static const from_0_16_8_16 = EdgeInsets.fromLTRB(0, 16, 8, 16);
}
