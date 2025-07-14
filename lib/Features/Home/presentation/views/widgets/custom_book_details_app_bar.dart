import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_bookly_app/core/utils/app_router.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 25,
        top: 10,
        left: 30,
        right: 30,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop(AppRouter.kHomeView);
            },
            icon: const Icon(
              Icons.close_outlined,
              size: 31,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
