part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class MovieLoaded extends MovieState {
  final List<MovieModel> moviesTop;
  final List<MovieModel> moviesPopular;
  final List<MovieModel> moviesUpComing;

  MovieLoaded(this.moviesTop, this.moviesPopular, this.moviesUpComing);
}

final class MovieFailure extends MovieState {
  final String message;

  MovieFailure(this.message);
}
