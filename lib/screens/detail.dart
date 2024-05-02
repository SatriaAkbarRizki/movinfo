import 'dart:developer';
// ignore: unnecessary_import
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movinfo/bloc/movie/movie_bloc.dart';
import 'package:movinfo/cubit/expanded_cubit.dart';
import 'package:movinfo/model/movie.dart';
import 'package:movinfo/service/filterData.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  static String routName = '/detail';
  const DetailScreen({super.key, required this.data});

  MovieModel get movies => data['movies'] as MovieModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.4,
            child: Image.network(FilterData.filterUrlImage(movies.posterPath!),
                fit: BoxFit.fill),
          ),
          BlocBuilder<ExpandedCubit, bool>(
            builder: (context, state) {
              return GestureDetector(
                onVerticalDragDown: (details) {
                  state == false
                      ? context.read<ExpandedCubit>().expandedWidget()
                      : context.read<ExpandedCubit>().notExpandedWidget();

                  log(context.read<ExpandedCubit>().state.toString());
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    curve: Curves.decelerate,
                    duration: Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 50)
                        ],
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    height: state == false
                        ? MediaQuery.of(context).size.height / 3.0
                        : MediaQuery.of(context).size.height / 1.5,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: Center(
                            child: Text(
                              movies.title!,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 28,
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.color),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 5, top: 10, bottom: 10),
                              child: SvgPicture.asset(
                                'assets/icons/like.svg',
                                theme: const SvgTheme(currentColor: Colors.red),
                              ),
                            ),
                            Text(
                              movies.popularity.toString(),
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.color),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 5, top: 10, bottom: 10),
                              child: SvgPicture.asset('assets/icons/date.svg',
                                  theme: const SvgTheme(
                                      currentColor: Colors.orange)),
                            ),
                            Text(
                                FilterData.filterReleaseDate(
                                    movies.releaseDate.toString()),
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.color))
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              movies.overview!,
                              textAlign: TextAlign.justify,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: state == false ? 13 : 16,
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 5,
            top: 10,
            child: IconButton(
                onPressed: () => context.go('/'),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
          BlocConsumer<MovieBloc, MovieState>(
            listener: (context, state) {
              if (state is MovieBookmark) {
                movies.isSaved = state.isSaved;
              }
            },
            builder: (context, state) {
              return Positioned(
                  top: 10,
                  right: 5.0,
                  child: IconButton(
                      onPressed: () => movies.isSaved == false
                          ? context
                              .read<MovieBloc>()
                              .add(OnSavedBookMark(movies: movies))
                          : context
                              .read<MovieBloc>()
                              .add(OnUnSavedBookMark(movies: movies)),
                      icon: Icon(Icons.favorite,
                          color: movies.isSaved == true
                              ? Colors.red
                              : Colors.white)));
            },
          )
        ],
      ),
    );
  }
}
