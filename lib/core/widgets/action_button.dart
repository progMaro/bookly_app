import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  const CustomButon({
    super.key,
    this.backgroundColor = Colors.white,
    this.borderRadius,
    required this.text,
    required this.textStyle,
  });
  final Color backgroundColor;
  final BorderRadius? borderRadius;
  final String text;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: () {},
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
