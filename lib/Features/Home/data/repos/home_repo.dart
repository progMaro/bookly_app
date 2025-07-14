import 'package:dartz/dartz.dart';
import 'package:new_bookly_app/core/errors/failures.dart';

import '../models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Faliure, List<BookModel>>> fetchBestSellerBooks();
  Future<Either<Faliure, List<BookModel>>> fetchListOfBooks();
  Future<Either<Faliure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
