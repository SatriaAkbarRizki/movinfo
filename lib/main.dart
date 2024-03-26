import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movinfo/cubit/expanded_cubit.dart';
import 'package:movinfo/cubit/navigation_cubit.dart';
import 'package:movinfo/navigation/navbar.dart';
import 'package:movinfo/screens/category_screen.dart';
import 'package:movinfo/screens/detail_screen.dart';

import 'package:movinfo/screens/home.dart';
import 'package:movinfo/screens/search_screen.dart';
import 'package:movinfo/theme/mytheme.dart';

import 'bloc/movie/movie_bloc.dart';
import 'model/movie.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieBloc(),
        ),
        BlocProvider(
          create: (context) => ExpandedCubit(),
        ),
        BlocProvider(
          create: (context) => NavBarCubit(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: _route,
        theme: MyTheme().lightTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  final GoRouter _route = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => NavBarMovie(),
    ),
    GoRoute(
      path: CategoryScreen.routeName,
      builder: (context, state) =>
          CategoryScreen(data: state.extra as Map<String, dynamic>),
    ),
    GoRoute(
      path: DetailScreen.routName,
      builder: (context, state) =>
          DetailScreen(data: state.extra as Map<String, dynamic>),
    )
  ]);
}
