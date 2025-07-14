import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:new_bookly_app/Features/Home/presentation/manager/list_of_books_cubit/list_of_books_cubit.dart';
import 'package:new_bookly_app/Features/Home/presentation/views/widgets/custom_error_widget.dart';
import 'package:new_bookly_app/core/utils/app_router.dart';

import 'custom_books.dart';

class ListOfBooks extends StatelessWidget {
  const ListOfBooks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListOfBooksCubit, ListOfBooksState>(
      builder: (context, state) {
        if (state is ListOfBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.separated(
              separatorBuilder: (index, context) => const SizedBox(
                width: 15.8,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kBookDetailsView,
                      extra: state.books[index]);
                },
                child: CustomBookImage(
                  imgUrl:
                      state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                ),
              ),
            ),
          );
        } else if (state is ListOfBooksFaliure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
