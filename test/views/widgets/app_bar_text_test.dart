import 'package:flutter/material.dart';
import 'package:learnify_app/views/widgets/app_bar_text.dart';

import '../../root_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const text = 'Custom Text';

  final appBarText = find.byWidgetPredicate(
    (widget) =>
        widget is Text &&
        widget.style?.fontWeight == FontWeight.w900 &&
        widget.style?.color == Colors.black87 &&
        widget.style?.fontSize == 24 &&
        widget.style?.fontFamily == 'Montserrat',
    description: text,
  );

  testWidgets('AppBarText smoke test and verification',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const RootWidget(
        widget: AppBarText(
          title: text,
        ),
      ),
    );
    await tester.pump();
    expect(find.text(text), findsOneWidget);
    expect(appBarText, findsOneWidget);
  });
}
