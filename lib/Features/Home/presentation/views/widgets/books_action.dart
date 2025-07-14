import 'package:flutter/material.dart';
import 'package:new_bookly_app/constants.dart';
import 'package:new_bookly_app/core/utils/styles.dart';
import 'package:new_bookly_app/core/widgets/action_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButon(
              textStyle: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              text: '19.99€',
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButon(
              textStyle: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontFamily: kGilroy),
              text: 'Free preview',
              backgroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
