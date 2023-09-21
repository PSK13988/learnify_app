import 'package:flutter/material.dart';
import 'package:learnify_app/core/constants/app_styles.dart';

class RoundedRedButton extends StatelessWidget {
  const RoundedRedButton({
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    super.key,
  });

  final VoidCallback onPressed;
  final String title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: const StadiumBorder(),
          minimumSize: const Size.fromHeight(60),
        ),
        child: Text(
          title,
          style: Styles.btnStyle,
        ),
      );
}
