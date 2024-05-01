import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movinfo/bloc/profile/profile_bloc.dart';
import 'package:movinfo/widget/listmovie.dart';
import 'package:movinfo/widget/button_moremovie.dart';
import 'package:movinfo/widget/listmovie_random.dart';
import 'package:movinfo/widget/nothing_screens.dart';
import 'package:movinfo/widget/profile.dart';
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
            actions: [
              InkWell(
                onTap: () => Future.delayed(
                    const Duration(milliseconds: 500),
                    () => showDialog(
                          useSafeArea: true,
                          context: context,
                          builder: (context) => ProfileSettings(),
                        )),
                child: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileUser) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: state.image != null
                            ? CircleAvatar(
                                backgroundImage: FileImage(state.image!),
                              )
                            : null,
                      );
                    }
                    return const Padding(
                      padding: EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundColor: Color(0xff5d8274),
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
        body: BlocBuilder<MovieBloc, MovieState>(
          buildWhen: (previous, current) {
            log('previous: ${previous} and current: ${current}');
            if (previous is MovieLoading && current is MovieLoaded) {
              return true;
            } else if (previous is MovieLoaded && current is MovieLoaded) {
              return false;
            } else {
              return true;
            }
          },
          builder: (context, state) {
            if (state is MovieLoading) {
              return Center(
                child:
                    Lottie.asset('assets/animations/loading.json', height: 150),
              );
            } else if (state is MovieFailure) {
              return NothingWidget(
                  message: state.message, type: TypeNothing.datanull);
            } else if (state is MovieLoaded) {
              log("REBUILD WIDGET ON LIST MOVIES");
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
                  ),
                  ListMovieRandomWidget(
                      moviesPopular: state.moviesPopular!,
                      moviesTop: state.moviesTop!,
                      moviesUpComing: state.moviesUpComing!)
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
