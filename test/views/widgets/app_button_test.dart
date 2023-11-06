import 'package:flutter/material.dart';
import 'package:learnify_app/views/widgets/app_widgets.dart';

import '../../root_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const title = 'Click Here';

  final textWidget = find.byWidgetPredicate(
    (widget) =>
        widget is Text &&
        widget.style?.fontWeight == FontWeight.bold &&
        widget.style?.color == Colors.white &&
        widget.style?.fontSize == 18 &&
        widget.style?.fontFamily == 'Montserrat',
    description: title,
  );

  testWidgets('RoundedRedButton smoke test and verification',
      (WidgetTester tester) async {
    await tester.pumpWidget(RootWidget(
      widget: RoundedRedButton(
        title: title,
        onPressed: () {},
      ),
    ));
    await tester.pump();
    await tester.tap(find.byType(RoundedRedButton));
    await tester.pump();
    expect(find.text(title), findsOneWidget);
    expect(find.byType(RoundedRedButton), findsOneWidget);
    expect(textWidget, findsOneWidget);
  });
}
