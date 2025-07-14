import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_bookly_app/Features/Home/data/repos/api_service.dart';
import 'package:new_bookly_app/Features/Home/data/repos/home_repo_implementation.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
