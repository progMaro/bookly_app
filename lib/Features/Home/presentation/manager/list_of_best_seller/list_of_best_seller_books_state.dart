part of 'list_of_best_seller_books_cubit.dart';

sealed class ListOfBestSellerBooksState extends Equatable {
  const ListOfBestSellerBooksState();

  @override
  List<Object> get props => [];
}

final class ListOfBestSellerBooksInitial extends ListOfBestSellerBooksState {}

final class ListOfBestSellerBooksLoading extends ListOfBestSellerBooksState {}

final class ListOfBestSellerBooksFailure extends ListOfBestSellerBooksState {
  final String errMessage;

  const ListOfBestSellerBooksFailure(this.errMessage);
}

final class ListOfBestSellerBooksSuccess extends ListOfBestSellerBooksState {
  final List<BookModel> books;

  const ListOfBestSellerBooksSuccess(this.books);
}
