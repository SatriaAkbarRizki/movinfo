import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movinfo/bloc/movie/movie_bloc.dart';
import 'package:movinfo/screens/detail.dart';

import '../model/movie.dart';
import '../service/filterData.dart';

class BookmarkScreens extends StatelessWidget {
  late List<MovieModel> movies;
  BookmarkScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoaded) {
            List<MovieModel> bookmarkMovieTop = state.moviesTop!
                .where((element) => element.isSaved == true)
                .toList();
            List<MovieModel> bookmarkMoviePopular = state.moviesPopular!
                .where((element) => element.isSaved == true)
                .toList();
            List<MovieModel> bookmarkUpComing = state.moviesUpComing!
                .where((element) => element.isSaved == true)
                .toList();

            movies = [
              ...bookmarkMovieTop,
              ...bookmarkMoviePopular,
              ...bookmarkUpComing
            ];

            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 5),
                child: InkWell(
                  onTap: () => context.go(DetailScreen.routName,
                      extra: {'movies': movies[index]}),
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      FilterData.filterUrlImage(
                                          movies[index].posterPath!),
                                    )),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movies[index].title!,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Image.asset(
                                      "assets/icons/popularity.png",
                                      color: Colors.white,
                                      scale: 5.0,
                                    ),
                                  ),
                                  Text(
                                    movies[index].popularity.toString(),
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Image.asset(
                                      "assets/icons/release_date.png",
                                      color: Colors.white,
                                      scale: 5.0,
                                    ),
                                  ),
                                  Text(
                                    FilterData.filterReleaseDate(
                                        movies[index].releaseDate.toString()),
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
