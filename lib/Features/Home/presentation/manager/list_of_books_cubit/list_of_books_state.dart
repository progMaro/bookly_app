part of 'list_of_books_cubit.dart';

sealed class ListOfBooksState extends Equatable {
  const ListOfBooksState();

  @override
  List<Object> get props => [];
}

final class ListOfBooksInitial extends ListOfBooksState {}

final class ListOfBooksLoading extends ListOfBooksState {}

final class ListOfBooksFaliure extends ListOfBooksState {
  final String errMessage;

  const ListOfBooksFaliure(this.errMessage);
}

final class ListOfBooksSuccess extends ListOfBooksState {
  final List<BookModel> books;

  const ListOfBooksSuccess(this.books);
}
