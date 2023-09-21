import 'package:flutter/material.dart';
import 'package:learnify_app/core/constants/app_styles.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: Styles.titleStyle,
      );
}
