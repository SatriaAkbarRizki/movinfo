part of 'movie_bloc.dart';

@immutable
sealed class MovieEvent {}

class OnFetchAllCategory extends MovieEvent {}

class OnSearchMovie extends MovieEvent {
  final String title;

  OnSearchMovie({required this.title});
}

class OnSavedBookMark extends MovieEvent {
  final MovieModel movies;

  OnSavedBookMark({required this.movies});
}

class OnUnSavedBookMark extends MovieEvent {
  final MovieModel movies;

  OnUnSavedBookMark({required this.movies});
}
