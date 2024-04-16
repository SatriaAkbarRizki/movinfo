
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movinfo/bloc/movie/movie_bloc.dart';
import 'package:movinfo/screens/detail.dart';
import 'package:movinfo/widget/nothingbkmark.dart';

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

            if (movies.isEmpty) {
              return const NothingBookMark();
            }
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Padding(
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
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      movies[index].title!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: SvgPicture.asset(
                                          'assets/icons/like.svg',
                                          width: 15,
                                          theme: const SvgTheme(
                                              currentColor: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        movies[index].popularity.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: SvgPicture.asset(
                                          'assets/icons/date.svg',
                                          width: 15,
                                          theme: const SvgTheme(
                                              currentColor: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        FilterData.filterReleaseDate(
                                            movies[index]
                                                .releaseDate
                                                .toString()),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
