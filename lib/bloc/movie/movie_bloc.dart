import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movinfo/model/movie.dart';
import 'package:movinfo/service/fetchmovie.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  List<MovieModel>? moviesCache;

  MovieBloc() : super(MovieInitial()) {
    on<OnFetchAllCategory>((event, emit) async {
      List<String> categories = ['top_rated', 'popular', 'upcoming'];
      if (moviesCache == null) emit(MovieLoading());

      List<Future<List<MovieModel>?>> fetchFutures = categories
          .map((category) => FetchApiMovie.fetchApiMovie(category))
          .toList();

      List<List<MovieModel>?> results = await Future.wait(fetchFutures);

      if (results.isEmpty) {
        emit(MovieFailure('Data is null'));
      } else {
        moviesCache = results[0]!;
        emit(MovieLoaded(results[0]!, results[1]!, results[2]!));
      }
    });
  }
}
