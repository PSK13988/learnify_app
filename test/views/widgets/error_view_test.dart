import 'package:flutter/material.dart';
import 'package:learnify_app/views/widgets/app_widgets.dart';

import '../../root_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ErrorView smoke test and verification',
      (WidgetTester tester) async {
    await tester.pumpWidget(const RootWidget(
      widget: ErrorView(),
    ));
    await tester.pump();
    expect(find.text('Error Occurred'), findsOneWidget);
    expect(find.text('Error Occurred please retry'), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
  });
}
