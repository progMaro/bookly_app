import 'package:flutter/material.dart';
import 'package:new_bookly_app/core/utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      errMessage,
      style: Styles.textStyle18,
      textAlign: TextAlign.center,
    );
  }
}
