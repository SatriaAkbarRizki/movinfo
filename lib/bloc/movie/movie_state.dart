part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class MovieLoaded extends MovieState {
  final List<MovieModel>? moviesTop;
  final List<MovieModel>? moviesPopular;
  final List<MovieModel>? moviesUpComing;
  final List<MovieModel>? moviesSearch;

  MovieLoaded(this.moviesTop, this.moviesPopular, this.moviesUpComing,
      this.moviesSearch);
}

final class MovieBookmark extends MovieState {
    final bool isSaved;

  MovieBookmark({required this.isSaved});
}

final class MovieFailure extends MovieState {
  final String message;

  MovieFailure(this.message);
}
