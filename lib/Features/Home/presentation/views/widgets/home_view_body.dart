import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'best_seller_text.dart';
import 'custom_app_bar.dart';
import 'list_of_best_seller.dart';
import 'list_of_books.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                ListOfBooks(),
                BestSellerText(),
              ],
            ),
          ),
          SliverFillRemaining(
            child: ListOfBestSeller(),
          ),
        ],
      ),
    );
  }
}
