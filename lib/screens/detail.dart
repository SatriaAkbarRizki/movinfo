import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    log('On Saved ?? ${movies.isSaved}');
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
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 30)],
                  ),
                  height: state == false
                      ? MediaQuery.of(context).size.height / 2.8
                      : MediaQuery.of(context).size.height / 1.5,
                ),
              );
            },
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
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xfff8f9fb),
                        borderRadius: BorderRadius.only(
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
                                  .copyWith(fontSize: 28, color: Colors.black),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                "assets/icons/popularity.png",
                                scale: 5.0,
                              ),
                            ),
                            Text(movies.popularity.toString()),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                "assets/icons/release_date.png",
                                scale: 5.0,
                              ),
                            ),
                            Text(FilterData.filterReleaseDate(
                                movies.releaseDate.toString()))
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              movies.overview!,
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: state == false ? 15 : 20,
                                      color: Colors.black),
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
