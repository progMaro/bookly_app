import 'package:flutter/material.dart';
import 'package:new_bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:new_bookly_app/constants.dart';
import 'package:new_bookly_app/core/utils/styles.dart';

import 'books_rating.dart';
import 'custom_books.dart';

class CustomBookDetailsData extends StatelessWidget {
  const CustomBookDetailsData({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .26,
          ),
          child: CustomBookImage(
              imgUrl: book.volumeInfo.imageLinks?.thumbnail ?? ''),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 43, bottom: 37),
          child: Column(
            children: [
              Text(
                book.volumeInfo.title!,
                textAlign: TextAlign.center,
                style: Styles.textStyle30.copyWith(
                    fontWeight: FontWeight.normal, fontFamily: kGtSectraFine),
              ),
              Opacity(
                opacity: .7,
                child: Text(
                  book.volumeInfo.authors![0],
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const BookRating(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
