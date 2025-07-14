import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:new_bookly_app/Features/Home/data/models/book_model/book_model.dart';
import 'package:new_bookly_app/Features/Home/data/repos/home_repo_implementation.dart';
import 'package:new_bookly_app/Features/Home/presentation/manager/similar_books_list_view/similar_books_list_view_cubit.dart';
import 'package:new_bookly_app/Features/Home/presentation/views/book_details_view.dart';
import 'package:new_bookly_app/Features/Home/presentation/views/home_view.dart';
import 'package:new_bookly_app/Features/Search/Presentation/views/serach_view.dart';
import 'package:new_bookly_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:new_bookly_app/core/utils/service_locator.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static const kSplashView = '/';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
