import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:new_bookly_app/Features/Home/presentation/views/widgets/books_rating.dart';
import 'package:new_bookly_app/Features/Home/presentation/views/widgets/custom_books.dart';
import 'package:new_bookly_app/constants.dart';
import 'package:new_bookly_app/core/utils/app_router.dart';
import 'package:new_bookly_app/core/utils/styles.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.16,
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: CustomBookImage(
                  imgUrl: bookModel.volumeInfo.imageLinks?.smallThumbnail ?? '',
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        bookModel.volumeInfo.title!,
                        maxLines: 2,
                        style: Styles.textStyle20.copyWith(
                            fontFamily: kGtSectraFine,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Opacity(
                      opacity: .7,
                      child: Text(
                        bookModel.volumeInfo.authors![0],
                        style: Styles.textStyle14,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        const BookRating(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
