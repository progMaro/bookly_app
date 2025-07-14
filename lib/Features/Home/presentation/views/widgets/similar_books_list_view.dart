import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bookly_app/Features/Home/presentation/manager/similar_books_list_view/similar_books_list_view_cubit.dart';
import 'package:new_bookly_app/Features/Home/presentation/views/widgets/custom_error_widget.dart';

import 'custom_books.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 12),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.14,
              child: ListView.separated(
                separatorBuilder: (index, context) => const SizedBox(
                  width: 5,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) => CustomBookImage(
                  imgUrl:
                      state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                ),
              ),
            ),
          );
        } else if (state is SimilarBooksFaliure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
