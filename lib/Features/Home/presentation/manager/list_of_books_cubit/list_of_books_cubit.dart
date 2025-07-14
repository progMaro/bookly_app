import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_bookly_app/Features/Home/data/repos/home_repo.dart';

import '../../../data/models/book_model/book_model.dart';

part 'list_of_books_state.dart';

class ListOfBooksCubit extends Cubit<ListOfBooksState> {
  ListOfBooksCubit(this.homeRepo) : super(ListOfBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchListOfBooks() async {
    emit(ListOfBooksLoading());
    var result = await homeRepo.fetchListOfBooks();

    result.fold((faliure) {
      emit(ListOfBooksFaliure(faliure.errMessage));
    }, (books) {
      emit(ListOfBooksSuccess(books));
    });
  }
}
