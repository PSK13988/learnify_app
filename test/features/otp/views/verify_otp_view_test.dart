import 'package:flutter/material.dart';
import 'package:learnify_app/core/constants/assets_constants.dart';
import 'package:learnify_app/features/otp/providers/otp_provider.dart';
import 'package:learnify_app/features/otp/views/verify_otp_view.dart';
import 'package:learnify_app/views/widgets/app_widgets.dart';
import 'package:provider/provider.dart';

import '../../../root_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const text = 'Custom Text';

  final textWidget = find.byWidgetPredicate(
    (widget) =>
        widget is Text &&
        widget.style?.fontWeight == FontWeight.bold &&
        widget.style?.color == Colors.black54 &&
        widget.style?.fontSize == 16 &&
        widget.style?.fontFamily == 'Montserrat',
    description: text,
  );

  final phoneTextWidget = find.byWidgetPredicate(
    (widget) =>
        widget is Text &&
        widget.style?.fontWeight == FontWeight.bold &&
        widget.style?.color == Colors.black87 &&
        widget.style?.fontSize == 20 &&
        widget.style?.fontFamily == 'Montserrat',
    description: text,
  );

  testWidgets('VerifyOtpView smoke test and verification',
      (WidgetTester tester) async {
    await tester.pumpWidget(RootWidget(
      widget: ChangeNotifierProvider(
          create: (_) => OtpProvider()
            ..phoneNumber = ''
            ..countryCode = '',
          child: const VerifyOtpView()),
    ));
    await tester.pump();
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text(AppConstants.verifyOtpTitle), findsOneWidget);
    expect(find.text(AppConstants.otpSendTo), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(4));
    expect(textWidget, findsOneWidget);
    expect(phoneTextWidget, findsOneWidget);
    await tester.tap(find.byType(RoundedRedButton));
    await tester.pump();
  });
}
