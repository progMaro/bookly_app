import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_bookly_app/Features/Home/data/repos/home_repo.dart';

import '../../../data/models/book_model/book_model.dart';

part 'list_of_best_seller_books_state.dart';

class ListOfBestSellerBooksCubit extends Cubit<ListOfBestSellerBooksState> {
  ListOfBestSellerBooksCubit(this.homeRepo)
      : super(ListOfBestSellerBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchBestSellerBooks() async {
    emit(ListOfBestSellerBooksLoading());
    var result = await homeRepo.fetchBestSellerBooks();
    result.fold((faliure) {
      emit(ListOfBestSellerBooksFailure(faliure.errMessage));
    }, (books) {
      emit(ListOfBestSellerBooksSuccess(books));
    });
  }
}
