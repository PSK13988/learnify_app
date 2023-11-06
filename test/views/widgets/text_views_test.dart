import 'package:flutter/material.dart';
import 'package:learnify_app/views/widgets/app_bar_text.dart';
import 'package:learnify_app/views/widgets/app_widgets.dart';

import '../../root_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const text = 'Custom Text';

  final textWidget = find.byWidgetPredicate(
    (widget) =>
        widget is Text &&
        widget.style?.fontWeight == FontWeight.normal &&
        widget.style?.color == Colors.grey &&
        widget.style?.fontSize == 12 &&
        widget.style?.fontFamily == 'Montserrat' &&
        widget.textAlign == TextAlign.center,
    description: text,
  );

  testWidgets('AppBarText smoke test and verification',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const RootWidget(
        widget: TextViews(
          title: text,
        ),
      ),
    );
    await tester.pump();
    expect(find.text(text), findsOneWidget);
    expect(textWidget, findsOneWidget);
  });
}
