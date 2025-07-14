import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_bookly_app/Features/Home/data/repos/api_service.dart';
import 'package:new_bookly_app/Features/Home/data/repos/home_repo.dart';
import 'package:new_bookly_app/core/errors/failures.dart';

import '../models/book_model/book_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Faliure, List<BookModel>>> fetchBestSellerBooks() async {
    try {
      var data = await apiService.get(endpoint: 'volumes?q=Computer science');
      List<BookModel> books = [];
      for (var items in data['items']) {
        books.add(BookModel.fromJson(items));
      }

      // var items = (data['items'] as List)
      //     .map((data) => BookModel.fromJson(data))
      //     .toList();

      // Return the list of books
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFaliure.fromDioError(e),
        );
      }
      return left(
        ServerFaliure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Faliure, List<BookModel>>> fetchListOfBooks() async {
    try {
      var data =
          await apiService.get(endpoint: 'volumes?q=subject:programming');
      // Ensure the response is a Map and extract the 'items' key, which contains the list of books
      List<BookModel> books = [];
      for (var items in data['items']) {
        books.add(BookModel.fromJson(items));
      }

      // var items = (data['items'] as List)
      //     .map((data) => BookModel.fromJson(data))
      //     .toList();

      // Return the list of books
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFaliure.fromDioError(e),
        );
      }
      return left(
        ServerFaliure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Faliure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
        endpoint: 'volumes?sorting=relevance&q=subject:programming',
      );
      // msh fahem el satr da
      List<BookModel> books = [];
      for (var items in data['items']) {
        books.add(BookModel.fromJson(items));
      }

      // var items = (data['items'] as List)
      //     .map((data) => BookModel.fromJson(data))
      //     .toList();

      // Return the list of books
      return Right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(
          ServerFaliure.fromDioError(e),
        );
      }

      return left(
        ServerFaliure(
          e.toString(),
        ),
      );
    }
  }
}
