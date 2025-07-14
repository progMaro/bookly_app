import 'package:flutter/material.dart';
import 'package:new_bookly_app/core/utils/styles.dart';

class YouCanAlsoLikeText extends StatelessWidget {
  const YouCanAlsoLikeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'You can also like',
        textAlign: TextAlign.start,
        style: Styles.textStyle14.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
