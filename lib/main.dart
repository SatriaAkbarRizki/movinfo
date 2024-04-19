import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movinfo/bloc/profile/profile_bloc.dart';
import 'package:movinfo/cubit/expanded_cubit.dart';
import 'package:movinfo/cubit/navigation_cubit.dart';
import 'package:movinfo/cubit/theme_cubit.dart';
import 'package:movinfo/navigation/navbar.dart';
import 'package:movinfo/screens/category.dart';
import 'package:movinfo/screens/detail.dart';
import 'package:movinfo/screens/profile.dart';
import 'package:movinfo/theme/mytheme.dart';
import 'bloc/movie/movie_bloc.dart';

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
        ),BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => ExpandedCubit(),
        ),
        BlocProvider(
          create: (context) => NavBarCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: _route,
            themeMode: state == true ? ThemeMode.dark : ThemeMode.light,
            theme: MyTheme().lightTheme,
            darkTheme: MyTheme().darkTheme,
            debugShowCheckedModeBanner: false,
          );
        },
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
    ),
    GoRoute(
      path: ProfileScreens.routeName,
      builder: (context, state) => const ProfileScreens(),
    )
  ]);
}
