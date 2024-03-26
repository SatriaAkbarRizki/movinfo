part of 'movie_bloc.dart';

@immutable
sealed class MovieEvent {}

class OnFetchAllCategory extends MovieEvent {}

class OnSearchMovie extends MovieEvent {
  final String title;

  OnSearchMovie({required this.title});
}
