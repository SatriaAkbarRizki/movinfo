import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movinfo/service/filterData.dart';
import 'package:movinfo/widget/listmovie.dart';

import '../model/movie.dart';

class ListMovieRandomWidget extends StatelessWidget {
  final List<MovieModel> moviesPopular, moviesTop, moviesUpComing;
  late List<MovieModel> randomMovie;
  ListMovieRandomWidget(
      {super.key,
      required this.moviesPopular,
      required this.moviesTop,
      required this.moviesUpComing});

  @override
  Widget build(BuildContext context) {
    randomMovies();
    return ListMovieWidget(showExpanded: true, movies: randomMovie);
  }

  void randomMovies() {
    randomMovie = [...moviesPopular, ...moviesTop, ...moviesUpComing];
    randomMovie.toList().shuffle();
    FilterData.dataNotNull(randomMovie);
  }
}

// Card(
//       shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Padding(
//         padding: const EdgeInsets.only(left: 5, top: 15, right: 5, bottom: 15),
//         child: ListMovieWidget(showExpanded: true, movies: randomMovie),
//       ),
//     )