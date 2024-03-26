import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movinfo/model/movie.dart';
import 'package:movinfo/service/apimovie.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  List<MovieModel>? moviesCache;

  MovieBloc() : super(MovieInitial()) {
    // Initialize moviesCache to an empty list
    moviesCache = [];

    on<OnFetchAllCategory>((event, emit) async {
      List<String> categories = ['top_rated', 'popular', 'upcoming'];
      if (moviesCache!.isEmpty) emit(MovieLoading());

      List<Future<List<MovieModel>?>> fetchFutures = categories
          .map((category) => ApiMovie.fetchApiMovie(category))
          .toList();

      List<List<MovieModel>?> results = await Future.wait(fetchFutures);

      if (results.isEmpty) {
        emit(MovieFailure('Data is null'));
      } else {
        moviesCache = results[0]!;
        emit(MovieLoaded(results[0]!, results[1]!, results[2]!, null));
      }
    });

    on<OnSearchMovie>((event, emit) async {
      emit(MovieLoading());

      await ApiMovie.searchMovie(event.title).then((value) {
        if (value == null) {
          emit(MovieFailure('data is null'));
        } else {
          if (moviesCache!.isEmpty) {
            emit(MovieLoaded(null, null, null, value));
          } else {
            emit(MovieLoaded(moviesCache, moviesCache, moviesCache, value));
          }
        }
      });
    });
  }
}
