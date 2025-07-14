import 'package:flutter/material.dart';
import 'package:new_bookly_app/core/utils/styles.dart';

class BestSellerText extends StatelessWidget {
  const BestSellerText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 50,
        bottom: 20,
        left: 30,
      ),
      child: Text(
        'Best Seller',
        style: Styles.textStyle18,
      ),
    );
  }
}
