import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bookly_app/Features/Home/presentation/manager/list_of_best_seller/list_of_best_seller_books_cubit.dart';
import 'package:new_bookly_app/Features/Home/presentation/views/widgets/custom_error_widget.dart';
import 'best_seller_item.dart';

class ListOfBestSeller extends StatelessWidget {
  const ListOfBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListOfBestSellerBooksCubit, ListOfBestSellerBooksState>(
      builder: (context, state) {
        if (state is ListOfBestSellerBooksSuccess) {
          return Expanded(
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => BookListViewItem(
                      bookModel: state.books[index],
                    ),
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: state.books.length),
          );
        } else if (state is ListOfBestSellerBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
