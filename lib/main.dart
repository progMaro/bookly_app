import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_bookly_app/Features/Home/data/repos/home_repo_implementation.dart';
import 'package:new_bookly_app/Features/Home/presentation/manager/list_of_best_seller/list_of_best_seller_books_cubit.dart';
import 'package:new_bookly_app/Features/Home/presentation/manager/list_of_books_cubit/list_of_books_cubit.dart';
import 'package:new_bookly_app/constants.dart';
import 'package:new_bookly_app/core/utils/app_router.dart';
import 'package:new_bookly_app/core/utils/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ListOfBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchListOfBooks(),
        ),
        BlocProvider(
          create: (context) => ListOfBestSellerBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchBestSellerBooks(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
