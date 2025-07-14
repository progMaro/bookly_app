import 'package:flutter/material.dart';
import 'package:new_bookly_app/Features/Search/Presentation/views/widgets/list_of_search_result.dart';
import 'package:new_bookly_app/core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomSearchTextField(),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Results',
                        style: Styles.textStyle18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: ListOfSearchResult(),
            ),
          ],
        ),
      ),
    );
  }
}
