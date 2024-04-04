import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movinfo/widget/listmovie.dart';
import 'package:movinfo/widget/button_moremovie.dart';
import 'package:movinfo/widget/titlecategory.dart';
import 'package:movinfo/widget/topmovie.dart';

import '../bloc/movie/movie_bloc.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  void initState() {
    context.read<MovieBloc>().add(OnFetchAllCategory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("REBUILD WIDGET ON HOME");
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            forceMaterialTransparency: true,
            title: Text(
              'MOVINFO',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(10),
                child: CircleAvatar(),
              )
            ],
          )
        ],
        body: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieLoaded) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const TitleCategory(title: 'Top Movie'),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.moviesTop?.length,
                      itemBuilder: (context, index) {
                        return TopMovieWidget(
                          movie: state.moviesTop![index],
                        );
                      },
                    ),
                  ),
                  ButtonMoreMovie(title: 'Top Movie', movies: state.moviesTop!),
                  const TitleCategory(title: 'Popular Movie'),
                  ListMovieWidget(
                    movies: state.moviesPopular!,
                  ),
                  ButtonMoreMovie(
                      title: 'Popular Movie', movies: state.moviesPopular!),
                  const TitleCategory(title: 'Coming Soon..'),
                  ListMovieWidget(
                    movies: state.moviesUpComing!,
                  ),
                  ButtonMoreMovie(
                      title: 'Coming Soon', movies: state.moviesUpComing!),
                  const SizedBox(
                    height: 10,
                  )
                  
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
