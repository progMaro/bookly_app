import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:new_bookly_app/Features/Home/presentation/views/widgets/you_can_also_like_text.dart';
import 'books_action.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_details_data.dart';
import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBookDetailsAppBar(),
                CustomBookDetailsData(
                  book: bookModel,
                ),
                const BooksAction(),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const YouCanAlsoLikeText(),
                const SizedBox(
                  height: 16,
                ),
                const SimilarBooksListView(),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
