import '../model/movie.dart';

class FilterData {
  static String filterUrlImage(String url) {
    List<String> urlParts = url.split('/');
    String urlFilter = urlParts.last;
    String urlImage = "https://image.tmdb.org/t/p/w500/$urlFilter";
    return urlImage;
  }

  static String filterReleaseDate(String date) {
    List<String> filter = date.split('00:00:00.000');
    String result = filter.join();
    return result;
  }

  static List<MovieModel> dataNotNull(List<MovieModel> movies) {
    for (int i = 0; i < movies.length; i++) {
      if (movies[i].posterPath == null) {
        // log('Element is null: ${i.toString()}');
        movies.removeAt(i);
      }
    }
    return movies;
  }
}
