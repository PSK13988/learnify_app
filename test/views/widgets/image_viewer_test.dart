import 'package:flutter/material.dart';
import 'package:learnify_app/core/constants/assets_constants.dart';
import 'package:learnify_app/views/widgets/app_widgets.dart';

import '../../root_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ImageViewer smoke test and verification',
      (WidgetTester tester) async {
    await tester.pumpWidget(const RootWidget(
      widget: ImageViewer(imagePath: Assets.users),
    ));
    await tester.pump();
    expect(find.byType(ImageViewer), findsOneWidget);
  });
}
