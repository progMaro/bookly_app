import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:new_bookly_app/Features/Home/data/repos/home_repo.dart';

part 'similar_books_list_view_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((faliure) {
      emit(SimilarBooksFaliure(faliure.errMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
