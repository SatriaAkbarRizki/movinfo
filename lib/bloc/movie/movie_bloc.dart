
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movinfo/model/movie.dart';
import 'package:movinfo/service/apimovie.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  List<List<MovieModel>?>? results;
  List<List<MovieModel>?>? get previous => results;

  MovieBloc() : super(MovieInitial()) {
    on<OnFetchAllCategory>((event, emit) async {
      List<String> categories = ['top_rated', 'popular', 'upcoming'];
      if (results == null) emit(MovieLoading());

      if (previous != null) {
        emit(MovieLoaded(previous![0], previous![1], previous![2], null));
      } else {
        List<Future<List<MovieModel>?>> fetchFutures = categories
            .map((category) => ApiMovie.fetchApiMovie(category))
            .toList();

        results = await Future.wait(fetchFutures);

        if (results == null) {
          emit(MovieFailure('Data is null'));
        } else {
          for (int index = 0; index < results!.length; index++) {
            for (int indexData = 0;
                indexData < results![index]!.length;
                indexData++) {
              if (results![index]![indexData].title ==
                  'Godzilla x Kong: The New Empire') {
                log('title: ${results![index]![indexData].title} and  status: ${results![index]![indexData].isSaved}');
              }
            }
          }
          emit(MovieLoaded(results![0], results![1], results![2], null));
        }
      }
    });

    on<OnSearchMovie>((event, emit) async {
      emit(MovieLoading());

      await ApiMovie.searchMovie(event.title).then((value) {
        if (value == null) {
          emit(MovieFailure('data is null'));
        } else {
          if (results!.isEmpty) {
            emit(MovieLoaded(null, null, null, value));
          } else {
            emit(MovieLoaded(results![0], results![1], results![2], value));
          }
        }
      });
    });

    on<OnSavedBookMark>((event, emit) {
      MovieModel movieModel = event.movies.copyWith(isSaved: true);

      for (int index = 0; index < results!.length; index++) {
        for (int indexData = 0;
            indexData < results![index]!.length;
            indexData++) {
          if (results![index]![indexData].title == movieModel.title) {
            results![index]![indexData] = movieModel;
            emit(MovieBookmark(isSaved: true));
            emit(MovieLoaded(results![0], results![1], results![2], null));
          }
        }
      }
    });

    on<OnUnSavedBookMark>((event, emit) {
      MovieModel movieModel = event.movies.copyWith(isSaved: false);

      for (int index = 0; index < results!.length; index++) {
        for (int indexData = 0;
            indexData < results![index]!.length;
            indexData++) {
          if (results![index]![indexData].title == movieModel.title) {
            results![index]![indexData] = movieModel;
            emit(MovieBookmark(isSaved: false));
            emit(MovieLoaded(results![0], results![1], results![2], null));
          }
        }
      }
    });
  }
}
