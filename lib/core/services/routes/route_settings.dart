import 'package:flutter/material.dart';
import 'package:learnify_app/features/otp/views/get_otp_view.dart';
import 'package:learnify_app/features/otp/views/verify_otp_view.dart';
import 'package:learnify_app/views/widgets/error_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) =>
    switch (settings.name) {
      GetOtpView.routeName => MaterialPageRoute(
          builder: (_) => const GetOtpView(),
        ),
      VerifyOtpView.routeName => MaterialPageRoute(
          builder: (_) => const VerifyOtpView(),
        ),
      _ => MaterialPageRoute(
          builder: (_) => const ErrorView(),
        ),
    };
